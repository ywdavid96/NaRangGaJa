package controller;

import java.io.IOException;
import java.io.PrintWriter;

import guide.service.GuideService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.HttpUtil;
import guide.model.*;

public class GuideInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
		
		if(req.getParameter("Guide_ID").isEmpty() || req.getParameter("Guide_PWD").isEmpty() || req.getParameter("Guide_name").isEmpty() ||
				req.getParameter("SNS_code").isEmpty() || req.getParameter("Region").isEmpty() || req.getParameter("Payment").isEmpty()
			 	|| req.getParameter("Gender").isEmpty() || req.getParameter("Age").isEmpty()){
			
			resp.setContentType("text/html; charset=UTF-8");

			PrintWriter out = resp.getWriter();

			out.println("<script>alert('잘못된 입력 또는 입력되지 않은 칸이 존재합니다.'); history.go(-1);</script>");
		}
		
		String Guide_ID = req.getParameter("Guide_ID");
		String Guide_PWD = req.getParameter("Guide_PWD");
		String Guide_name = req.getParameter("Guide_name");
		int SNS_code = Integer.parseInt(req.getParameter("SNS_code"));
		String Region = req.getParameter("Region");
		int Payment = Integer.parseInt(req.getParameter("Payment"));
		String Gender = req.getParameter("Gender");
		int Age = Integer.parseInt(req.getParameter("Age"));

		Guide guide = new Guide();
		guide.setGuide_ID(Guide_ID);
		guide.setGuide_PWD(Guide_PWD);
		guide.setGuide_name(Guide_name);
		guide.setSNS_code(SNS_code);
		guide.setRegion(Region);
		guide.setPayment(Payment);
		guide.setGender(Gender);
		guide.setAge(Age);
				
		GuideService service = GuideService.getInstance();
		service.GuideInsert(guide);
		
		req.setAttribute("type", "customer");
		req.setAttribute("name", Guide_name);
		HttpUtil.forward(req, resp, "/result/registerResult.jsp");
	}
}
