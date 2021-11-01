package course.service;

import java.sql.ResultSet;

import course.dao.CourseDAO;
import course.model.Course;

public class CourseService {
	private static CourseService service = new CourseService();
	public CourseDAO dao = CourseDAO.getInstance();
	private CourseService() {}
	
	public static CourseService getInstance() {
		return service;
	}
	
	public void CourseInsert(Course course) {
		dao.CourseInsert(course);
	}
	
	public void CourseDelete(String Course_code,String type) {
		dao.CourseDelete(Course_code,type);
	}
	
	public void GuideCourseInsert(Course course) {
		dao.GuideCourseInsert(course);
	}
	
	public ResultSet SelectByCustomer(String id) {
		return dao.selectByCustomer(id);
	}
	
	public ResultSet SelectByGuide(String id) {
		return dao.selectByGuide(id);
	}
	
	public ResultSet SelectByRegion(String Region) {
		return dao.selectByRegion(Region);
	}
	
	public ResultSet SelectThumbnail(String Course_code) {
		return dao.selectThumbnail(Course_code);
	}
	
	public ResultSet ViewCourses() {
		return dao.viewCourses();
	}
	
	public ResultSet ShowResults(String type, String region, int num,String gender,String age,String start_date, String end_date) {
		return dao.showResults(type, region, num, gender, age, start_date, end_date);
	}
	
	public void CourseReserve(String type, String id, String course_code) {
		dao.courseReserve(type, id, course_code);
	}
	
	public void ThumbnailUpload(String Course_code, String fileName,String fileRealName) {
		dao.thumbnailUpload(Course_code, fileName, fileRealName);
	}
	
	public ResultSet ShowReservedCourses(String id, String type) {
		return dao.showReservedCourses(id, type);
	}
	
	public ResultSet SearchResult(String stype, String sword) {
		return dao.searchResult(stype, sword);
	}
}
