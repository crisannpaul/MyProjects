package presentation.view;

import business.AbstractBLL;
import business.CommandBLL;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class CommandView extends JFrame {

    private JScrollPane sp;
    private JTable table;
    private JLabel jcomp2;
    private JTextField idTF;
    private JLabel jcomp4;
    private JLabel jcomp5;
    private JLabel jcomp6;
    private JTextField nameTF;
    private JTextField ageTF;
    private JTextField emailTF;
    private JButton createBTN;
    private JButton modify;
    private JButton delete;
    private AbstractBLL ab;

    public CommandView(AbstractBLL ab) {
        //construct preComponents
        this.ab = ab;
        initializeTable();

        //construct components
        jcomp2 = new JLabel("Order ID:");
        idTF = new JTextField(5);
        jcomp4 = new JLabel("Client ID:");
        jcomp5 = new JLabel("Product ID:");
        jcomp6 = new JLabel("Quantity:");
        nameTF = new JTextField(5);
        ageTF = new JTextField(5);
        emailTF = new JTextField(5);
        createBTN = new JButton("Place Order");
        modify = new JButton("Modify");
        delete = new JButton("Delete ID");

        //adjust size and set layout
        setPreferredSize (new Dimension(613, 525));
        setLayout (null);


        //add components
        add(sp);
        add(jcomp2);
        add(idTF);
        add(jcomp4);
        add(jcomp5);
        add(jcomp6);
        add(nameTF);
        add(ageTF);
        add(emailTF);
        add(createBTN);
        add(modify);
        add(delete);

        //set component bounds (only needed by Absolute Positioning)
        sp.setBounds(175, 20, 405, 450);
        jcomp2.setBounds(15, 20, 55, 25);
        idTF.setBounds(70, 20, 90, 25);
        jcomp4.setBounds(15, 45, 100, 25);
        jcomp5.setBounds(15, 70, 100, 25);
        jcomp6.setBounds(15, 95, 100, 25);
        nameTF.setBounds(70, 45, 90, 25);
        ageTF.setBounds(80, 70, 80, 25);
        emailTF.setBounds(70, 95, 90, 25);
        createBTN.setBounds(15, 120, 145, 25);
        modify.setBounds(15, 145, 145, 25);
        delete.setBounds(15, 170, 145, 25);

        setTitle("Command");
        pack();
        setVisible(true);
    }

    public void initializeTable() {
        String[] collumnNames = ab.getCollumnNames();
        String[][] tableData = ab.getTableData();
        table = new JTable (new DefaultTableModel(tableData, collumnNames));
        table.setModel(new DefaultTableModel(tableData, collumnNames));
        sp = new JScrollPane(table);
        sp.setBorder(BorderFactory.createLineBorder(Color.black));
    }
    public void refresh(){
        String[] collumnNames = ab.getCollumnNames();
        String[][] tableData = ab.getTableData();
        table.setModel(new DefaultTableModel(tableData, collumnNames));
    }
    private void enableTextFields(boolean enabled) {
        jcomp4.setEnabled(enabled);
        jcomp5.setEnabled(enabled);
        jcomp6.setEnabled(enabled);
        nameTF.setEnabled(enabled);
        ageTF.setEnabled(enabled);
        emailTF.setEnabled(enabled);
    }


    public String getID() {
        return idTF.getText();
    }
    public String getClientID() {
        return nameTF.getText();
    }
    public String getProductID() {
        return ageTF.getText();
    }
    public String getQuantity() {
        return emailTF.getText();
    }

    public void addAddListener(ActionListener a) {
        createBTN.addActionListener(a);
    }
    public void addModifyListener(ActionListener a) {
        modify.addActionListener(a);
    }
    public void addDeleteListener(ActionListener a) {
        delete.addActionListener(a);
        delete.addMouseListener(new DeleteListener());
    }

    class DeleteListener implements MouseListener {
        public void mouseEntered(MouseEvent event)
        {
            enableTextFields(false);
        }
        public void mouseExited(MouseEvent event)
        {
            enableTextFields(true);
        }
        public void mousePressed(MouseEvent event) { }
        public void mouseReleased(MouseEvent event) { }
        public void mouseClicked(MouseEvent event) { }
    }
}
