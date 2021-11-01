package course.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import course.model.Course;
import customer.model.Customer;
import util.DBConnection;

public class CourseDAO {
	
	private static CourseDAO courseDao = new CourseDAO();
	
	private CourseDAO() {}
	
	public static CourseDAO getInstance() {
		return courseDao;
	}
	
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	
	public void CourseInsert(Course course) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Course(Course_code,Course_Type,Customer_ID,Region,Customer_num,Budget,start_date,end_date) values(?,?,?,?,?,?,?,?)");
		  		   
		   	pstmt.setString(1, course.getCourse_code());
		   	pstmt.setString(2, course.getCourse_Type());
			pstmt.setString(3, course.getCustomer_ID());
			pstmt.setString(4, course.getRegion());
			pstmt.setInt(5, course.getCustomer_num());
			pstmt.setInt(6, course.getBudget());
			pstmt.setString(7, course.getStart_date());
			pstmt.setString(8, course.getEnd_date());

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}//CourseInsert
	
	public void CourseDelete(String Course_code,String type) {
		 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement("Delete from Course where Course_code=? and Course_Type=?");
			 
			 pstmt.setString(1, Course_code);
			 pstmt.setString(2, type);
			 
			 pstmt.executeUpdate();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
	 }//CourseDelete
	
	public void GuideCourseInsert(Course course) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Course(Course_code,Course_Type,Guide_ID,Region,Customer_num,Budget,start_date,end_date) values(?,?,?,?,?,?,?,?)");
		  		   
		   	pstmt.setString(1, course.getCourse_code());
		   	pstmt.setString(2, course.getCourse_Type());
			pstmt.setString(3, course.getGuide_id());
			pstmt.setString(4, course.getRegion());
			pstmt.setInt(5, course.getCustomer_num());
			pstmt.setInt(6, course.getBudget());
			pstmt.setString(7, course.getStart_date());
			pstmt.setString(8, course.getEnd_date());

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}//CourseInsert
	
	public ResultSet selectByGuide(String Guide_id) {
		String sql ="SELECT Course_code, Region, Customer_num, Budget, start_date, end_date, fileName FROM Course WHERE Guide_ID = ? AND Course_Type = 'guide';";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Guide_id);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//selectByGuide
	
	public ResultSet selectByCustomer(String Customer_id) {
		String sql ="SELECT Course_code, Region, Customer_num, Budget, start_date, end_date, fileName FROM Course WHERE Customer_ID = ? AND Course_Type = 'customer';";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Customer_id);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//selectByCustomer
	
	public ResultSet selectByRegion(String Region) {
		String sql ="SELECT fileName, Course_code, IFNULL(Customer_ID,'가이드용 코스'), IFNULL(Guide_ID,'고객용 코스'), Region, Customer_num, Budget, start_date, end_date FROM Course WHERE Region = ?;";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, Region);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//selectByRegion
	
	public ResultSet selectThumbnail(String Course_code) {
		String sql ="SELECT fileName FROM Course WHERE Course_code = ?;";
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

	}//selectByCustomer
	
	public ResultSet viewCourses() {
		String sql ="SELECT fileName, Course_code, IFNULL(Customer_ID,'가이드용 코스'), IFNULL(Guide_ID,'고객용 코스'), Region, Customer_num, Budget, start_date, end_date FROM Course;";
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

	}//viewCourses
	
	public void thumbnailUpload(String Course_code, String fileName, String fileRealName)
	{
		Connection con = this.connect();
		
		try {
			PreparedStatement pstmt = con.prepareStatement("update Course set fileName=?, fileRealName=? where Course_code=?");

			pstmt.setString(3, Course_code);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			
			System.out.println(""+fileName);
			System.out.println(""+fileRealName);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//CustomerUpdate
	
	public ResultSet showResults(String type, String region, int num,String gender,String age,String start_date, String end_date) {
		
		
		
		int min=0;
		int max=0;
		
		switch (age) {
		case "20~24": {
			min=20;
			max=24;
			break;
		}
		case "25~29": {
			min=25;
			max=29;
			break;
		}
		case "30~34": {
			min=30;
			max=34;
			break;
		}
		case "35~39": {
			min=35;
			max=39;
			break;
		}
		case "40~44": {
			min=40;
			max=44;
			break;
		}
		case "45~49": {
			min=45;
			max=49;
			break;
		}
		case "50세 이상": {
			min=50;
			max=100;
			break;
		}
		case "상관없음": {
			
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + age);
		}
		
		

		if (gender.equals("상관없음") && !age.equals("상관없음")) {
						
			System.out.println("성별 상관없음");
			
			if (type.equals("customer")) {
				try {
					String sql ="SELECT Course_code, c.Guide_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Guide g WHERE (c.Customer_ID IS NULL OR c.guide_ID IS NULL) AND c.Guide_id = g.Guide_id AND c.Region =? AND c.Customer_num =? AND g.Age BETWEEN ? AND ? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);					
					pstmt.setInt(3, min);
					pstmt.setInt(4, max);
					pstmt.setString(5, start_date);
					pstmt.setString(6, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
				DBConnection.close();
				return null;
			} else {
				try {
					String sql ="SELECT Course_code, cs.Customer_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Customer cs WHERE (c.Customer_ID IS NULL OR c.Guide_ID IS NULL) AND c.Customer_ID = cs.Customer_ID AND c.Region =? AND c.Customer_num =? AND cs.Age BETWEEN ? AND ? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);
					pstmt.setInt(3, min);
					pstmt.setInt(4, max);
					pstmt.setString(5, start_date);
					pstmt.setString(6, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			}//else
		}else if(age.equals("상관없음") && !gender.equals("상관없음")) {
			
			System.out.println("나이 상관없음");
			
			
			if (type.equals("customer")) {
				try {
					String sql ="SELECT Course_code, c.Guide_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Guide g WHERE (c.Customer_ID IS NULL OR c.Guide_ID IS NULL) AND c.Guide_ID = g.Guide_id AND c.Region =? AND c.Customer_num =? AND g.Gender =? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);
					pstmt.setString(3, gender);					
					pstmt.setString(4, start_date);
					pstmt.setString(5, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
				DBConnection.close();
				return null;
			} else {
				try {
					String sql ="SELECT Course_code, cs.Customer_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Customer cs WHERE (c.Customer_ID IS NULL OR c.Guide_ID IS NULL) AND c.Customer_ID = cs.Customer_ID AND c.Region =? AND c.Customer_num =? AND cs.Gender =? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);
					pstmt.setString(3, gender);					
					pstmt.setString(4, start_date);
					pstmt.setString(5, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			
			}
			
		} else if(gender.equals("상관없음") && age.equals("상관없음")) {
			
			System.out.println("둘다 상관없음");
			
			if (type.equals("customer")) {
				try {
					String sql ="SELECT Course_code, c.Guide_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Guide g WHERE (c.Customer_ID IS NULL OR c.Guide_ID IS NULL) AND c.Guide_ID = g.Guide_id AND c.Region =? AND c.Customer_num =? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);					
					pstmt.setString(3, start_date);
					pstmt.setString(4, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
				DBConnection.close();
				return null;
			} else {
				try {
					String sql ="SELECT Course_code, cs.Customer_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Customer cs WHERE (c.Customer_ID IS NULL OR c.Guide_ID IS NULL) AND c.Customer_ID = cs.Customer_ID AND c.Region =? AND c.Customer_num =? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);
					pstmt.setString(3, start_date);
					pstmt.setString(4, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		} else {
			
			if (type.equals("customer")) {
				try {
					String sql ="SELECT Course_code, c.Guide_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Guide g WHERE (c.Customer_ID IS NULL OR c.Guide_ID IS NULL) AND c.Guide_ID = g.Guide_ID AND c.Region =? AND c.Customer_num =? AND g.Gender =? AND g.Age BETWEEN ? AND ? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);
					pstmt.setString(3, gender);
					pstmt.setInt(4, min);
					pstmt.setInt(5, max);
					pstmt.setString(6, start_date);
					pstmt.setString(7, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
				DBConnection.close();
				return null;
			} else {
				try {
					String sql ="SELECT Course_code, cs.Customer_ID, c.Region, c.Customer_num, c.start_date, c.end_date, c.fileName FROM Course c, Customer cs WHERE (c.Customer_ID IS NULL OR c.guide_ID IS NULL) AND c.Customer_id = cs.Customer_ID AND c.Region =? AND c.Customer_num =? AND cs.gender =? AND cs.Age BETWEEN ? AND ? AND start_date=? AND end_date=?;";
					Connection con = this.connect();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = null;
					
					pstmt.setString(1, region);
					pstmt.setInt(2, num);
					pstmt.setString(3, gender);
					pstmt.setInt(4, min);
					pstmt.setInt(5, max);
					pstmt.setString(6, start_date);
					pstmt.setString(7, end_date);
					
					
					rs = pstmt.executeQuery();
					return rs;
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		
		
		
			
		}
		DBConnection.close();
		return null;
		
	}//showResults
	
	
	public void courseReserve(String type, String id, String course_code) {
		
		
		if (type=="customer") {
			
			try {
				   PreparedStatement pstmt = conn.prepareStatement("UPDATE Course SET Customer_ID = ? WHERE Course_code = ?;");
				  		   
				   	pstmt.setString(1, id);
					pstmt.setString(2, course_code);					

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
								
		} else {
			try {
				   PreparedStatement pstmt = conn.prepareStatement("UPDATE Course SET Guide_ID = ? WHERE Course_code = ?;");
				  		   
				   	pstmt.setString(1, id);
					pstmt.setString(2, course_code);					

					pstmt.executeUpdate();
				 }catch (Exception e){
					 e.printStackTrace();
				 	}
		}
		
		 
		}//courseReserve

	
	public ResultSet showReservedCourses(String id, String type) {
		
		if (type =="customer") {
			String sql ="SELECT Course_code, Customer_ID, Guide_ID, Region, Customer_num, Budget, start_date, end_date, fileName FROM Course WHERE (Customer_ID IS NOT NULL AND guide_ID IS NOT NULL) AND Customer_ID= ?;";
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
			String sql ="SELECT Course_code, Customer_ID, Guide_ID, Region, Customer_num, Budget, start_date, end_date, fileName FROM Course WHERE (Customer_ID IS NOT NULL AND Guide_ID IS NOT NULL) AND Guide_ID= ?;";
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
		
		

	}//showReservedCourses
	
	public ResultSet searchResult(String stype, String sword) {
		
		if(stype.equals("course")) {
			String sql ="SELECT Course_code, IFNULL(Customer_ID,'가이드용 코스'), IFNULL(Guide_ID,'고객용 코스'), Region, Customer_num, Budget, start_date, end_date, fileName FROM Course WHERE Course_code like ?;";
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = null;

				pstmt.setString(1,"%" + sword + "%");
				rs = pstmt.executeQuery();
				return rs;
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
			return null;
		}
		else if(stype.equals("name")) {
			String sql ="SELECT c.Course_code, IFNULL(c.Customer_ID,'가이드용 코스'), IFNULL(c.Guide_ID,'고객용 코스'), c.Region, c.Customer_num, c.Budget, c.start_date, c.end_date, c.fileName FROM Course c, Customer cs, Guide g WHERE (c.Customer_ID = cs.Customer_ID and cs.Customer_name like ?) or (c.Guide_ID = g.Guide_ID and g.Guide_name like ?) group  by c.Course_code;";
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = null;

				pstmt.setString(1,"%" + sword + "%");
				pstmt.setString(2,"%" + sword + "%");
				rs = pstmt.executeQuery();
				return rs;
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
			return null;
		} else if(stype.equals("id"))
		{
			String sql ="SELECT Course_code, IFNULL(Customer_ID,'가이드용 코스'), IFNULL(Guide_ID,'고객용 코스'), Region, Customer_num, Budget, start_date, end_date, fileName FROM Course WHERE Customer_ID like ? or Guide_ID like ?";
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = null;

				pstmt.setString(1,"%" + sword + "%");
				pstmt.setString(2,"%" + sword + "%");
				rs = pstmt.executeQuery();
				return rs;
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
			return null;
		}
		else {
			return null;
		}

	}//searchResult
	
}
