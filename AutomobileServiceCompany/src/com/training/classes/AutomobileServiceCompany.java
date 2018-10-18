package com.training.classes;

public class AutomobileServiceCompany {

	private Employee emp;
	private Service service;
	private Customer customer;
	public AutomobileServiceCompany() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AutomobileServiceCompany(Employee emp, Service service, Customer customer) {
		super();
		this.emp = emp;
		this.service = service;
		this.customer = customer;
	}
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	public Service getService() {
		return service;
	}
	public void setService(Service service) {
		this.service = service;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public AutomobileServiceCompany(Service service) {
		super();
		this.service = service;
	}
	
	
	
 
}
