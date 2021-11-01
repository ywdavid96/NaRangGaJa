package guide.model;

public class Guide {
	
	String Guide_ID;
	String Guide_PWD;
	String Guide_name;
	int SNS_code;
	int Payment;
	String Region;
	String Gender;
	int Age;
	
	
	public String getGuide_ID() {
		return Guide_ID;
	}
	public void setGuide_ID(String guide_ID) {
		Guide_ID = guide_ID;
	}
	public String getGuide_PWD() {
		return Guide_PWD;
	}
	public void setGuide_PWD(String guide_PWD) {
		Guide_PWD = guide_PWD;
	}
	public String getGuide_name() {
		return Guide_name;
	}
	public void setGuide_name(String guide_name) {
		Guide_name = guide_name;
	}
	public int getSNS_code() {
		return SNS_code;
	}
	public void setSNS_code(int sNS_code) {
		SNS_code = sNS_code;
	}
	public int getPayment() {
		return Payment;
	}
	public void setPayment(int payment) {
		Payment = payment;
	}
	public String getRegion() {
		return Region;
	}
	public void setRegion(String region) {
		Region = region;
	}
	
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	
	
}
