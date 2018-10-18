package com.training.classes;

public class Employee {

	private String empUserName;
	private String empPassword;
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(String empUserName, String empPassword) {
		super();
		this.empUserName = empUserName;
		this.empPassword = empPassword;
	}
	public Employee(String empUserName) {
		super();
		this.empUserName = empUserName;
	}
	public String getEmpUserName() {
		return empUserName;
	}
	public void setEmpUserName(String empUserName) {
		this.empUserName = empUserName;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	
	
}
