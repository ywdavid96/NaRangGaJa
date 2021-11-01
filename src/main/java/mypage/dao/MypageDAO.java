package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import course.model.Course;
import mypage.model.Mypage;
import util.DBConnection;

public class MypageDAO {

	private static MypageDAO mypageDao = new MypageDAO();

	private MypageDAO() {
	}

	public static MypageDAO getInstance() {
		return mypageDao;
	}

	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}

	Connection conn = DBConnection.getConnection();

	public int checkPage(String id) throws SQLException {
		Connection con = this.connect();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM mypage WHERE Customer_ID = ? OR Guide_ID =?");
		ResultSet rs = null;

		try {
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 내 페이지가 있는 경우
				return 1;
			}
			// 내 페이지가 없는 경우
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}// checkPage

	public int checkVehicle(String id) throws SQLException {
		Connection con = this.connect();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Guide_vehicle WHERE Guide_ID = ?;");
		ResultSet rs = null;

		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 이동수단이 있는 경우
				return 1;
			}
			// 이동수단이 없는 경우
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}// checkVehicle

	public ResultSet selectMyPage(String id, String type) {

		if (type.equals("customer")) {
			String sql = "SELECT * FROM mypage WHERE Customer_ID = ?;";
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
			String sql = "SELECT * FROM mypage WHERE Guide_ID =?;";
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

	}// selectMyPage

	public ResultSet selectVehicle(String id) {
		String sql = "SELECT * FROM Guide_vehicle WHERE Guide_ID = ?;";
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

	public ResultSet selectGuideProfile(String id) {
		String sql = "SELECT fileName FROM mypage WHERE Guide_ID = ?;";
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

	public void myPageInsert(Mypage mypage, String type) {

		if (type == "customer") {
			try {
				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO mypage(Customer_ID,intro) values(?,?)");

				pstmt.setString(1, mypage.getCustomer_ID());
				pstmt.setString(2, mypage.getIntro());

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO mypage(Guide_ID,intro) values(?,?)");

				pstmt.setString(1, mypage.getGuide_ID());
				pstmt.setString(2, mypage.getIntro());

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}// myPageInsert

	public void myPageUpload(String id, String type, String intro, String fileName, String fileRealName) {

		if (type == "customer") {
			try {
				PreparedStatement pstmt = conn.prepareStatement(
						"INSERT INTO mypage(Customer_ID,intro,fileName,fileRealName) values(?,?,?,?)");

				pstmt.setString(1, id);
				pstmt.setString(2, intro);
				pstmt.setString(3, fileName);
				pstmt.setString(4, fileRealName);

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			try {
				PreparedStatement pstmt = conn
						.prepareStatement("INSERT INTO mypage(Guide_ID,intro,fileName,fileRealName) values(?,?,?,?)");

				pstmt.setString(1, id);
				pstmt.setString(2, intro);
				pstmt.setString(3, fileName);
				pstmt.setString(4, fileRealName);

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // else

	}// myPageUpload

	public void vehicleUpload(String id, String vehicle, String fileName, String fileRealName) {

		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO Guide_vehicle(Guide_id,Vehicle_name,fileName,fileRealName) values(?,?,?,?)");

			pstmt.setString(1, id);
			pstmt.setString(2, vehicle);
			pstmt.setString(3, fileName);
			pstmt.setString(4, fileRealName);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// vehicleUpload

	public void vehicleDelete(String id, String fileName) {

		try {
			PreparedStatement pstmt = conn
					.prepareStatement("DELETE FROM Guide_vehicle WHERE fileName = ? AND Guide_ID = ?");

			pstmt.setString(1, fileName);
			pstmt.setString(2, id);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// vehicleDelete

	
	
	public ResultSet getName(String id, String type) {

		if (type.equals("customer")) {
			String sql = "SELECT Customer_name FROM mypage mp,Customer c WHERE mp.Customer_ID= ? AND   mp.Customer_ID = c.Customer_ID;";
			try {
				Connection con = this.connect();
				PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = null;

				stmt.setString(1, id);
				rs = stmt.executeQuery();
				return rs;
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
			return null;
		} else {
			String sql = "SELECT Guide_name FROM mypage mp,Guide g WHERE mp.Guide_ID= ? AND   mp.Guide_ID = g.Guide_ID;";
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

	}// getName

	
	public ResultSet getPosts(String id,String type) {
		
		if (type.equals("customer") ) {
			String sql = "SELECT Customer_ID,fileName,fileRealName,Text FROM Post WHERE Customer_ID= ?;";
			try {
				Connection con = this.connect();
				PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = null;

				stmt.setString(1, id);
				rs = stmt.executeQuery();
				return rs;
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
			return null;
		} else {
			String sql = "SELECT Guide_ID,fileName,fileRealName,Text FROM Post WHERE Guide_ID= ?;";
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
		
	}//getPosts
	
}
