package swp.context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	private final String serverName = "localhost";
	private final String dbName = "LotteryDB";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "sa";
	private final String password = "123456";
	
	
	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlsever://" + serverName + ":" + portNumber + "\\" + instance + ";DatabaseName=" + dbName;
		if(instance == null || instance.trim().isEmpty()) {
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		}
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
	
}
