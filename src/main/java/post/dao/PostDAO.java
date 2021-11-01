package post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

public class PostDAO {

	private static PostDAO postDAO = new PostDAO();

	private PostDAO() {
	}

	public static PostDAO getInstance() {
		return postDAO;
	}

	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}

	Connection conn = DBConnection.getConnection();

	public int getNext() {
		String SQL = "SELECT Post_ID FROM Post ORDER BY Post_ID DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1; // 다음 게시물
			}
			return 1; // 첫 번째 게시물

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}// getNext

	
	public void newPost(String id, String type, String fileName, String fileRealName,String text) {

		if (type.equals("customer")) {
			try {
				PreparedStatement pstmt = conn.prepareStatement(
						"insert into Post(Post_ID,Customer_ID,fileName,fileRealName,Text) values(?,?,?,?,?)");
				
				pstmt.setInt(1, getNext());
				pstmt.setString(2, id);
				pstmt.setString(3, fileName);
				pstmt.setString(4, fileRealName);
				pstmt.setString(5, text);

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (type.equals("guide")) {
			try {
				PreparedStatement pstmt = conn.prepareStatement(
						"insert into Post(Post_ID,Guide_ID,fileName,fileRealName,Text) values(?,?,?,?,?)");
				

				pstmt.setInt(1, getNext());
				pstmt.setString(2, id);
				pstmt.setString(3, fileName);
				pstmt.setString(4, fileRealName);
				pstmt.setString(5, text);

				pstmt.executeUpdate();

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}// NewPost
	
	
	
	
	
	public void postDelete(String id, String PostID) {
		 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement("Delete from Post where (Customer_ID =? OR Guide_ID=?) AND Post_ID=?;");
			 
			 pstmt.setString(1, id);
			 pstmt.setString(2, PostID);
			 
			 
			 pstmt.executeUpdate();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
	 }//postDelete

}
