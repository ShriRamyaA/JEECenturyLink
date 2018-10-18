package com.training.classes;

import java.util.HashMap;
import java.util.List;

public class Insurance {

	private String carNumberPlateNum;
	private String insuranceNumber;
	private double insuranceAmount;
	public Insurance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Insurance(String carNumberPlateNum, String insuranceNumber, double insuranceAmount) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.insuranceNumber = insuranceNumber;
		this.insuranceAmount = insuranceAmount;
	}
	public String getCarNumberPlateNum() {
		return carNumberPlateNum;
	}
	public void setCarNumberPlateNum(String carNumberPlateNum) {
		this.carNumberPlateNum = carNumberPlateNum;
	}
	public String getInsuranceNumber() {
		return insuranceNumber;
	}
	public void setInsuranceNumber(String insuranceNumber) {
		this.insuranceNumber = insuranceNumber;
	}
	public double getInsuranceAmount() {
		return insuranceAmount;
	}
	public void setInsuranceAmount(double insuranceAmount) {
		this.insuranceAmount = insuranceAmount;
	}
	public Insurance(String carNumberPlateNum) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Car Registration number is "+carNumberPlateNum;
	}
	
	
	
}
