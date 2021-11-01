package guiderev.service;


import java.sql.ResultSet;

import guiderev.dao.GuideRevDAO;

public class GuideRevService {
	
	private static GuideRevService service = new GuideRevService();
	public GuideRevDAO dao = GuideRevDAO.getInstance();
	private GuideRevService() {}
	
	public static GuideRevService getInstance() {
		return service;
	}
	
	public ResultSet SelectRev(String id) {
		return dao.selectRev(id);
	}
	
	public ResultSet AvgRep(String id) {
		return dao.avgRep(id);
	}
	
	public ResultSet GuideRank1() {
		return dao.guideRank1();
	}
	public ResultSet GuideRank2() {
		return dao.guideRank2();
	}
	public ResultSet GuideRank3() {
		return dao.guideRank3();
	}
	public ResultSet GuideRank4() {
		return dao.guideRank4();
	}
	
	public void WriteRev(String guide_id,String customer_id, String detail, String date, int rep) {
		dao.writeRev(guide_id, customer_id, detail, date, rep);
	}
	
}
