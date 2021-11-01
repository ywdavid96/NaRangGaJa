package guiderev.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import guide.model.Guide;
import util.DBConnection;

public class GuideRevDAO {
	
	private static GuideRevDAO guideRevDAO = new GuideRevDAO();

	private GuideRevDAO() {}

	public static GuideRevDAO getInstance() {
		return guideRevDAO;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	
	
	public ResultSet selectRev(String id) {
		String sql ="SELECT Customer_ID, detail, date,rep FROM GuideRev WHERE Guide_ID = ?;";
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
	
	public ResultSet avgRep(String id) {
		String sql ="SELECT AVG(rep) FROM GuideRev WHERE Guide_ID = ?;";
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

	}//avgRep
	
	public ResultSet guideRank1() {
		String sql ="SELECT * FROM (select *,Row_Number() over(order by avg(rep) desc) As ranking from GuideRev Group by Guide_ID) As t where t.ranking = 1;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;		
			
			rs = pstmt.executeQuery();
			
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//rank1
	
	public ResultSet guideRank2() {
		String sql ="SELECT * FROM (select *,Row_Number() over(order by avg(rep) desc) As ranking from GuideRev Group by Guide_ID) As t where t.ranking = 2;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;		
			
			rs = pstmt.executeQuery();
			
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//rank1
	
	public ResultSet guideRank3() {
		String sql ="SELECT * FROM (select *,Row_Number() over(order by avg(rep) desc) As ranking from GuideRev Group by Guide_ID) As t where t.ranking = 3;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;		
			
			rs = pstmt.executeQuery();
			
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//rank1
	
	public ResultSet guideRank4() {
		String sql ="SELECT * FROM (select *,Row_Number() over(order by avg(rep) desc) As ranking from GuideRev Group by Guide_ID) As t where t.ranking = 4;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;		
			
			rs = pstmt.executeQuery();
			
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//rank1
	
	
	public void writeRev(String guide_id,String customer_id, String detail, String date, int rep) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("INSERT INTO GuideRev(Guide_ID,Customer_ID,detail,date,rep) VALUES(?,?,?,?,?)");
		   
		   
		   	pstmt.setString(1, guide_id);
			pstmt.setString(2, customer_id);
			pstmt.setString(3, detail);
			pstmt.setString(4, date);
			pstmt.setInt(5, rep);

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}//writeRev
}
