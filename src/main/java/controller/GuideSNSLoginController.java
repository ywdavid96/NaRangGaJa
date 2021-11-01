package controller;




import java.io.IOException;
import java.sql.SQLException;

import guide.service.GuideService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuideSNSLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		javax.servlet.http.HttpSession session = req.getSession();

		String id = req.getParameter("ID");
		String name = req.getParameter("name");

		System.out.println(id);

		System.out.println(name);
		GuideService service = GuideService.getInstance();
		int result = 0;

		try {
			result = service.GuideSNSLogin(id, name);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		if (result == 1) {

			session.setAttribute("id", id);
			session.setAttribute("type", "guide");

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		} else {

			session.setAttribute("id", id);
			session.setAttribute("name", name);
			//session.setAttribute("result", result);
			
			RequestDispatcher rd = req.getRequestDispatcher("guideSNSjoinform.jsp");
			rd.forward(req, resp);
		}
	}
}
