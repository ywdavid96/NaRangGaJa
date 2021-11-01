package customer.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import customer.dao.CustomerDAO;
import customer.model.Customer;

public class CustomerService {
	private static CustomerService service = new CustomerService();
	public CustomerDAO dao = CustomerDAO.getInstance();
	private CustomerService() {}
	
	public static CustomerService getInstance() {
		return service;
	}
	
	public void CustomerInsert(Customer customer) {
		dao.CustomerInsert(customer);
	}
	
	public int CustomerLogin(String id,String passwd) throws SQLException {
		return dao.CustomerLogin(id, passwd);
	}
	
	public int CustomerSNSLogin(String id,String name) throws SQLException {
		return dao.CustomerSNSLogin(id, name);
	}
	
	public void CustomerUpdate(Customer customer) {
		dao.CustomerUpdate(customer);
	}
	
	public void CustomerDelete(String id) {
		dao.CustomerDelete(id);
	}
	
	public ResultSet SelectAllCustomers() {
		return dao.selectAllCustomers();
	}
	
	public ResultSet SelectName(String id) {
		return dao.SelectName(id);
	}
	
	public int checkDuplicate(String id) {
		return dao.checkDuplicate(id);
	}
	
	
}
