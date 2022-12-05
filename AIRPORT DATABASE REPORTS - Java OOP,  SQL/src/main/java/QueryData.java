import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QueryData{
	
	private static Connection conn = JDBC.connect();
	private String[][] table = new String[20][20];
	
	public void getData(String query) {
		try {
			ResultSet res = conn.createStatement().executeQuery(query);
			int nrColl = res.getMetaData().getColumnCount();
			
			for(int i = 0; i < nrColl; i++) {
				this.table[0][i] = res.getMetaData().getColumnLabel(i + 1);
			}
			
			int currentRow = 1;		
			while(res.next()) {
				for(int i = 0; i < nrColl; i++) {
					this.table[currentRow][i] = res.getString(i + 1);
				}
				currentRow++;
 			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void raisePrices() {
		CallableStatement cs;
		try {
			cs = conn.prepareCall("{CALL creste_preturile()}");
			ResultSet rs = cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public int getNrColl() {
		int i = 0;
		while(this.table[0][i] != null) {
			i++;
		}
		return i;
	}
	
	public int getNrRows() {
		int i = 0;
		while(this.table[i][0] != null) {
			i++;
		}
		return i;
	}
	
	public String[][] getData(){
		return this.table;
	}
}
