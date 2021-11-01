package controller;

import java.io.IOException;



import customer.model.Customer;
import customer.service.CustomerService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.HttpUtil;




public class CustomerUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Customer_ID =req.getParameter("Customer_ID");
		String Customer_PWD =req.getParameter("Customer_PWD");
		String Customer_name =req.getParameter("Customer_name");
		int SNS_code = Integer.parseInt(req.getParameter("SNS_code"));
		String Gender =req.getParameter("Gender");
		int Age = Integer.parseInt(req.getParameter("Age"));

		
		Customer customer = new Customer();
		customer.setCustomer_ID(Customer_ID);
		customer.setCustomer_PWD(Customer_PWD);
		customer.setCustomer_name(Customer_name);
		customer.setSNS_code(SNS_code);
		customer.setGender(Gender);
		customer.setAge(Age);

		
		CustomerService service = CustomerService.getInstance();
				service.CustomerUpdate(customer);
				
				HttpUtil.forward(req, resp, "logoutProc.jsp");
	}


}
