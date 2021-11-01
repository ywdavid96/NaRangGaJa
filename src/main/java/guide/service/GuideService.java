package guide.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import guide.dao.GuideDAO;
import guide.model.Guide;

public class GuideService {
	private static GuideService service = new GuideService();
	public GuideDAO dao = GuideDAO.getInstance();
	private GuideService() {}
	
	public static GuideService getInstance() {
		return service;
	}
	
	public void GuideInsert(Guide guide) {
		dao.GuideInsert(guide);
	}
	
	public int GuideLogin(String id,String passwd) throws SQLException {
		return dao.GuideLogin(id, passwd);
	}
	
	public int GuideSNSLogin(String id,String name) throws SQLException {
		return dao.GuideSNSLogin(id, name);
	}
	
	public void GuideDelete(String id) {
		dao.GuideDelete(id);
	}
	
	public void GuideUpdate(Guide guide) {
		dao.GuideUpdate(guide);
	}
	
	public ResultSet SelectAllGuides() {
		return dao.selectAllGuides();
	}
	
	public ResultSet SelectName(String id) {
		return dao.SelectName(id);
	}
	
	/*
	
	
	public void onPurchse(String CustomerId) {
		dao.onPurchse(CustomerId);
	}
	
	public void deleteReview(int ReviewId) {
		dao.deleteReview(ReviewId);
	}
	*/
	
}
