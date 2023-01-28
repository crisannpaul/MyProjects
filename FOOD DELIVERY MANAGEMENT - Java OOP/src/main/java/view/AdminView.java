package view;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class AdminView extends JFrame{
    private JLabel jcomp1;
    private JLabel jcomp2;
    private JTextField nameTF;
    private JLabel jcomp4;
    private JTextField caloriesTF;
    private JLabel jcomp6;
    private JTextField proteinTF;
    private JLabel jcomp8;
    private JTextField fatTF;
    private JLabel jcomp10;
    private JTextField sodiumTF;
    private JLabel jcomp12;
    private JTextField priceTF;
    private JButton addBaseBTN;
    private JList menuL;
    private JScrollPane menuSP;
    private JButton selectBTN;
    private JButton addCompositeBTN;
    private JLabel jcomp18;
    private JTextField compositeNameTF;
    private JLabel jcomp20;
    private JButton deleteBTN;
    private JButton report1BTN;
    private JButton report2BTN;
    private JButton report3BTN;
    private JButton report4BTN;
    private JButton importBTN;

    public AdminView() {
        //construct preComponents
        String[] menuLItems = {};

        //construct components
        jcomp1 = new JLabel ("Base Product");
        jcomp2 = new JLabel ("Name:");
        nameTF = new JTextField (5);
        jcomp4 = new JLabel ("Calories:");
        caloriesTF = new JTextField (5);
        jcomp6 = new JLabel ("Protein:");
        proteinTF = new JTextField (5);
        jcomp8 = new JLabel ("Fat:");
        fatTF = new JTextField (5);
        jcomp10 = new JLabel ("Sodium:");
        sodiumTF = new JTextField (5);
        jcomp12 = new JLabel ("Price:");
        priceTF = new JTextField (5);
        addBaseBTN = new JButton ("Add Base Product");
        menuL = new JList (menuLItems);
        menuSP = new JScrollPane(menuL);
        selectBTN = new JButton ("Select");
        addCompositeBTN = new JButton ("Add Composite Product");
        jcomp18 = new JLabel ("Name:");
        compositeNameTF = new JTextField (5);
        jcomp20 = new JLabel ("Composite Product");
        deleteBTN = new JButton ("Delete");
        report1BTN = new JButton ("Report #1");
        report2BTN = new JButton ("Report #2");
        report3BTN = new JButton ("Report #3");
        report4BTN = new JButton ("Report #4");
        importBTN = new JButton ("Import");

        //adjust size and set layout
        setPreferredSize (new Dimension (625, 315));
        setLayout (null);

        //add components
        add (jcomp1);
        add (jcomp2);
        add (nameTF);
        add (jcomp4);
        add (caloriesTF);
        add (jcomp6);
        add (proteinTF);
        add (jcomp8);
        add (fatTF);
        add (jcomp10);
        add (sodiumTF);
        add (jcomp12);
        add (priceTF);
        add (addBaseBTN);
        add (menuSP);
        add (selectBTN);
        add (addCompositeBTN);
        add (jcomp18);
        add (compositeNameTF);
        add (jcomp20);
        add (deleteBTN);
        add (report1BTN);
        add (report2BTN);
        add (report3BTN);
        add (report4BTN);
        add (importBTN);

        jcomp1.setFont(jcomp1.getFont().deriveFont(15.0f));
        jcomp20.setFont(jcomp1.getFont());

        //set component bounds (only needed by Absolute Positioning)
        jcomp1.setBounds (35, 30, 100, 25);
        jcomp2.setBounds (35, 60, 100, 25);
        nameTF.setBounds (75, 60, 100, 25);
        jcomp4.setBounds (35, 85, 100, 25);
        caloriesTF.setBounds (90, 85, 85, 25);
        jcomp6.setBounds (35, 110, 100, 25);
        proteinTF.setBounds (85, 110, 90, 25);
        jcomp8.setBounds (35, 135, 100, 25);
        fatTF.setBounds (60, 135, 115, 25);
        jcomp10.setBounds (35, 160, 100, 25);
        sodiumTF.setBounds (85, 160, 90, 25);
        jcomp12.setBounds (35, 185, 100, 25);
        priceTF.setBounds (70, 185, 105, 25);
        addBaseBTN.setBounds (30, 220, 145, 30);
        menuSP.setBounds (205, 85, 250, 95);
        selectBTN.setBounds (240, 220, 80, 30);
        addCompositeBTN.setBounds (240, 185, 170, 30);
        jcomp18.setBounds (205, 60, 100, 25);
        compositeNameTF.setBounds (245, 60, 210, 25);
        jcomp20.setBounds (205, 30, 140, 25);
        deleteBTN.setBounds (330, 220, 80, 30);
        report1BTN.setBounds (485, 60, 90, 30);
        report2BTN.setBounds (485, 100, 90, 30);
        report3BTN.setBounds (485, 140, 90, 30);
        report4BTN.setBounds (485, 180, 90, 30);
        importBTN.setBounds (485, 220, 90, 30);

        setTitle("Admin");
        pack();
    }

    public void setMenuItems(String[] menuItems) {
        menuL.setListData(menuItems);
    }

    public String[] getProductInfo() {
        String[] productInfo = new String[6];
        productInfo[0] = nameTF.getText();
        productInfo[1] = caloriesTF.getText();
        productInfo[2] = proteinTF.getText();
        productInfo[3] = fatTF.getText();
        productInfo[4] = sodiumTF.getText();
        productInfo[5] = priceTF.getText();
        return productInfo;
    }

    public int getSelectedIndex() {
        return menuL.getSelectedIndex();
    }

    public String getCompositeTitle() {
        return compositeNameTF.getText();
    }

    public void addImportListener(ActionListener a) {
        importBTN.addActionListener(a);
    }

    public void addAddBaseListener(ActionListener a) {
        addBaseBTN.addActionListener(a);
    }

    public void addAddCompositeListener(ActionListener a) {
        addCompositeBTN.addActionListener(a);
    }

    public void addSelectListener(ActionListener a) {
        selectBTN.addActionListener(a);
    }

    public void addDeleteListener(ActionListener a) {
        deleteBTN.addActionListener(a);
    }

    public void addReport1Listener(ActionListener a) {
        report1BTN.addActionListener(a);
    }

    public void addReport4Listener(ActionListener a) {
        report4BTN.addActionListener(a);
    }

    public void displayMessage(String message) {
        JOptionPane.showMessageDialog(this, message);
    }
}
