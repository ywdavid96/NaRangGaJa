package guide.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import customer.model.Customer;
import guide.model.Guide;
import util.DBConnection;

public class GuideDAO {
	
	private static GuideDAO guideDao = new GuideDAO();

	private GuideDAO() {}

	public static GuideDAO getInstance() {
		return guideDao;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	public void GuideInsert(Guide guide) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("insert into Guide(Guide_ID,Guide_PWD,Guide_name,SNS_code,Payment,Region,Gender,Age) values(?,?,?,?,?,?,?,?)");
		   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
		   
		   	pstmt.setString(1, guide.getGuide_ID());
			pstmt.setString(2, guide.getGuide_PWD());
			pstmt.setString(3, guide.getGuide_name());
			pstmt.setInt(4, guide.getSNS_code());
			pstmt.setInt(5, guide.getPayment());
			pstmt.setString(6, guide.getRegion());
			pstmt.setString(7, guide.getGender());
			pstmt.setInt(8, guide.getAge());

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}
	
	public int GuideLogin(String id,String passwd) throws SQLException {
		Connection con = this.connect();
		PreparedStatement pstmt = con.prepareStatement("SELECT Guide_PWD FROM Guide WHERE Guide_ID = ?  ");
		ResultSet rs = null;

		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(passwd)) {
					return 1;
				} else 
					return 0;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;

	}//GuideLogin
	
	public int GuideSNSLogin(String id, String name) throws SQLException {
		Connection con = this.connect();
		PreparedStatement pstmt = con.prepareStatement("SELECT Guide_ID FROM Guide WHERE Guide_name = ?");
		ResultSet rs = null;

		try {
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(id)) {
					return 1;
				} else
					return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}//GuideSNSLogin
	
	public void GuideDelete(String id) {
		 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement("Delete from Guide where Guide_ID=?");
			 
			 pstmt.setString(1, id);
			 
			 pstmt.executeUpdate();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
	 }
	 
	public void GuideUpdate(Guide guide)
	{
		Connection con = this.connect();
		
		try {
			PreparedStatement pstmt = con.prepareStatement("update Guide set Guide_PWD=?, Guide_name=?, SNS_code=?, Payment=?, Region=?, Gender=?,Age=? where Guide_ID=?");

			pstmt.setString(8, guide.getGuide_ID());
			pstmt.setString(1, guide.getGuide_PWD());
			pstmt.setString(2, guide.getGuide_name());
			pstmt.setInt(3, guide.getSNS_code());
			pstmt.setInt(4, guide.getPayment());
			pstmt.setString(5, guide.getRegion());
			pstmt.setString(6, guide.getGender());
			pstmt.setInt(7, guide.getAge());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ResultSet selectAllGuides() {
		String sql ="SELECT Guide_ID, Guide_name, SNS_code,Payment, Region, Gender, Age FROM Guide;";
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

	}//selectAllGuides
	
	public ResultSet SelectName(String id) {
		String sql ="SELECT Guide_name FROM Guide WHERE Guide_ID = ?;";
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

	}//SelectName


	/*
		 
		 public void onPurchse(String CustomerId)
			{
				Connection con = this.connect();
				
				try {
					
					PreparedStatement pstmt = con.prepareStatement("update customer set order_num =order_num+1,point=point+100 where CustomerId=?");

					pstmt.setString(1, CustomerId);

					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		 
		 
		//濡쒓렇�씤
		
		//由щ럭 �궘�젣
		public void deleteReview(int ReviewId) {
			String sql ="DELETE from review WHERE ReviewId=?";
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = null;

				pstmt.setInt(1, ReviewId);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();


		}//deleteReview
	*/
	
}
