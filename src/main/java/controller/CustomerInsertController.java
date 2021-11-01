package controller;

import java.io.IOException;
import java.io.PrintWriter;

import customer.service.CustomerService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.HttpUtil;
import customer.model.*;

public class CustomerInsertController implements Controller{

	public void execute(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException,IOException{
		
		if(req.getParameter("Customer_ID").isEmpty() || req.getParameter("Customer_PWD").isEmpty() || req.getParameter("Customer_name").isEmpty() ||
				req.getParameter("SNS_code").isEmpty() || req.getParameter("Gender").isEmpty() || req.getParameter("Age").isEmpty()) {
			
			resp.setContentType("text/html; charset=UTF-8");

			PrintWriter out = resp.getWriter();

			out.println("<script>alert('잘못된 입력 또는 입력되지 않은 칸이 존재합니다.'); history.go(-1);</script>");
		}
		
		String Customer_ID = req.getParameter("Customer_ID");
		String Customer_PWD = req.getParameter("Customer_PWD");
		String Customer_name = req.getParameter("Customer_name");
		int SNS_code = Integer.parseInt(req.getParameter("SNS_code"));
		String Gender = req.getParameter("Gender");
		int Age = Integer.parseInt(req.getParameter("Age"));

		Customer customer = new Customer();
		customer.setCustomer_ID(Customer_ID);
		customer.setCustomer_PWD(Customer_PWD);
		customer.setCustomer_name(Customer_name);
		customer.setSNS_code(SNS_code);
		customer.setGender(Gender);
		customer.setAge(Age);
				
		CustomerService service = CustomerService.getInstance();
		service.CustomerInsert(customer);
		
		req.setAttribute("type", "customer");
		req.setAttribute("name", Customer_name);
		HttpUtil.forward(req, resp, "/result/registerResult.jsp");
	}
}
