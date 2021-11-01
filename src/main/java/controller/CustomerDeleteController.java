package controller;

import java.io.IOException;




import customer.service.CustomerService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.HttpUtil;

public class CustomerDeleteController implements Controller {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");

			
			CustomerService service = CustomerService.getInstance();
					service.CustomerDelete(id);
					
					req.removeAttribute("id");
					
					HttpUtil.forward(req, resp, "/result/DeleteResult.jsp");
		}

}
