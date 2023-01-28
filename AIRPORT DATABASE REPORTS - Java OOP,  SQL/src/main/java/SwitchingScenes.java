import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class SwitchingScenes extends Application {

	Stage window;
	Scene scene1;
	Scene scene2;
	Scene scene3;

	public void start(Stage primaryStage) throws Exception {
				
		Label label1 = new Label("Welcome to the first scene");
		Button button1 = new Button("Go to scene 2");
		
		button1.setOnAction(e -> window.setScene(scene2));
		
		VBox layout1 = new VBox(20);
		layout1.getChildren().addAll(label1, button1);
		
		scene1 = new Scene(layout1, 200, 200);
		
		Label label2 = new Label("Welcome to the second scene");
		
		Button button2 = new Button("Fuck this go back");	
		button2.setOnAction(e -> window.setScene(scene1));
		Button button5 = new Button("Scene 3");
		button5.setOnAction(e -> window.setScene(scene3));
		
		StackPane layout2 = new StackPane();
		layout2.setPadding(new Insets(10, 10, 10, 10));
		layout2.setAlignment(button2, Pos.TOP_CENTER);
		layout2.setAlignment(button5, Pos.BOTTOM_CENTER);
		layout2.getChildren().addAll(label2, button2, button5);
		
		scene2 = new Scene(layout2, 200, 200);
		
		Label label3 = new Label("I love you");
		
		Button button3 = new Button("Scene 1");
		button3.setOnAction(e -> window.setScene(scene1));
		Button button4 = new Button("Scene 2");
		button4.setOnAction(e -> window.setScene(scene2));
		
		HBox layout3 = new HBox();
		layout3.setSpacing(20);
		layout3.getChildren().addAll(label3, button3, button4);
		
		scene3 = new Scene(layout3, 200, 200);
		
		window = primaryStage;
		window.setScene(scene1);
		window.setTitle("Turbosuflanta Seria 7");
		window.show();
	}

	public static void main(String[] args) {
		launch(args);
	}

}
