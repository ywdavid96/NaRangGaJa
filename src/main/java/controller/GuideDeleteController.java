package controller;

import java.io.IOException;




import guide.service.GuideService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.HttpUtil;

public class GuideDeleteController implements Controller {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");

			
			GuideService service = GuideService.getInstance();
					service.GuideDelete(id);
					
					System.out.println(id);
					
					req.removeAttribute("id");
					
					HttpUtil.forward(req, resp, "/result/DeleteResult.jsp");
		}

}
