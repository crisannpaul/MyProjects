package controller;

import business.DeliveryService;
import business.SearchAndReports;
import business.product.BaseProduct;
import business.product.MenuItem;
import business.users.Client;
import business.users.Roles;
import business.users.User;
import view.AdminView;
import view.ClientView;
import view.EmployeeView;
import view.LoginView;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class Controller {
    private DeliveryService deliveryService;

    private LoginView loginView;
    private AdminView adminView;
    private ClientView clientView;
    private ArrayList<EmployeeView> employeeViews;

    public Controller() {
        deliveryService = new DeliveryService();
        loginView = new LoginView();
        adminView = new AdminView();
        clientView = new ClientView();
        employeeViews = new ArrayList<EmployeeView>();

        loginView.addLoginListener(new LoginListener());
        loginView.addRegisterListener(new RegisterListener());

        adminView.addImportListener(new ImportListener());
        adminView.addAddBaseListener(new AddBaseListener());
        adminView.addSelectListener(new SelectListener());
        adminView.addAddCompositeListener(new AddCompositeListener());
        adminView.addDeleteListener(new DeleteListener());
        adminView.addReport1Listener(new Report1Listener());
        adminView.addReport4Listener(new Report4Listener());

        clientView.addAddListener(new AddListener());
        clientView.addOrderListener(new OrderListener());
        clientView.addSearchListener(new SearchListener());
        clientView.setMenuItems(deliveryService.getMenuItemsString(deliveryService.getMenuItemsList()));
    }

    //login view
    class LoginListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String username = loginView.getUsername();
            char[] password = loginView.getPassword();
            for (User u : deliveryService.getUserList()) {
                if (u.getUsername().equals(username) && Arrays.equals(u.getPassword(), password)) {
                    if (u.getRole().equals(Roles.ADMIN)) {
                        adminView.setVisible(true);
                    } else if (u.getRole().equals(Roles.EMPLOYEE)) {
                        employeeViews.add(new EmployeeView(u.getUsername()));
                    } else if (u.getRole().equals(Roles.CLIENT)) {
                        clientView.setVisible(true);
                        clientView.setClientID(((Client) u).getID());
                    }
                }
            }
        }
    }

    class RegisterListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int clientID = deliveryService.getUserList().size();
            String username = loginView.getUsername();
            char[] password = loginView.getPassword();
            deliveryService.addUser(new Client(clientID, username, password));
            loginView.displayMessage("Succesfully registered");
        }
    }

    //admin view
    class ImportListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            deliveryService.importMenuItems("products.csv");
            updateViews();
        }
    }
    class AddBaseListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String[] productInfo = adminView.getProductInfo();
            String title = productInfo[0];
            int calories = Integer.parseInt(productInfo[1]);
            int protein = Integer.parseInt(productInfo[2]);
            int fat = Integer.parseInt(productInfo[3]);
            int sodium = Integer.parseInt(productInfo[4]);
            int price = Integer.parseInt(productInfo[5]);
            deliveryService.addMenuItem(new BaseProduct(title, 0, calories, protein, fat, sodium, price));
            updateViews();
        }
    }
    class SelectListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            BaseProduct selectedItem = (BaseProduct) deliveryService.getMenuItemsList().get(adminView.getSelectedIndex());
            deliveryService.addSelectedItem(selectedItem);
        }
    }
    class AddCompositeListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            if(!deliveryService.getSelectedItemsList().isEmpty()) {
                deliveryService.addCompositeItem(adminView.getCompositeTitle());
            }
            updateViews();
        }
    }
    class DeleteListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int index = adminView.getSelectedIndex();
            deliveryService.getMenuItemsList().remove(index);
            updateViews();
        }
    }

    //client view
    class AddListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            MenuItem selectedItem = deliveryService.getMenuItemsList().get(clientView.getSelectedItem());
            deliveryService.getClientOrder().add(selectedItem);
        }
    }
    class OrderListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String receipt = deliveryService.createOrder(clientView.getClientID());
            for(EmployeeView ev : employeeViews) {
                ev.notifyEmployee(receipt);
            }
        }
    }
    class SearchListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String criteria = clientView.getSearchCriteria();
            String conditions = clientView.getSearchConditions();
            clientView.displaySearchResults(SearchAndReports.searchMenuItems(criteria, conditions, deliveryService.getMenuItemsList()));
        }
    }
    class Report1Listener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            Date startDate = deliveryService.getCreationDate();
            Date endDate = new Date();
            adminView.displayMessage(SearchAndReports.report1(startDate, endDate, deliveryService.getOrderList()));
        }
    }
    class Report4Listener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            //SearchAndReports.report4(new Date(), deliveryService.getOrderList());
        }
    }

    public void updateViews() {
        clientView.setMenuItems(deliveryService.getMenuItemsString(deliveryService.getMenuItemsList()));
        adminView.setMenuItems(deliveryService.getMenuItemsString(deliveryService.getMenuItemsList()));
    }
}