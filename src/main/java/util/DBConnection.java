package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//�̱���( singleTon )
public class DBConnection {
	/*
	����
	Connection conn = conn = DBConnection.getConnection();
	PreparedStatement pstmt = conn.prepareStatement();
	*/
	private static Connection connection = null;
	private DBConnection() {}
	public static Connection getConnection() {
		if ( connection == null ) {
			//로컬 DB 세팅
			/*
			  String url = "jdbc:mysql://localhost/graduation?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false ";
			  String userid = "root"; 
			  String password = "cs1234" ;
			 */
			
			//AWS
			
			  String url =
			  "jdbc:mysql://ywdb.ciwjk0ctgadp.ap-northeast-2.rds.amazonaws.com/graduation?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false "
			  ; String userid = "admin"; String password = "cs12345678" ;
			 
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, userid, password);
				//System.out.println( connection );			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}  catch (SQLException e) {
				e.printStackTrace();
			}
		} // if 
		return connection;
	
	} // getConnection
	public static Connection getConnection(String url, String userid, String password) {
		if ( connection == null ) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, userid, password);
				System.out.println( connection );			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}  catch (SQLException e) {
				e.printStackTrace();
			}
		} // if 
		return connection;
		
	}
	public static void close() {
			if (connection != null) {
				try {
					if (!connection.isClosed()) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				connection = null;
			}		
	}
	/*
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DBConnection.getConnection();
	 */	

} // class