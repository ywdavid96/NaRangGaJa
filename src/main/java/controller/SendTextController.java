package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import text.service.TextService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SendTextController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String sender_id = req.getParameter("sender_id");
		String receiver_id = req.getParameter("receiver_id");
		String title = req.getParameter("title");
		String detail = req.getParameter("detail");
		
		TextService service = TextService.getInstance();
		service.sendText(sender_id, receiver_id, title, detail);
		
		
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('작성이 완료되었습니다.'); location.href='receivetextform.jsp';</script>");
		
	}

}
