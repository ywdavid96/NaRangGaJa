package mypage.model;

public class Mypage {
	
	String Customer_ID;
	String Guide_ID;
	int type;
	String fileName;
	String fileRealName;
	String intro;
	String Course_code;
	
	
	public String getCustomer_ID() {
		return Customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		Customer_ID = customer_ID;
	}
	public String getGuide_ID() {
		return Guide_ID;
	}
	public void setGuide_ID(String guide_ID) {
		Guide_ID = guide_ID;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getCourse_code() {
		return Course_code;
	}
	public void setCourse_code(String course_code) {
		Course_code = course_code;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	
}
