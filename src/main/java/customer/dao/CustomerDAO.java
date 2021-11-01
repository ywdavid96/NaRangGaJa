package customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import customer.model.Customer;
import util.DBConnection;

public class CustomerDAO {
	
	private static CustomerDAO customerDao = new CustomerDAO();

	private CustomerDAO() {}

	public static CustomerDAO getInstance() {
		return customerDao;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	public void CustomerInsert(Customer customer) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("insert into Customer(Customer_ID,Customer_PWD,Customer_name,SNS_code,Gender,Age) values(?,?,?,?,?,?)");
		   //PreparedStatement pstmt = conn.prepareStatement("insert into customer(Customer_ID,Customer_PWD,Customer_name) values(?,?,?)");
		   
		   	pstmt.setString(1, customer.getCustomer_ID());
			pstmt.setString(2, customer.getCustomer_PWD());
			pstmt.setString(3, customer.getCustomer_name());
			pstmt.setInt(4, customer.getSNS_code());
			pstmt.setString(5, customer.getGender());
			pstmt.setInt(6, customer.getAge());


			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}//CustomerInsert
	
	public int CustomerLogin(String id,String passwd) throws SQLException {
		Connection con = this.connect();
		PreparedStatement pstmt = con.prepareStatement("SELECT Customer_PWD FROM Customer WHERE Customer_ID = ?  ");
		ResultSet rs = null;

		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if ( id.equals("auth") && passwd.equals("auth")) {
	            return 2;
	         } else if(rs.next()) {
	            if (rs.getString(1).equals(passwd)) {
	               return 1;
	            } else {
	               return 0;
	            }
	         }
		} catch (Exception e) {
	 			e.printStackTrace();
	 		}
	         return -1;
	}//CustomerLogin
	
	public int CustomerSNSLogin(String id, String name) throws SQLException {
		Connection con = this.connect();
		PreparedStatement pstmt = con.prepareStatement("SELECT Customer_ID FROM Customer WHERE Customer_name = ?");
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
	}//CustomerSNSLogin

	public void CustomerUpdate(Customer customer)
	{
		Connection con = this.connect();
		
		try {
			PreparedStatement pstmt = con.prepareStatement("update Customer set Customer_PWD=?, Customer_name=?, SNS_code=?, Gender=?, Age=? where Customer_ID=?");

			pstmt.setString(6, customer.getCustomer_ID());
			pstmt.setString(1, customer.getCustomer_PWD());
			pstmt.setString(2, customer.getCustomer_name());
			pstmt.setInt(3, customer.getSNS_code());
			pstmt.setString(4, customer.getGender());
			pstmt.setInt(5, customer.getAge());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//CustomerUpdate

	public void CustomerDelete(String id) {
		 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement("Delete from Customer where Customer_ID=?");
			 
			 pstmt.setString(1, id);
			 
			 pstmt.executeUpdate();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
	 }//CustomerDelete
	
	public ResultSet selectAllCustomers() {
		String sql ="SELECT Customer_ID, Customer_name, SNS_code, Gender, Age FROM Customer;";
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

	}//selectAllCustomers
	
	public ResultSet SelectName(String id) {
		String sql ="SELECT Customer_name FROM Customer WHERE Customer_ID = ?;";
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
	
	
	public int checkDuplicate(String id) {
		String sql ="select count(*) as cnt from Customer where Customer_ID =?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			return rs.getInt(0); 
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return 0;

	}//checkDuplicate
	
	
	
	
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
