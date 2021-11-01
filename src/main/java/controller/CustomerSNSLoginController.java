package controller;




import java.io.IOException;
import java.sql.SQLException;

import customer.service.CustomerService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerSNSLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		javax.servlet.http.HttpSession session = req.getSession();

		String id = req.getParameter("ID");
		String name = req.getParameter("name");

		System.out.println(id);

		System.out.println(name);
		CustomerService service = CustomerService.getInstance();
		int result = 0;

		try {
			result = service.CustomerSNSLogin(id, name);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		if (result == 1) {

			session.setAttribute("id", id);
			session.setAttribute("type", "customer");

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		} else {

			session.setAttribute("id", id);
			session.setAttribute("name", name);
			//session.setAttribute("result", result);
			
			RequestDispatcher rd = req.getRequestDispatcher("SNSjoinform.jsp");
			rd.forward(req, resp);
		}
	}
}
