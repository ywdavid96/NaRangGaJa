package courserev.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import guide.model.Guide;
import util.DBConnection;

public class CourserevDAO {
	
	private static CourserevDAO CourserevDAO = new CourserevDAO();

	private CourserevDAO() {}

	public static CourserevDAO getInstance() {
		return CourserevDAO;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	
	
	public ResultSet selectRev(String id) {
		String sql ="SELECT Guide_ID, Customer_ID, detail, date,rep FROM Courserev WHERE Course_code = ?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			pstmt.setString(1, id);			
			
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//selectRev
	
	
	public void Courserev(String course_code, String type, String id, String detail, String date, int rep) {
		
		if(type == "customer"){
			try {
				   PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Courserev(Course_code,Customer_ID,detail,date,rep) VALUES(?,?,?,?,?)");
				   
				   	pstmt.setString(1, course_code);
					pstmt.setString(2, id);
					pstmt.setString(3, detail);
					pstmt.setString(4, date);
					pstmt.setInt(5, rep);

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
				}
		else {
			try {
				   PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Courserev(Course_code,Guide_ID,detail,date,rep) VALUES(?,?,?,?,?)");
				   
				   	pstmt.setString(1, course_code);
					pstmt.setString(2, id);
					pstmt.setString(3, detail);
					pstmt.setString(4, date);
					pstmt.setInt(5, rep);

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
			}
		}
		 
}
