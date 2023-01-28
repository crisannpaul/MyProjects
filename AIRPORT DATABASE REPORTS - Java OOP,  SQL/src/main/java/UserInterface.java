import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.io.FileInputStream;
import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.Window;
import javafx.scene.image.ImageView;

public class UserInterface extends Application{
	
	private static TableView table = new TableView();

	Button query1 = new Button("Query 10.03 a)");
	Button query2 = new Button("Query 10.03 b)");
	Button query3 = new Button("Query 10.04 a)");
	Button query4 = new Button("Query 10.04 b)");
	Button query5 = new Button("Query 10.05 a)");
	Button query6 = new Button("Query 10.05 b)");
	Button query7 = new Button("Query 10.06 a)");
	Button query8 = new Button("Query 10.06 b)");
	Button query9 = new Button("Display catalog prices");
	Button func = new Button("Raise prices by 5%");
	
	public void start(Stage primaryStage) throws Exception {
		
		query1.setOnAction(e -> Table.populate("Numele si culoarea pieselor al carornume se termina cu 'a', ordonat crescator dupa nume si culoare", "SELECT numep, culoare FROM piese WHERE numep LIKE '%a' ORDER BY culoare ASC, numep ASC;"));
		query2.setOnAction(e -> Table.populate("Furnizorii a caror adresa contine 'Bistrita', ordonati crescator dupa adresa", "SELECT * FROM furnizori WHERE adresa LIKE '%Bistrita%' ORDER BY adresa DESC"));
		query3.setOnAction(e -> Table.populate("Numef, numep, pret, cantitate pentru piese intre 5 si 35 RON", "SELECT furnizori.numef, piese.numep, catalog.pret FROM furnizori INNER JOIN catalog ON (furnizori.id_f = catalog.id_f) INNER JOIN piese ON (catalog.id_p = piese.id_p) WHERE catalog.pret BETWEEN 5 AND 35;"));
		query4.setOnAction(e -> Table.populate("Perechiile de furnizori care furnizeaza aceeasi piesa cu acelasi pret", "SELECT DISTINCT F1.id_f AS idf1, F2.id_f AS idf2 FROM catalog F1 JOIN catalog F2 ON (F1.id_p = F2.id_p) WHERE (F1.pret = F2.pret AND F1.id_f < F2.id_f);"));
		query5.setOnAction(e -> Table.populate("Numele furnizorilor care apar pe aceeasi comanda cu 'John Doe S.R.L'", "SELECT furnizori.numef FROM furnizori JOIN comenzi ON (furnizori.id_f = comenzi.id_f) WHERE comenzi.id_p = (SELECT comenzi.id_p FROM furnizori JOIN comenzi ON (furnizori.id_f = comenzi.id_f) WHERE furnizori.numef = 'John Doe S.R.L.');"));
		query6.setOnAction(e -> Table.populate("Numele piesei comandata in cantitatea cea mai mare", "SELECT piese.numep FROM piese JOIN comenzi ON (piese.id_p = comenzi.id_p) WHERE cantitate >= ALL(SELECT cantitate FROM comenzi"));
		query7.setOnAction(e -> Table.populate("Pentru fiecare comanda si fiecare moneda pretul minim si pretul maxim al pieselor comandate", "SELECT comenzi.id_c, MAX(catalog.pret), MIN(catalog.pret) FROM comenzi JOIN catalog ON (catalog.id_p = comenzi.id_p) GROUP BY comenzi.id_c ORDER BY id_c;"));
		query8.setOnAction(e -> Table.populate("Pentru fiecare idf si idp nr. total de piese comandate", "SELECT id_f, id_p, SUM(cantitate) FROM comenzi GROUP BY id_f, id_p;"));
		query9.setOnAction(e -> Table.populate("Preturi catalog", "SELECT pret FROM catalog"));
		func.setOnAction(e -> QueryData.raisePrices());
		VBox layout = new VBox(20);
		layout.getChildren().addAll(query1, query2, query3, query4, query5, query6, query7, query8, query9, func);
		layout.setBackground(getBackground());
		layout.setAlignment(Pos.CENTER);
		
		Scene scene = new Scene(layout, 200, 500);
		
		Stage window = primaryStage;
		window.setScene(scene);
		window.setTitle("Menu");
		window.show();
	}
	
	public static Background getBackground() {
		try {
			InputStream stream = new FileInputStream("C:\\Users\\Hp\\Desktop\\an II\\POO\\Shrek.jpg");
			Image image = new Image(stream);
			BackgroundImage background = new BackgroundImage(image, null, null, null, null);
			Background bGround = new Background(background);
			return bGround;
		} catch (Exception e) {
			return null;
		}
	}	

	public static void main(String[] args) {
        launch(args);
    }

}











