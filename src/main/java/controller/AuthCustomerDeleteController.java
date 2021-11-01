package controller;

import java.io.IOException;
import java.io.PrintWriter;

import customer.service.CustomerService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class AuthCustomerDeleteController implements Controller {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		String id = req.getParameter("Customer_id");

			
		CustomerService service = CustomerService.getInstance();
		service.CustomerDelete(id);														
		
		PrintWriter out = resp.getWriter();
		out.println("<script>location.href=document.referrer; history.back();</script>");
					
					
		}

}
