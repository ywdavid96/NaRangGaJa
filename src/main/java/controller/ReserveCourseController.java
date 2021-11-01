package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import course.service.CourseService;




public class ReserveCourseController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		
		if(req.getParameter("id").equals("null"))
		{
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('로그인을 한 뒤 이용해주세요.'); history.back();</script>");
		}
		else {
			String type = (String)session.getAttribute("type");
			
			String course_code = req.getParameter("course_code");
			String id = req.getParameter("id");
			
			CourseService service = CourseService.getInstance();
			service.CourseReserve(type, id, course_code);
			
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('예약이 완료되었습니다. 소통은 쪽지를 통해서 가능합니다!'); location.href=document.referrer; history.back();</script>");
		}
	}
}
