package presentation.view;

import business.AbstractBLL;
import business.ProductBLL;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class ProductView extends JFrame {
    private JScrollPane sp;
    private JTable table;
    private JLabel jcomp2;
    private JTextField idTF;
    private JLabel jcomp4;
    private JLabel jcomp5;
    private JLabel jcomp6;
    private JTextField nameTF;
    private JTextField priceTF;
    private JTextField stockTF;
    private JButton createBTN;
    private JButton modify;
    private JButton delete;
    private AbstractBLL ab;

    public ProductView(AbstractBLL ab) {
        //construct preComponents
        this.ab = ab;
        initializeTable();

        jcomp2 = new JLabel("ID:");
        idTF = new JTextField(5);
        jcomp4 = new JLabel("Name:");
        jcomp5 = new JLabel("Price:");
        jcomp6 = new JLabel("Stock:");
        nameTF = new JTextField(5);
        priceTF = new JTextField(5);
        stockTF = new JTextField(5);
        createBTN = new JButton("Add");
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
        add(priceTF);
        add(stockTF);
        add(createBTN);
        add(modify);
        add(delete);

        //set component bounds (only needed by Absolute Positioning)
        sp.setBounds(175, 20, 405, 450);
        jcomp2.setBounds(15, 20, 30, 25);
        idTF.setBounds(40, 20, 120, 25);
        jcomp4.setBounds(15, 45, 100, 25);
        jcomp5.setBounds(15, 70, 100, 25);
        jcomp6.setBounds(15, 95, 100, 25);
        nameTF.setBounds(60, 45, 100, 25);
        priceTF.setBounds(55, 70, 105, 25);
        stockTF.setBounds(55, 95, 105, 25);
        createBTN.setBounds(15, 120, 145, 25);
        modify.setBounds(15, 145, 145, 25);
        delete.setBounds(15, 170, 145, 25);

        setTitle("Product");
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

    public String getID() {
        return idTF.getText();
    }
    public String getName() {
        return nameTF.getText();
    }
    public String getPrice() {
        return priceTF.getText();
    }
    public String getStock() {
        return stockTF.getText();
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
    private void enableTextFields(boolean enabled) {
        jcomp4.setEnabled(enabled);
        jcomp5.setEnabled(enabled);
        jcomp6.setEnabled(enabled);
        nameTF.setEnabled(enabled);
        priceTF.setEnabled(enabled);
        stockTF.setEnabled(enabled);
    }
}
