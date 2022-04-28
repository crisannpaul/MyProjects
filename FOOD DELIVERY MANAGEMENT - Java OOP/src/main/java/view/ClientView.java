package view;

import business.users.Client;

import java.awt.*;
import java.awt.event.ActionListener;
import javax.swing.*;

public class ClientView extends JFrame {
    private JList menuLST;
    private JScrollPane menuSP;
    private JLabel jcomp2;
    private JButton addBTN;
    private JButton orderBTN;
    private JLabel jcomp5;
    private JTextField searchTF;
    private JComboBox criteriaCB;
    private JLabel jcomp8;
    private JButton searchBTN;
    private JList searchResultTA;
    private JScrollPane searchResultSP;
    private int clientID;

    public ClientView() {
        //construct preComponents
        String[] menuItems = {};
        String[] criteriaCBItems = {"Name", "Rating", "Calories", "Protein", "Fat", "Sodium", "Price"};

        //construct components
        menuLST = new JList (menuItems);
        menuSP = new JScrollPane(menuLST);
        jcomp2 = new JLabel ("Menu:");
        addBTN = new JButton ("Add");
        orderBTN = new JButton ("Order");
        jcomp5 = new JLabel ("Search Menu:");
        searchTF = new JTextField (5);
        criteriaCB = new JComboBox (criteriaCBItems);
        jcomp8 = new JLabel ("By :");
        searchBTN = new JButton ("Search");
        searchResultTA = new JList ();
        searchResultSP = new JScrollPane(searchResultTA);

        //adjust size and set layout
        setPreferredSize (new Dimension (595, 265));
        setLayout (null);

        //add components
        add (menuSP);
        add (jcomp2);
        add (addBTN);
        add (orderBTN);
        add (jcomp5);
        add (searchTF);
        add (criteriaCB);
        add (jcomp8);
        add (searchBTN);
        add (searchResultSP);

        //set component bounds (only needed by Absolute Positioning)
        menuSP.setBounds (40, 55, 230, 110);
        jcomp2.setBounds (40, 30, 100, 25);
        addBTN.setBounds (40, 170, 100, 25);
        orderBTN.setBounds (170, 170, 100, 25);
        jcomp5.setBounds (315, 30, 100, 25);
        searchTF.setBounds (315, 55, 230, 25);
        criteriaCB.setBounds (340, 85, 105, 25);
        jcomp8.setBounds (315, 85, 25, 25);
        searchBTN.setBounds (455, 85, 90, 25);
        searchResultSP.setBounds (310, 115, 235, 80);

        setTitle("Client Menu");
        pack();
    }

    public void setMenuItems(String[] menuItems) {
        menuLST.setListData(menuItems);
    }

    public int getSelectedItem() {
        return menuLST.getSelectedIndex();
    }

    public String getSearchCriteria() { return (String) criteriaCB.getSelectedItem(); }

    public String getSearchConditions() { return searchTF.getText(); }

    public void displaySearchResults(String[] searchResults) {
        searchResultTA.setListData(searchResults);
    }

    public void displayMessage(String message) {
        JOptionPane.showMessageDialog(this, message);
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }

    public int getClientID() {return this.clientID;}

    public void addAddListener(ActionListener a) {
        addBTN.addActionListener(a);
    }

    public void addOrderListener(ActionListener a) {
        orderBTN.addActionListener(a);
    }

    public void addSearchListener(ActionListener a) {searchBTN.addActionListener(a);}
}
