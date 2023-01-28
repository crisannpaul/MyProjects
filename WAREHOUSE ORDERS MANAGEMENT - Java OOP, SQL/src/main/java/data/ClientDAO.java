package data;

import model.Client;

import java.util.List;

public class ClientDAO extends AbstractDAO<Client> {
    public boolean checkExistance(int id) {
        List<Client> clientList = findAll();
        for(Client c : clientList) {
            if(c.getId() == id) return true;
        }
        return false;
    }
}
