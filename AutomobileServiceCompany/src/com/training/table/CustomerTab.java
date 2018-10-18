package com.training.table;

import java.util.HashMap;

public class CustomerTab {

	private String carNumberPlateNum;
	private String[] doub;
	public CustomerTab() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CustomerTab(String carNumberPlateNum, String[] doub) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.doub = doub;
	}

	public String getCarNumberPlateNum() {
		return carNumberPlateNum;
	}

	public void setCarNumberPlateNum(String carNumberPlateNum) {
		this.carNumberPlateNum = carNumberPlateNum;
	}

	public String[] getDoub() {
		return doub;
	}

	public void setDoub(String[] doub) {
		this.doub = doub;
	}

	public CustomerTab(String carNumberPlateNum) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
	}
	
	
	
	
}
