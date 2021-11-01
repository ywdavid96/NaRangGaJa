package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



import customer.service.CustomerService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.HttpUtil;

public class CustomerLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String id = req.getParameter("ID");
		String password = req.getParameter("PWD");

		System.out.println(id);

		System.out.println(password);
		CustomerService service = CustomerService.getInstance();
		int result = 0;

		try {
			result = service.CustomerLogin(id, password);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		if (result == 1) {

			session.setAttribute("id", id);
			session.setAttribute("type", "customer");

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		} else if(result ==2){
			session.setAttribute("id", "관리자");
			session.setAttribute("type", "auth");
			
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		} else {

			PrintWriter out = resp.getWriter();
			out.println("<script>alert('잘못 입력 되었습니다. ID 또는 비밀번호를 다시 확인해주세요.'); history.back();</script>");
		}
	}
}
