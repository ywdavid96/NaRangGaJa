package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import guiderev.service.GuideRevService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class WriteReviewController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		if( session.getAttribute("id") == null)
		{
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('로그인 후 사용해주세요!'); history.back();</script>");
		}
		else if(req.getParameter("detail").equals("") || (req.getParameter("rep").equals("평점"))) {
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('평점 혹은 내용이 제대로 입력되지 않았습니다'); history.back();</script>");
		}
		else {
			String guide_id = req.getParameter("guide_id");
			String customer_id= (String) session.getAttribute("id");
			String detail = req.getParameter("detail");
			String date= format.format(time);
			int rep = Integer.parseInt(req.getParameter("rep"));
			
			System.out.println(date);
			
			
			GuideRevService service = GuideRevService.getInstance();
			service.WriteRev(guide_id, customer_id, detail, date, rep);
			
			
			PrintWriter out = resp.getWriter();
			out.println("<script>location.href=document.referrer; history.back();</script>");
		}
	}

}
