package list.service;


import java.sql.ResultSet;
import java.sql.SQLException;

import list.dao.ListDAO;
import list.model.List;

public class ListService {
	
	private static ListService service = new ListService();
	public ListDAO dao = ListDAO.getInstance();
	private ListService() {}
	
	public static ListService getInstance() {
		return service;
	}
	
	public int ListInsert(List list,String Course_code) {
		return dao.ListInsert(list,Course_code);
	}
	
	public int ChkRegion(String course_code, String paddress) throws SQLException {
		return dao.ChkRegion(course_code, paddress);
	}
	
	public ResultSet SelectByCoursecode(String course_code) {
		return dao.selectByCoursecode(course_code);
	}
	
	public ResultSet GetRegion(String course_code) {
		return dao.getRegion(course_code);
	}
	
	public void ListDelete(String course_code, String id) {
		dao.ListDelete(course_code, id);
	}
}
