package fileWriter;

import model.Command;

import java.io.File;
import java.io.IOException;

public class FileWriter {
    public static void createTxtBill(Command c) {
        String pathname = "Comand nr. " + c.getId()+ ".txt";
        File bill = new File(pathname);
        try {
            bill.createNewFile();
            if(bill.exists()) {
                bill.delete();
            }
            java.io.FileWriter writer = new java.io.FileWriter(bill);
            writer.write(c.toString());
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
