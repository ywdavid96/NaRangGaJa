package course.model;

import java.sql.Date;

public class Course {
	
	String Course_code;
	String Course_Type;
	String Customer_ID;
	String Guide_id;
	String Region;
	int Customer_num;
	int Budget;
	String start_date;
	String end_date;
	String fileName;
	String fileRealName;
	
	public String getCourse_code() {
		return Course_code;
	}
	public void setCourse_code(String course_code) {
		Course_code = course_code;
	}
	public String getCourse_Type() {
		return Course_Type;
	}
	public void setCourse_Type(String course_type) {
		Course_Type = course_type;
	}
	public String getCustomer_ID() {
		return Customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		Customer_ID = customer_ID;
	}
	public int getCustomer_num() {
		return Customer_num;
	}
	public void setCustomer_num(int customer_num) {
		Customer_num = customer_num;
	}
	public int getBudget() {
		return Budget;
	}
	public void setBudget(int budget) {
		Budget = budget;
	}
	public String getGuide_id() {
		return Guide_id;
	}
	public void setGuide_id(String guide_id) {
		Guide_id = guide_id;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getRegion() {
		return Region;
	}
	public void setRegion(String region) {
		Region = region;
	}
	
	
}