package customer.model;

public class Customer {
	
	String Customer_ID;
	String Customer_PWD;
	String Customer_name;
	int SNS_code;
	String Gender;
	int Age;
	
	
	
	public String getCustomer_ID() {
		return Customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		Customer_ID = customer_ID;
	}
	public String getCustomer_PWD() {
		return Customer_PWD;
	}
	public void setCustomer_PWD(String customer_PWD) {
		Customer_PWD = customer_PWD;
	}
	public String getCustomer_name() {
		return Customer_name;
	}
	public void setCustomer_name(String customer_name) {
		Customer_name = customer_name;
	}
	public int getSNS_code() {
		return SNS_code;
	}
	public void setSNS_code(int sNS_code) {
		SNS_code = sNS_code;
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
