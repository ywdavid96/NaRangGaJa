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


public class WriteAnswerController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String detail = req.getParameter("detail");
		
		QnaService service = QnaService.getInstance();
		service.writeAnswer(num, detail);
		service.switchingChecked(num);
		
		
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('작성이 완료되었습니다.'); location.href='FAQform.jsp';</script>");
		
	}

}
