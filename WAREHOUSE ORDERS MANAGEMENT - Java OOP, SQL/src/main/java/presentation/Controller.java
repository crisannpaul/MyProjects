package presentation;

import fileWriter.FileWriter;
import business.ClientBLL;
import business.CommandBLL;
import business.ProductBLL;
import model.Client;
import model.Command;
import model.Product;
import presentation.view.ClientView;
import presentation.view.CommandView;
import presentation.view.ProductView;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Controller {
    ClientView cv;
    ClientBLL cb;

    ProductView pv;
    ProductBLL pb;

    CommandView cmv;
    CommandBLL cmb;

    public Controller() {
        cb = new ClientBLL();
        cv = new ClientView(cb);
        cv.addAddListener(new AddClientListener());
        cv.addModifyListener(new ModifyClientListener());
        cv.addDeleteListener(new DeleteClientListener());

        pb = new ProductBLL();
        pv = new ProductView(pb);
        pv.addAddListener(new AddProductListener());
        pv.addModifyListener(new ModifyProductListener());
        pv.addDeleteListener(new DeleteProductListener());

        cmb = new CommandBLL();
        cmv = new CommandView(cmb);
        cmv.addAddListener(new AddCommandListener());
        cmv.addModifyListener(new ModifyCommandListener());
        cmv.addDeleteListener(new DeleteCommandListener());
    }

    public class AddClientListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(cv.getID());
            String name = cv.getName();
            int age = Integer.parseInt(cv.getAge());
            String email = cv.getEmail();
            cb.insertInto(new Client(id, name, age, email));
            cv.refresh();
        }
    }
    public class ModifyClientListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(cv.getID());
            String name = cv.getName();
            int age = Integer.parseInt(cv.getAge());
            String email = cv.getEmail();
            cb.update(new Client(id, name, age, email));
            cv.refresh();
        }
    }
    public class DeleteClientListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(cv.getID());
            cb.delete(id);
            cv.refresh();
        }
    }

    public class AddProductListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(pv.getID());
            String name = pv.getName();
            int price = Integer.parseInt(pv.getPrice());
            int stock = Integer.parseInt(pv.getStock());
            pb.insertInto(new Product(id, name, price, stock));
            pv.refresh();
        }
    }
    public class ModifyProductListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(pv.getID());
            String name = pv.getName();
            int age = Integer.parseInt(pv.getPrice());
            int stock = Integer.parseInt(pv.getStock());
            pb.update(new Product(id, name, age, stock));
            pv.refresh();
        }
    }
    public class DeleteProductListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(pv.getID());
            pb.delete(id);
            pv.refresh();
        }
    }

    public class AddCommandListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(cmv.getID());
            int clientID = Integer.parseInt(cmv.getClientID());
            int productID = Integer.parseInt(cmv.getProductID());
            int quantity = Integer.parseInt(cmv.getQuantity());
            Command c = new Command(id, clientID, productID, quantity);
            FileWriter.createTxtBill(c);
            cmb.insertInto(c);
            cmv.refresh();
            pv.refresh();
        }
    }
    public class ModifyCommandListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(cmv.getID());
            int clientID = Integer.parseInt(cmv.getClientID());
            int productID = Integer.parseInt(cmv.getProductID());
            int quantity = Integer.parseInt(cmv.getQuantity());
            cmb.update(new Command(id, clientID, productID, quantity));
            cmv.refresh();
        }
    }
    public class DeleteCommandListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int id = Integer.parseInt(cmv.getID());
            cmb.delete(id);
            cmv.refresh();
        }
    }

}
