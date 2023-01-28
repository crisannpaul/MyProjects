package model;

public class Command {
    private int id;
    private int clientID;
    private int productID;
    private int quantity;

    public Command(int id, int clientID, int productID, int quantity) {
        this.id = id;
        this.clientID = clientID;
        this.productID = productID;
        this.quantity = quantity;
    }
    public Command(){};

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getClientID() {
        return clientID;
    }
    public void setClientID(int clientID) {
        this.clientID = clientID;
    }
    public int getProductID() {
        return productID;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Command " +
                "ID=" + id +
                ", Client ID=" + clientID +
                ", Product=" + productID +
                ", Quantity=" + quantity
                + "\n";
    }
}
