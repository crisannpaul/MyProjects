package view;

import javax.swing.*;
import java.awt.*;

public class EmployeeView extends JFrame {
    private JLabel employeeL;
    private JTextArea orderTA;
    private JScrollPane orderSP;

    public EmployeeView(String username) {
        //construct components
        employeeL = new JLabel ("Employee: " + username);
        orderTA = new JTextArea ();
        orderSP = new JScrollPane(orderTA);

        //adjust size and set layout
        setPreferredSize (new Dimension(273, 300));
        setLayout (null);

        //add components
        add (employeeL);
        add (orderSP);

        //set component bounds (only needed by Absolute Positioning)
        employeeL.setBounds (20, 20, 200, 35);
        orderSP.setBounds (20, 60, 215, 180);

        employeeL.setFont(employeeL.getFont().deriveFont(15.0f));

        setTitle(username);
        pack();
        setVisible (true);
    }

    public void notifyEmployee(String recipt) {
        orderTA.setText(recipt);
    }
}
