public class GUI{
	
	public static void main(String[] args) {
		  QueryData data = new QueryData();
		  data.getData("SELECT id_f, id_p, SUM(cantitate) FROM comenzi GROUP BY id_f, id_p;");
		  String[][] table = data.getData();
		  for(int i = 0; i < 5; i++) {
			  for(int j = 0; j < 4; j++) {
				  System.out.print(table[i][j] + " ");
			  }
			  System.out.print("\n");
		  }
	}
}
