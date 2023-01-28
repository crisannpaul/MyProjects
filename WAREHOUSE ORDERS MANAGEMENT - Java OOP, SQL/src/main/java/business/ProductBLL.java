package business;

import data.ClientDAO;
import data.ProductDAO;
import model.Client;
import model.Product;

import java.util.List;
import java.util.NoSuchElementException;

public class ProductBLL implements AbstractBLL{
    private final ProductDAO productDAO;

    public ProductBLL(){
        productDAO = new ProductDAO();
    }

    public List<Product> findAll() {
        List<Product> productList = productDAO.findAll();
        if(productList == null) {
            throw new NoSuchElementException("No products found");
        }
        return productList;
    }
    public Product findByID(int id){
        Product p = productDAO.findByID(id);
        if(p == null) {
            throw new NoSuchElementException("No product found");
        }
        return p;
    }
    public void insertInto(Product p) {
        if(!isValidProduct(p)) {
            throw new IllegalArgumentException("Invalid product");
        }
        productDAO.insertInto(p);
    }
    public void update(Product p) {
        if(!isValidProduct(p)) {
            throw new IllegalArgumentException("Invalid product");
        }
        productDAO.update(p);
    }
    public void delete(int id) {
        Product p = productDAO.findByID(id);
        if(p == null) {
            throw new IllegalArgumentException("Invalid product");
        }
        productDAO.delete(id);
    }

    public String[] getCollumnNames() {
        return productDAO.getCollumnNames();
    }
    public String[][] getTableData() {
        try {
            return productDAO.getTableData();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isValidProduct(Product p) {
        return p.getId() != 0 && p.getName() != null && p.getPrice() > 0 && p.getStock() > 0;
    }
}
