package data;

import connection.ConnectionFactory;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class AbstractDAO<T> {

    private final Class<T> type;

    @SuppressWarnings("unchecked")
    public AbstractDAO() {
        this.type = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    /**
     * Finds the whole content of a table
     * @return List of all generic elements from a db
     */
    public List<T> findAll() {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append(" * ");
        sb.append(" FROM ");
        sb.append(type.getSimpleName());
        String query = sb.toString();
        try {
            conn = ConnectionFactory.getConnection();
            statement = conn.prepareStatement(query);
            resultSet = statement.executeQuery();
            return createObjects(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionFactory.close(conn);
            ConnectionFactory.close(statement);
            ConnectionFactory.close(resultSet);
        }
        return null;
    }
    /**
     * Finds the element with the given id
     * @param id element id
     * @return the element
     */
    public T findByID(int id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String query = createSelectWhereIdQuery(id);
        try {
            conn = ConnectionFactory.getConnection();
            statement = conn.prepareStatement(query);
            resultSet = statement.executeQuery();
            return createObjects(resultSet).get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IndexOutOfBoundsException e) {
            e.printStackTrace();
            System.out.println("No items found");
        }
        return null;
    }
    /**
     * Inserts an element into the db
     * @param t generic element
     */
    public void insertInto(T t) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            String insert = createInsertStatement(t);
            conn = ConnectionFactory.getConnection();
            statement = conn.prepareStatement(insert);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Foreign key constraint error");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
    /**
     * Updates an element from the db
     * @param t
     */
    public void update(T t) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            String update = createUpdateStatement(t);
            conn = ConnectionFactory.getConnection();
            statement = conn.prepareStatement(update);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
    /**
     * Deletes the element with the given id
     * @param id element id
     */
    public void delete(int id) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            String delete = createDeleteStatement(id);
            conn = ConnectionFactory.getConnection();
            statement = conn.prepareStatement(delete);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }


    /**
     * Creates a select query with a given id
     * @param id element id
     * @return the element with the given id
     */
    private String createSelectWhereIdQuery(int id) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append("* ");
        sb.append("FROM ");
        sb.append(type.getSimpleName());
        sb.append(" WHERE ").append("id").append(" = ");
        sb.append(id);
        return sb.toString();
    }
    /**
     * Creates an insert statement
     * @param t inserted element
     * @return the insert statement
     * @throws IllegalAccessException
     */
    private String createInsertStatement(T t) throws IllegalAccessException {
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT ");
        sb.append("INTO ");
        sb.append(type.getSimpleName().toLowerCase(Locale.ROOT));
        sb.append("( ");
        for(String s : getCollumnNames()) {
            sb.append(s);
            sb.append(", ");
        }
        sb.deleteCharAt(sb.length() - 2);
        sb.append(") ");
        sb.append("VALUES ");
        sb.append("( ");
        for (Field f : type.getDeclaredFields()) {
            f.setAccessible(true);
            Object o = f.get(t);
            sb.append("'");
            sb.append(o);
            sb.append("' ");
            sb.append(", ");
        }
            sb.deleteCharAt(sb.length() - 2);
            sb.append(")");
            sb.append(";");
            return sb.toString();
    }
    /**
     * Creates an update statemet
     * @param t the nre element
     * @return the update statement
     * @throws IllegalAccessException
     */
    private String createUpdateStatement(T t) throws IllegalAccessException {
        int id = 0;
        StringBuilder sb = new StringBuilder();
        sb.append(" UPDATE ");
        sb.append(type.getSimpleName().toLowerCase(Locale.ROOT));
        sb.append(" SET ");
        for(Field f : type.getDeclaredFields()) {
            f.setAccessible(true);
            String fieldName = f.getName();
            Object o = f.get(t);
            if(!fieldName.equals("id")) {
                sb.append(fieldName);
                sb.append(" = ");
                sb.append(" \" ");
                sb.append(o);
                sb.append(" \" ");
                sb.append(" , ");
            } else {
                id = Integer.parseInt(o.toString());
            }
        }
        sb.deleteCharAt(sb.length() - 2);
        sb.append(" WHERE ");
        sb.append(" id = ");
        sb.append(id);
        return sb.toString();
    }
    /**
     * Createa a delete statemnt
     * @param id element id
     * @return the delete stament
     * @throws IllegalAccessException
     */
    public String createDeleteStatement(int id) throws IllegalAccessException {
        StringBuilder sb = new StringBuilder();
        sb.append("DELETE ");
        sb.append(" FROM ");
        sb.append(type.getSimpleName().toLowerCase(Locale.ROOT));
        sb.append(" WHERE ");
        sb.append(" id = ");
        sb.append(id);
        return sb.toString();
    }


    /**
     * Creates a list of objects from a query result
     * @param resultSet the query resultSet
     * @return List of generic elements
     */
    public List<T> createObjects(ResultSet resultSet) {
        List<T> resultList = new ArrayList<T>();
        try {
            while(resultSet.next()) {
                T instance = type.newInstance();
                for(Field f : type.getDeclaredFields()) {
                    Object value = resultSet.getObject(f.getName());
                    PropertyDescriptor pd = new PropertyDescriptor(f.getName(), type);
                    Method m = pd.getWriteMethod();
                    m.invoke(instance, value);
                }
                resultList.add(instance);
            }
            return resultList;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IntrospectionException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * Gets table collumn names
     * @return array of collumn names
     */
    public String[] getCollumnNames() {
        List<String> collumnNames = new ArrayList<String>();
        for(Field f : type.getDeclaredFields()) {
            f.setAccessible(true);
            collumnNames.add(f.getName());
        }
        return collumnNames.toArray(new String[0]);
    }
    /**
     * Builds the matrix of data
     * @return matrix of data forthe Jtable
     * @throws IllegalAccessException
     */
    public String[][] getTableData() throws IllegalAccessException {
        List<T> objectList = findAll();
        String[][] tableData = new String[objectList.size()][type.getDeclaredFields().length];

        int i = 0;
        for(T object : objectList) {
            int j = 0;
            for(Field f : type.getDeclaredFields()) {
                f.setAccessible(true);
                Object value = f.get(object);
                tableData[i][j] = String.valueOf(value);
                j++;
            }
            i++;
        }
        return tableData;
    }
}
