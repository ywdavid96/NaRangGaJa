package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.service.MypageService;

public class VehicleDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String filename = req.getParameter("filename");
		
		System.out.println(""+id+filename);			
				
		MypageService service = MypageService.getInstance();
		service.VehicleDelete(id, filename);
		
		resp.setContentType("text/html; charsef=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<script>location.href=document.referrer; history.back();</script>");
		
		//RequestDispatcher rd = req.getRequestDispatcher("addtolistform.jsp");
		//rd.forward(req, resp);

	}

}
