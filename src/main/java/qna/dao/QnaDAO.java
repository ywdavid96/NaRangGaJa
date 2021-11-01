package qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import qna.model.Qna;
import util.DBConnection;

public class QnaDAO {

	private static QnaDAO qnaDao = new QnaDAO();

	private QnaDAO() {
	}

	public static QnaDAO getInstance() {
		return qnaDao;
	}

	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}

	Connection conn = DBConnection.getConnection();
	
	public int getNext() {
		String SQL = "SELECT QnA_ID FROM Question ORDER BY QnA_ID DESC";
		
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
	
	public void WriteQuestion(String id, String type, String title, String detail) {
		
		if(type.equals("customer"))
		{
			try {
				   PreparedStatement pstmt = conn.prepareStatement("insert into Question(QnA_ID,Customer_ID,Title,Detail,Checked) values(?,?,?,?,?)");
				   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
				   
				   	pstmt.setInt(1, getNext());
				   	pstmt.setString(2, id);
					pstmt.setString(3, title);
					pstmt.setString(4, detail);
					pstmt.setInt(5, 0);

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
		} else if(type.equals("guide"))
		{
			try {
					PreparedStatement pstmt = conn.prepareStatement("insert into Question(QnA_ID,Guide_ID,Title,Detail,Checked) values(?,?,?,?,?)");
				    //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
				   
					pstmt.setInt(1, getNext());
				   	pstmt.setString(2, id);
					pstmt.setString(3, title);
					pstmt.setString(4, detail);
					pstmt.setInt(5, 0);

					pstmt.executeUpdate();

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
		}
		}//WriteQuestion
	
	public void WriteAnswer(int num, String detail) {
		
			try {
				   PreparedStatement pstmt = conn.prepareStatement("insert into Answer(QnA_ID, Detail) values(?,?)");
				   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
				   
				   	pstmt.setInt(1, num);
				   	pstmt.setString(2, detail);
					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
		}//WriteAnswer

	public void SwitchingChecked(int num) {
		
		try {
			   PreparedStatement pstmt = conn.prepareStatement("update Question set Checked = 1 where QnA_ID = ?");
			   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
			   
			   	pstmt.setInt(1, num);
				pstmt.executeUpdate();
			 }catch (Exception e){
				 e.printStackTrace();
			 	}
	}//SwitchingChecked
	
	public void CommitFAQ(int num) {
		
		try {
			   PreparedStatement pstmt = conn.prepareStatement("insert into FAQ(QnA_ID) values(?)");
			   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
			   
			   	pstmt.setInt(1, num);
				pstmt.executeUpdate();
			 }catch (Exception e){
				 e.printStackTrace();
			 	}
	}//CommitFAQ
	
	public ResultSet SelectQnA(String id, String type) {
		
		if (type.equals("customer")) {
			String sql = "SELECT Title, Checked FROM Question WHERE Customer_ID = ?;";
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
		} else {
			String sql = "SELECT Title, Checked FROM Question WHERE Guide_ID =?;";
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
		}				
		

	}// selectQnA
	
	public ResultSet QnAbytitle(String title) {
		
			String sql = "SELECT * FROM Question WHERE Title = ?;";
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
	}// QnAbytitle
	
	public ResultSet QnAbyNum(int num) {
		
		String sql = "SELECT * FROM Question WHERE QnA_ID = ?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;	
}// QnAbyNum
	
	public ResultSet FAQList() {
		
		String sql = "SELECT * FROM FAQ;";
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
	}// FAQList
	
	public ResultSet ViewQuestion() {

			String sql = "SELECT * FROM Question order by QnA_ID desc;";
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
		}// viewQuestion
	
	public ResultSet SelectAnswer(int num) {

		String sql = "SELECT Detail FROM Answer where QnA_ID = ?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
		
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;			
	}// SelectAnswer
	
	}
	