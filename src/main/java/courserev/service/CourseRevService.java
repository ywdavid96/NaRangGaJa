package courserev.service;


import java.sql.ResultSet;

import courserev.dao.CourserevDAO;

public class CourseRevService {
	
	private static CourseRevService service = new CourseRevService();
	public CourserevDAO dao = CourserevDAO.getInstance();
	private CourseRevService() {}
	
	public static CourseRevService getInstance() {
		return service;
	}
	
	public ResultSet SelectRev(String id) {
		return dao.selectRev(id);
	}
	
	public void CourseRev(String course_code,String type, String id, String detail, String date, int rep) {
		dao.Courserev(course_code, type, id, detail, date, rep);
	}
	
}
