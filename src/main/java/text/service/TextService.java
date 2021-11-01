package text.service;


import java.sql.ResultSet;
import java.sql.SQLException;

import text.dao.TextDAO;
import text.model.Text;

public class TextService {
	
	private static TextService service = new TextService();
	public TextDAO dao = TextDAO.getInstance();
	private TextService() {}
	
	public static TextService getInstance() {
		return service;
	}
	
	public void sendText(String sender_id, String receiver_id, String title, String detail) {
		dao.SendText(sender_id, receiver_id, title, detail);
	}
	
	public ResultSet receiveList(String id) {
		return dao.ReceiveList(id);
	}
	
	public ResultSet sendList(String id) {
		return dao.SendList(id);
	}
	
	public ResultSet textbytitle(String title) {
		return dao.Textbytitle(title);
	}
}
