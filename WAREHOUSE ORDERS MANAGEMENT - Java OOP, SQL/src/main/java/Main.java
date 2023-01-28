import business.ClientBLL;
import business.CommandBLL;
import business.ProductBLL;
import model.Client;
import model.Command;
import model.Product;
import presentation.Controller;

public class Main {
    public static void main(String[] args) throws IllegalAccessException {
        ClientBLL cb = new ClientBLL();
        ProductBLL pb = new ProductBLL();
        CommandBLL cmb = new CommandBLL();
        Client c = new Client(99, "Nu mai stiu", 42, "horea@mama.com");
        Product p = new Product(11, "Armando", 250, 10);
        Command cm = new Command(4, 1, 1, 2);
        //cmb.insertInto(cm);
        //cb.insertInto(c);
        //pb.insertInto(p);
        Controller controller = new Controller();
    }
}
