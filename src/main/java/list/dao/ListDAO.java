package list.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import list.model.List;
import util.DBConnection;

public class ListDAO {

	private static ListDAO listDao = new ListDAO();

	private ListDAO() {
	}

	public static ListDAO getInstance() {
		return listDao;
	}

	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}

	Connection conn = DBConnection.getConnection();

	public int ListInsert(List list,String Course_code) {

		
		String sql = "SELECT region FROM Course where Course_code = ?;";			
		int idx = list.getPaddress().indexOf(" ");
		String region = list.getPaddress().substring(0, idx); // 지역 앞부분 가져오기
		
		System.out.println(region);
		
		
		
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Course_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(region)) {
					//지역 일치				
					System.out.println(rs.getString(1));
						PreparedStatement pstmt2 = conn.prepareStatement(
								"INSERT INTO List(Course_code,pname,paddress,lat,lng,Region) values(?,?,?,?,?,SUBSTRING_INDEX(paddress, ' ', 1))");
																
						pstmt2.setString(1, list.getCourse_code());
						pstmt2.setString(2, list.getPname());
						pstmt2.setString(3, list.getPaddress());
						pstmt2.setString(4, list.getLat());
						pstmt2.setString(5, list.getLng());

						pstmt2.executeUpdate();
						
					return 1;
				} else
					//지역불일치
					return 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}// ListInsert

	public int ChkRegion(String Course_code, String paddress) {
		String sql = "SELECT Region FROM List where Course_code = ?;";
		int idx = paddress.indexOf(" ");
		String region = paddress.substring(0, idx); // 지역 앞부분 가져오기
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Course_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(region)) {
					return 1;
				} else
					return 0;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}// CheckRegion

	public ResultSet selectByCoursecode(String Course_code) {
		String sql = "SELECT Course_code, pname, paddress,Region FROM List WHERE Course_code = ?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Course_code);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}// selectByCoursecode
	
	public ResultSet getRegion(String Course_code) {
		String sql = "SELECT Region FROM List WHERE Course_code = ?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Course_code);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}// getRegion
	
	public void ListDelete(String course_code, String pname) {
		 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement("Delete from List where pname=? AND Course_code =?;");
			 
			 pstmt.setString(1, pname);
			 pstmt.setString(2, course_code);
			 
			 
			 pstmt.executeUpdate();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
	 }//ListDelete
	
	

}
