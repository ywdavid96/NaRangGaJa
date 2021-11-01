package mypage.service;

import java.sql.ResultSet;
import java.sql.SQLException;



import mypage.dao.MypageDAO;
import mypage.model.Mypage;

public class MypageService {
	
	private static MypageService service = new MypageService();
	public MypageDAO dao = MypageDAO.getInstance();
	private MypageService() {}
	
	public static MypageService getInstance() {
		return service;
	}
	
	public int CheckPage(String id) throws SQLException {
		return dao.checkPage(id);
	}
	
	public int CheckVehicle(String id) throws SQLException {
		return dao.checkVehicle(id);
	}
	
	public ResultSet SelectMyPage(String id,String type) throws SQLException{
		return dao.selectMyPage(id,type);
	}
	
	public void VehicleDelete(String id,String fileName){
		dao.vehicleDelete(id,fileName);
	}
	
	public ResultSet SelectVehicle(String id) {
		return dao.selectVehicle(id);
	}
	
	public ResultSet SelectGuideProfile(String id) {
		return dao.selectGuideProfile(id);
	}
	
	public void MyPageInsert(Mypage mypage, String type) {
		dao.myPageInsert(mypage, type);
	}
	
	public ResultSet GetName(String id, String type) throws SQLException{
		return dao.getName(id, type);
	}
	public void MyPageUpload(String id, String type, String intro, String fileName,String realName) {
		dao.myPageUpload(id, type, intro, fileName, realName);
	}
	
	public void VehicleUpload(String id, String vehicle, String fileName,String realName) {
		dao.vehicleUpload(id, vehicle, fileName, realName);
	}
	
	public ResultSet GetPosts(String id,String type) {
		return dao.getPosts(id, type);
	}
	
}
