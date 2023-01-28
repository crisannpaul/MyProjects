package data;

import model.Client;
import model.Product;

import java.util.List;

public class ProductDAO extends AbstractDAO<Product>{
    public boolean checkExistance(int id) {
        List<Product> productList = findAll();
        for(Product p : productList) {
            if(p.getId() == id) return true;
        }
        return false;
    }
}
