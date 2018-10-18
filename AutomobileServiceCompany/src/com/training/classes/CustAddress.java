package com.training.classes;

public class CustAddress {

	//private String carNumberPlateNum;
	private String lineOne;
	private String lineTwo;
	private String city;
	private String pinCode;
	public CustAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	
//	public CustAddress(String carNumberPlateNum) {
//		super();
//		this.carNumberPlateNum = carNumberPlateNum;
//	}

//	public String getCarNumberPlateNum() {
//		return carNumberPlateNum;
//	}
//
//	public void setCarNumberPlateNum(String carNumberPlateNum) {
//		this.carNumberPlateNum = carNumberPlateNum;
//	}

	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return " Address:"+" Line One:"+lineOne+" Line Two:"+lineTwo+" City:"+city+" Pincode:"+pinCode;
	}

public String getLineOne() {
		return lineOne;
	}

	public void setLineOne(String lineOne) {
		this.lineOne = lineOne;
	}

	public String getLineTwo() {
		return lineTwo;
	}

	public void setLineTwo(String lineTwo) {
		this.lineTwo = lineTwo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

public CustAddress(String lineOne, String lineTwo, String city, String pinCode) {
	super();
	this.lineOne = lineOne;
	this.lineTwo = lineTwo;
	this.city = city;
	this.pinCode = pinCode;
}
	
	
	
}
