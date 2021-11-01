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


public class CommitFAQController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		QnaService service = QnaService.getInstance();
		service.commitFAQ(num);
		
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('등록이 완료되었습니다.'); location.href='FAQform.jsp';</script>");
		
	}

}
