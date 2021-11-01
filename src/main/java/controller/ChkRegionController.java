package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import list.service.ListService;
import util.HttpUtil;


public class ChkRegionController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String Course_code = req.getParameter("Course_code");
		String paddress = req.getParameter("paddress");
		
		ListService service = ListService.getInstance();
		int result = 0;
		
		try {
			result = service.ChkRegion(Course_code, paddress);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		if (result == 1) {
			
			resp.setContentType("text/html; charset=UTF-8");

			PrintWriter out = resp.getWriter();

			out.println("<script>alert('확인이 완료되었습니다.'); history.go(-1);</script>");
			
			//HttpUtil.forward(req, resp, "addtolistform.jsp");
			
		} else {

			resp.setContentType("text/html; charset=UTF-8");

			PrintWriter out = resp.getWriter();

			out.println("<script>alert('같은 지역으로만 선택해주세요!'); history.go(-1);</script>");	
			
			//HttpUtil.forward(req, resp, "addtolistform.jsp");
		}	
	}
}
