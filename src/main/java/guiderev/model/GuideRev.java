package guiderev.model;

public class GuideRev {
	
	String Guide_ID;
	String Customer_ID;
	String detail;
	String date;
	int rep;
	
	
	public String getGuide_ID() {
		return Guide_ID;
	}
	public void setGuide_ID(String guide_ID) {
		Guide_ID = guide_ID;
	}
	public String getCustomer_ID() {
		return Customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		Customer_ID = customer_ID;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getRep() {
		return rep;
	}
	public void setRep(int rep) {
		this.rep = rep;
	}
	
	
}
