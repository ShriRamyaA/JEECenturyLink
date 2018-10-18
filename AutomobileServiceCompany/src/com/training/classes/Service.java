package com.training.classes;



public class Service {

	private String carNumberPlateNum;
	private double serviceCost;
	private double insuranceAmount;
	private double netAmount;
	private double grandTotal;
	private String dateOfService;
	private String[] serviceName;
	private String eachServiceName;
	public Service() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Service(String eachServiceName,double serviceCost) {
		super();
		this.eachServiceName = eachServiceName;
		this.serviceCost = serviceCost;
		
	}

	public Service(double insuranceAmount, double netAmount, double grandTotal) {
		super();
		this.insuranceAmount = insuranceAmount;
		this.netAmount = netAmount;
		this.grandTotal = grandTotal;
	}

	public Service(double insuranceAmount, double grandTotal) {
		super();
		this.insuranceAmount = insuranceAmount;
		this.grandTotal = grandTotal;
	}

	public Service(String carNumberPlateNum, double insuranceAmount, double grandTotal, String[] serviceName) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.insuranceAmount = insuranceAmount;
		this.grandTotal = grandTotal;
		this.serviceName = serviceName;
	}

	public Service(String carNumberPlateNum, double insuranceAmount, String[] serviceName) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.insuranceAmount = insuranceAmount;
		this.serviceName = serviceName;
	}

	public String getCarNumberPlateNum() {
		return carNumberPlateNum;
	}

	public void setCarNumberPlateNum(String carNumberPlateNum) {
		this.carNumberPlateNum = carNumberPlateNum;
	}

	public double getServiceCost() {
		return serviceCost;
	}

	public void setServiceCost(double serviceCost) {
		this.serviceCost = serviceCost;
	}

	public double getInsuranceAmount() {
		return insuranceAmount;
	}

	public void setInsuranceAmount(double insuranceAmount) {
		this.insuranceAmount = insuranceAmount;
	}

	public double getNetAmount() {
		return netAmount;
	}

	public void setNetAmount(double netAmount) {
		this.netAmount = netAmount;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public String getDateOfService() {
		return dateOfService;
	}

	public void setDateOfService(String dateOfService) {
		this.dateOfService = dateOfService;
	}

	public String[] getServiceName() {
		return serviceName;
	}

	public void setServiceName(String[] serviceName) {
		this.serviceName = serviceName;
	}

	public String getEachServiceName() {
		return eachServiceName;
	}

	public void setEachServiceName(String eachServiceName) {
		this.eachServiceName = eachServiceName;
	}

	public Service(String carNumberPlateNum, double serviceCost, double insuranceAmount, double netAmount,
			double grandTotal, String dateOfService, String[] serviceName, String eachServiceName) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.serviceCost = serviceCost;
		this.insuranceAmount = insuranceAmount;
		this.netAmount = netAmount;
		this.grandTotal = grandTotal;
		this.dateOfService = dateOfService;
		this.serviceName = serviceName;
		this.eachServiceName = eachServiceName;
	}

	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Car Number is "+carNumberPlateNum+"Insurance Amount is "+insuranceAmount;
	}

	public Service(String carNumberPlateNum, String dateOfService, String eachServiceName, double serviceCost) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.serviceCost = serviceCost;
		this.dateOfService = dateOfService;
		this.eachServiceName = eachServiceName;
	}

	public Service(String carNumberPlateNum, double insuranceAmount, String dateOfService) {
		super();
		this.carNumberPlateNum = carNumberPlateNum;
		this.insuranceAmount = insuranceAmount;
		this.dateOfService = dateOfService;
	}
	
	

	
	
	
	
	
}
