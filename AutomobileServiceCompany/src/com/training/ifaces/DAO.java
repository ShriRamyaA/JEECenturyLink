package com.training.ifaces;

import java.util.List;


import com.training.classes.Customer;
import com.training.classes.Service;

public interface DAO {

	public String validateCredential(String empUserName,String empPassword) throws Exception;
	public int empRegister(String empUserName,String empPassword) throws Exception;
	public int checkExistence(String carNumberPlateNum) throws Exception;
	public int addCustDetails(String carNumberPlateNum, String custName, String mobNum, String emailId) throws Exception;
	public int addAddress(String carNumberPlateNum, String lineOne, String lineTwo, String city,String pinCode) throws Exception;
	public int addCarDetails(String carNumberPlateNum, String carName, String carCategory, String insuranceNumber) throws Exception;
	public int updateField(String field, String newVal, String carNumberPlateNum) throws Exception;
	
	public String findType(String carNumberPlateNum) throws Exception;
	public double getServiceCost(String carCategory,String serviceName) throws Exception;
	public int addService(String carNumberPlateNum,String serviceName,double serviceCost) throws Exception;
	public int addAmount(String carNumberPlateNum,double insuranceAmount,double grandTotal) throws Exception;
	
	public Customer getCustDetails(String carNumberPlateNum) throws Exception;
	public Service getAmount(String carNumberPlateNum) throws Exception;
	public List<Service> getServiceDetails(String carNumberPlateNum) throws Exception;
	
	public List<Service> getHistory() throws Exception;
	
	
	
}
