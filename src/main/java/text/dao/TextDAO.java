package text.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import text.model.Text;
import util.DBConnection;

public class TextDAO {

	private static TextDAO qnaDao = new TextDAO();

	private TextDAO() {
	}

	public static TextDAO getInstance() {
		return qnaDao;
	}

	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}

	Connection conn = DBConnection.getConnection();
	
	public int getNext() {
		String SQL = "SELECT Text_ID FROM Text ORDER BY Text_ID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1; //다음 게시물
			}
			return 1; // 첫 번째 게시물
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}
	
	public void SendText(String sender_id,String receiver_id, String title, String detail) {

			try {
				   PreparedStatement pstmt = conn.prepareStatement("insert into Text(Text_ID,Sender_ID,Receiver_ID,Title,Detail) values(?,?,?,?,?)");
				   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
				   
				   	pstmt.setInt(1, getNext());
				   	pstmt.setString(2, sender_id);
				   	pstmt.setString(3, receiver_id);
					pstmt.setString(4, title);
					pstmt.setString(5, detail);

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
			}//SendText
	
	public ResultSet Textbytitle(String title) {
		
			String sql = "SELECT * FROM Text WHERE Title = ?;";
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = null;
				
				pstmt.setString(1, title);
				rs = pstmt.executeQuery();
				return rs;
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
			return null;	
	}// Textbytitle
	
	public ResultSet ReceiveList(String id) {
		
		String sql = "SELECT * FROM Text where Receiver_ID = ?;";
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
	}// ReceiveList
	
public ResultSet SendList(String id) {
		
		String sql = "SELECT * FROM Text where Sender_ID = ?;";
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
	}// SendList
}
	