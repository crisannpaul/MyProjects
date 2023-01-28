package business;

import data.CommandDAO;
import data.ProductDAO;
import model.Command;
import model.Product;

import javax.swing.*;
import java.util.List;
import java.util.NoSuchElementException;

public class CommandBLL implements AbstractBLL{
    private final CommandDAO commandDAO;

    public CommandBLL() {
        commandDAO = new CommandDAO();
    }
    public List<Command> findAll() {
        List<Command> commandList = commandDAO.findAll();
        if (commandList == null) {
            throw new NoSuchElementException("No commands found");
        }
        return commandList;
    }
    public Command findByID(int id) {
        Command o = commandDAO.findByID(id);
        if (o == null) {
            throw new NoSuchElementException("No command found");
        }
        return o;
    }

    public void insertInto(Command o) {
        ProductDAO pd = new ProductDAO();
        if (!isValidCommand(o)) {
            System.out.println("Not enough items in stock");
            throw new IllegalArgumentException("UnderStockError");
        }
        Product currentProduct = pd.findByID(o.getProductID());
        int updatedStock = currentProduct.getStock() - o.getQuantity();
        if(updatedStock < 0) {
            updatedStock = 0;
        }
        Product updatedProduct = new Product(o.getProductID(), currentProduct.getName(), currentProduct.getPrice(), updatedStock);
        pd.update(updatedProduct);
        commandDAO.insertInto(o);
    }
    public void update(Command o) {
        if (!isValidCommand(o)) {
            throw new IllegalArgumentException("Invalid command");
        }
        commandDAO.update(o);
    }
    public void delete(int id) {
        Command o = commandDAO.findByID(id);
        if (o == null) {
            throw new IllegalArgumentException("Invalid command");
        }
        commandDAO.delete(id);
    }

    public String[] getCollumnNames() {
        return commandDAO.getCollumnNames();
    }
    public String[][] getTableData() {
        try {
            return commandDAO.getTableData();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isValidCommand(Command o) {
        boolean valid = true;
        ProductDAO pd = new ProductDAO();
        valid = valid && (o.getId() > 0 && o.getClientID() > 0 && o.getProductID() > 0 && o.getQuantity() > 0);
        try {
            valid = valid && (pd.findByID(o.getProductID()).getStock() - o.getQuantity() >= 0);
        } catch(NullPointerException e) {
            e.printStackTrace();
            System.out.println("Understock Error");
        }
        return valid;
    }
}
