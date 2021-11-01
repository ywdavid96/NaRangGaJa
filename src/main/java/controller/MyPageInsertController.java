package controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypage.model.Mypage;
import mypage.service.MypageService;

public class MyPageInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 * String directory = req.getRealPath("/upload");
		 * 
		 * int maxSize = 1024 * 1024 * 100; String encoding = "UTF-8";
		 * DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		 * 
		 * MultipartRequest multipartRequest = new
		 * MultipartRequest(req,directory,maxSize,encoding);
		 */
		
		HttpSession session = req.getSession();
		
		String type = (String)session.getAttribute("type");
		if (type=="customer") {
			String Customer_ID= (String) session.getAttribute("id");
			String intro = req.getParameter("intro");
			
			Mypage mypage = new Mypage();
			mypage.setCustomer_ID(Customer_ID);
			mypage.setIntro(intro);
			
			MypageService serivce = MypageService.getInstance();
			serivce.MyPageInsert(mypage,type);
			
			
			resp.setContentType("text/html; charsef=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println("<script>location.href=document.referrer; history.back();</script>");
			
		} else {
			String Guide_ID = (String)session.getAttribute("id");
			String intro = req.getParameter("intro");
			
			Mypage mypage = new Mypage();
			mypage.setGuide_ID(Guide_ID);
			mypage.setIntro(intro);
			
			MypageService serivce = MypageService.getInstance();
			serivce.MyPageInsert(mypage,type);
			
			
			resp.setContentType("text/html; charsef=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println("<script>location.href=document.referrer; history.back();</script>");
		}
		
		
		
		
		
		
		
		
		
		
	}

}
