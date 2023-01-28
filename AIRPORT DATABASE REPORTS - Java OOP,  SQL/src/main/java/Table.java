import java.util.ArrayList;
import org.grios.tableadapter.DefaultTableAdapter;
import java.util.Collection;

import javax.swing.JTable;

import javafx.application.Application;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class Table extends Application {
	

	public static void populate(String title, String query) {
		try {
			
			TableView table = new TableView();;
			
			QueryData result = new QueryData();
			result.getData(query);
			String[][] temp = result.getData();
			
			int nrRows = result.getNrRows();
			int nrColl = result.getNrColl();
	
			String[] coll = new String[nrColl];
			String[][] data = new String[nrRows - 1][nrColl];
			
			for(int i = 0; i < nrColl; i++) {
				coll[i] = temp[0][i];
				System.out.print(coll[i] + " ");
			}
			
			System.out.print("\n");
			
			for(int i = 0; i < nrRows - 1; i++) {
				for(int j = 0; j < nrColl; j++) {
					data[i][j] = temp[i + 1][j];
					System.out.print(data[i][j] + " ");
				}
				System.out.print("\n");
			}
			
			DefaultTableAdapter dta = new DefaultTableAdapter(table, data, coll);
			
			VBox layout = new VBox();
			layout.getChildren().add(table);
			
			Scene scene = new Scene(layout, 500, 400);
			
			Stage window = new Stage();
			window.setTitle(title);
			window.setScene(scene);
			window.show();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void start(Stage arg0) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
