package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import list.model.List;
import list.service.ListService;


public class ListInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//int lat = Integer.parseInt(req.getParameter("latclick"));
		//int lng = Integer.parseInt(req.getParameter("lngclick"));
		String Course_code = req.getParameter("Course_code");
		String pname = req.getParameter("pname");
		String paddress = req.getParameter("paddress");
		String lat = req.getParameter("latclick");
		String lng = req.getParameter("lngclick");
		
		
		List list = new List();
		list.setCourse_code(Course_code);
		list.setPname(pname);
		list.setPaddress(paddress);
		list.setLat(lat);
		list.setLng(lng);
		
				
				
		ListService service = ListService.getInstance();
		

		
		int result = 0;

		result = service.ListInsert(list,Course_code);
		if (result == 1) {

			resp.setContentType("text/html; charsef=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println("<script>location.href=document.referrer; history.back();</script>");
		} else {

			resp.setContentType("text/html; charset=UTF-8");

			PrintWriter out = resp.getWriter();

			out.println("<script>alert('같은 지역으로만 선택해주세요!'); history.go(-1);</script>");	
		}
		
		
		
		/*
		 * RequestDispatcher rd = req.getRequestDispatcher("addtolistform.jsp");
		 * rd.forward(req, resp);
		 */		
		
	}

}
