package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import courserev.service.CourseRevService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CourseReviewController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		String course_code = req.getParameter("course_code");
		String id= (String) session.getAttribute("id");
		String type = (String) session.getAttribute("type");
		String detail = req.getParameter("detail");
		String date= format.format(time);
		int rep = Integer.parseInt(req.getParameter("rep"));
		
		System.out.println(date);
		
		CourseRevService service = CourseRevService.getInstance();
		service.CourseRev(course_code, type, id, detail, date, rep);

		PrintWriter out = resp.getWriter();
		out.println("<script>location.href=document.referrer; history.back();</script>");
		
	}

}
