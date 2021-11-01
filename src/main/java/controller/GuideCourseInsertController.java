package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import course.model.Course;
import course.service.CourseService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GuideCourseInsertController implements Controller {

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String Course_code = req.getParameter("Course_code");
		String Course_type = (String) session.getAttribute("type");
		String Guide_ID = (String) session.getAttribute("id");
		String Region = req.getParameter("Region");
		int Customer_num = Integer.parseInt(req.getParameter("Customer_num"));
		int Budget = Integer.parseInt(req.getParameter("Budget"));
		String start_date = req.getParameter("start_date");
		String end_date= req.getParameter("end_date");
		
		Course course = new Course();
		course.setCourse_code(Course_code);
		course.setCourse_Type(Course_type);
		course.setGuide_id(Guide_ID);
		course.setRegion(Region);
		course.setCustomer_num(Customer_num);
		course.setBudget(Budget);
		course.setStart_date(start_date);
		course.setEnd_date(end_date);
		
		CourseService service = CourseService.getInstance();
		service.GuideCourseInsert(course);
		
		RequestDispatcher rd = req.getRequestDispatcher("guidecourseform.jsp");
		rd.forward(req, resp);
		
	}

}
