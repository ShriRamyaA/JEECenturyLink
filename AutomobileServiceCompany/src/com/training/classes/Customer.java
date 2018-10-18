package com.training.classes;

public class Customer {

	private String custName;
	private String mobNum;
	private String emailId;
	private Car car;
	private CustAddress custAddress;
	private String field;
	private String newVal;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(String custName, String mobNum, String emailId, Car car, CustAddress custAddress, String field,
			String newVal) {
		super();
		this.custName = custName;
		this.mobNum = mobNum;
		this.emailId = emailId;
		this.car = car;
		this.custAddress = custAddress;
		this.field = field;
		this.newVal = newVal;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getMobNum() {
		return mobNum;
	}
	public void setMobNum(String mobNum) {
		this.mobNum = mobNum;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public CustAddress getCustAddress() {
		return custAddress;
	}
	public void setCustAddress(CustAddress custAddress) {
		this.custAddress = custAddress;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getNewVal() {
		return newVal;
	}
	public void setNewVal(String newVal) {
		this.newVal = newVal;
	}
	public Customer(String field, String newVal) {
		super();
		this.field = field;
		this.newVal = newVal;
	}
	public Customer(String custName, String mobNum, String emailId) {
		super();
		this.custName = custName;
		this.mobNum = mobNum;
		this.emailId = emailId;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return custName+mobNum+emailId;
	}
	
	
}
