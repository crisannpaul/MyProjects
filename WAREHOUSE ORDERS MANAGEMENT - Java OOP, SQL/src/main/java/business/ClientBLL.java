package business;

import data.ClientDAO;
import model.Client;

import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

public class ClientBLL implements AbstractBLL{
    private final ClientDAO clientDAO;

    public ClientBLL(){
        clientDAO = new ClientDAO();
    }

    public List<Client> findAll() {
        List<Client> clientList = clientDAO.findAll();
        if(clientList == null) {
            throw new NoSuchElementException("No clients found");
        }
        return clientList;
    }
    public Client findByID(int id){
        Client c = clientDAO.findByID(id);
        if(c == null) {
            throw new NoSuchElementException("No client found");
        }
        return c;
    }
    public void insertInto(Client c) {
        if(!isValidClient(c)) {
            throw new IllegalArgumentException("Invalid client");
        }
        clientDAO.insertInto(c);
    }
    public void update(Client c) {
        if(!isValidClient(c)) {
            throw new IllegalArgumentException("Invalid client");
        }
        clientDAO.update(c);
    }
    public void delete(int id) {
        Client c = clientDAO.findByID(id);
        if(c == null) {
            throw new IllegalArgumentException("Invalid client");
        }
        clientDAO.delete(id);
    }

    public String[] getCollumnNames() {
        return clientDAO.getCollumnNames();
    }
    public String[][] getTableData() {
        try {
            return clientDAO.getTableData();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isValidClient(Client c) {
        return c.getId() != 0 && c.getName() != null && c.getAge() > 0 && c.getEmail() != null;
    }
}
