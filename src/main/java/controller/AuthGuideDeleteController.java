package controller;

import java.io.IOException;
import java.io.PrintWriter;

import guide.service.GuideService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class AuthGuideDeleteController implements Controller {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String id = req.getParameter("Guide_id");

			
		GuideService service = GuideService.getInstance();
		service.GuideDelete(id);
							
					
		PrintWriter out = resp.getWriter();
		out.println("<script>location.href=document.referrer; history.back();</script>");
		}

}
