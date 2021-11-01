package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import qna.service.QnaService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class WriteQuestionController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		String type = req.getParameter("type");
		String title = req.getParameter("title");
		String detail = req.getParameter("detail");
		
		QnaService service = QnaService.getInstance();
		service.writeQuestion(id, type, title, detail);
		
		
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('작성이 완료되었습니다.'); location.href='FAQform.jsp';</script>");
		
	}

}
