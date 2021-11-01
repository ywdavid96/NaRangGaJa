package controller;

import java.io.IOException;



import guide.model.Guide;
import guide.service.GuideService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.HttpUtil;




public class GuideUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Guide_ID =req.getParameter("Guide_ID");
		String Guide_PWD =req.getParameter("Guide_PWD");
		String Guide_name =req.getParameter("Guide_name");
		int SNS_code = Integer.parseInt(req.getParameter("SNS_code"));
		int Payment = Integer.parseInt(req.getParameter("Payment"));
		String Region =req.getParameter("Region");
		String Gender =req.getParameter("Gender");
		int Age = Integer.parseInt(req.getParameter("Age"));

		
		Guide guide = new Guide();
		guide.setGuide_ID(Guide_ID);
		guide.setGuide_PWD(Guide_PWD);
		guide.setGuide_name(Guide_name);
		guide.setSNS_code(SNS_code);
		guide.setPayment(Payment);
		guide.setRegion(Region);
		guide.setGender(Gender);
		guide.setAge(Age);

		
		GuideService service = GuideService.getInstance();
				service.GuideUpdate(guide);
				
				HttpUtil.forward(req, resp, "logoutProc.jsp");
	}


}
