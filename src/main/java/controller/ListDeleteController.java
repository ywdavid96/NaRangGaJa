package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import list.service.ListService;

public class ListDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String Course_code = req.getParameter("course_code");
		String pname = req.getParameter("pname");
		
					
				
		ListService service = ListService.getInstance();
		service.ListDelete(Course_code, pname);
		
		resp.setContentType("text/html; charsef=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<script>location.href=document.referrer; history.back();</script>");
		
		//RequestDispatcher rd = req.getRequestDispatcher("addtolistform.jsp");
		//rd.forward(req, resp);

	}

}
