package com.training.classes;

public class Car {

	private String carNumberPlateNum;
	private String carName;
	private String carCategory;
	private String insuranceNumber;
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Car(String carNumberPlateNum, String carName, String carCategory, String insuranceNumber) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.carName = carName;
		this.carCategory = carCategory;
		this.insuranceNumber = insuranceNumber;
	}
	

	public String getCarNumberPlateNum() {
		return carNumberPlateNum;
	}

	public void setCarNumberPlateNum(String carNumberPlateNum) {
		this.carNumberPlateNum = carNumberPlateNum;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarCategory() {
		return carCategory;
	}

	public void setCarCategory(String carCategory) {
		this.carCategory = carCategory;
	}

	public String getInsuranceNumber() {
		return insuranceNumber;
	}

	public void setInsuranceNumber(String insuranceNumber) {
		this.insuranceNumber = insuranceNumber;
	}

	public Car(String carNumberPlateNum) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
	}

	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return " Car Details:"+" Number Plate:"+carNumberPlateNum+" Car Model Name:"+carName+" Category:"+carCategory+" Insurance Number:"+insuranceNumber;
	}
	
	
	
	
	
}
