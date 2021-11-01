package qna.service;


import java.sql.ResultSet;
import java.sql.SQLException;

import qna.dao.QnaDAO;
import qna.model.Qna;

public class QnaService {
	
	private static QnaService service = new QnaService();
	public QnaDAO dao = QnaDAO.getInstance();
	private QnaService() {}
	
	public static QnaService getInstance() {
		return service;
	}
	
	public void writeQuestion(String id, String type, String title, String detail) {
		dao.WriteQuestion(id, type, title, detail);
	}
	
	public void writeAnswer(int num, String detail) {
		dao.WriteAnswer(num, detail);
	}
	
	public void commitFAQ(int num) {
		dao.CommitFAQ(num);
	}
	
	public ResultSet selectAnswer(int num) {
		return dao.SelectAnswer(num);
	}
	
	public ResultSet faqList() {
		return dao.FAQList();
	}
	
	public void switchingChecked(int num) {
		dao.SwitchingChecked(num);
	}
	
	public ResultSet selectQnA(String id, String type) {
		return dao.SelectQnA(id, type);
	}
	
	public ResultSet viewQuestion() {
		return dao.ViewQuestion();
	}
	
	public ResultSet qnabytitle(String title) {
		return dao.QnAbytitle(title);
	}
	
	public ResultSet qnabyNum(int num) {
		return dao.QnAbyNum(num);
	}
}
