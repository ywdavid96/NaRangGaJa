package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FrontController extends HttpServlet {
	
	
	HashMap<String, Controller> list = null;
	public void init(ServletConfig config) throws ServletException{
		list = new HashMap<String,Controller>();
		list.put("/customerInsert.do", new CustomerInsertController());
		list.put("/guideInsert.do", new GuideInsertController());
		list.put("/ListInsert.do", new ListInsertController());
		list.put("/customerDelete.do", new CustomerDeleteController());
		list.put("/guideDelete.do", new GuideDeleteController());
		list.put("/customerLogin.do", new CustomerLoginController());
		list.put("/customerSNSLogin.do", new CustomerSNSLoginController());
		list.put("/guideLogin.do", new GuideLoginController());
		list.put("/guideSNSLogin.do", new GuideSNSLoginController());
		list.put("/customerUpdate.do", new CustomerUpdateController());
		list.put("/guideUpdate.do", new GuideUpdateController());
		list.put("/courseInsert.do", new CourseInsertController());
		list.put("/courseDelete.do", new CourseDeleteController());
		list.put("/guidecourseInsert.do", new GuideCourseInsertController());
		list.put("/listDelete.do", new ListDeleteController());
		list.put("/vehicleDelete.do", new VehicleDeleteController());
		list.put("/mypageInsert.do", new MyPageInsertController());
		list.put("/authCustomerDelete.do", new AuthCustomerDeleteController());
		list.put("/authGuideDelete.do", new AuthGuideDeleteController());
		list.put("/reserveCourse.do", new ReserveCourseController());
		list.put("/reserveCourse.do", new ReserveCourseController());
		list.put("/writeReview.do", new WriteReviewController());
		list.put("/courseReview.do", new CourseReviewController());
		list.put("/writeQuestion.do", new WriteQuestionController());
		list.put("/writeAnswer.do", new WriteAnswerController());
		list.put("/commitFAQ.do", new CommitFAQController());
		list.put("/sendText.do", new SendTextController());
		list.put("/custKakaoLogin.do", new CustomerKakaoController());
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String url = req.getRequestURI();
		String cp = req.getContextPath();
		String path = url.substring(cp.length());
		
		Controller sc = list.get(path);
		PrintWriter out = resp.getWriter();
		out.print(path);
		sc.execute(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String url = req.getRequestURI();
		String cp = req.getContextPath();
		String path = url.substring(cp.length());
		
		Controller sc = list.get(path);
		PrintWriter out = resp.getWriter();
		out.print(path);
		sc.execute(req, resp);

	}


	
	
	
	
	
}
