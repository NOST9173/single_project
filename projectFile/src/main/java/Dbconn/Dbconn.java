 package Dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
	 
				//mySQL호스팅//호스팅주소//schema명?/serverTimezone=UTC&characterEncoding=UTF-8
	String url="jdbc:mysql://beomjun9173.cafe24.com:3306/beomjun9173?serverTimezone=UTC&characterEncoding=UTF-8";
	String user="beomjun9173";
	String password = "dlfjsdlfjs9";		
	
	public Connection getConnection() {
		Connection conn = null;
		try {
		//
		Class.forName("com.mysql.cj.jdbc.Driver");
		//
		conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
 
/*
	String url="jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC&characterEncoding=UTF-8";
	String user="root";
	String password = "dlfjsdlfjs9";		

	public Connection getConnection() {
		Connection conn = null;
		try {
		//
		Class.forName("com.mysql.cj.jdbc.Driver");
		//
		conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
*/

//
// String url = "jdbc:oracle:thin:@DB20220526155515_high?TNS_ADMIN=/Users/gimbeomjun/oracle/Wallet_DB20220526155515";
// String user = "ADMIN"
// String password = "Jesusjuni12!"
