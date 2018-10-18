package com.training.resources;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

import com.training.classes.Car;
import com.training.classes.CustAddress;
import com.training.classes.Customer;

import com.training.classes.Service;
import com.training.classes.ServiceDAOImpl;
import com.training.ifaces.DAO;







@Path("/company")
public class CompanyResources {
private double netAmount=0.0;
double[] serviceAmount;

	
	
public CompanyResources() {
	super();
	// TODO Auto-generated constructor stub
}

@POST
@Path("addCustDetails")
@Consumes({ MediaType.APPLICATION_JSON})
public int addCustDetails(Customer cust) {
	
    Car car=cust.getCar();
    CustAddress custAddress=cust.getCustAddress();

	DAO dao=new ServiceDAOImpl();
	int rowAdded=0;
	int row1=0;
	int row2=0;
	int row3=0;
	try {
	row1=dao.addCustDetails(car.getCarNumberPlateNum(),cust.getCustName(),cust.getMobNum(),cust.getEmailId());
	row2=dao.addAddress(car.getCarNumberPlateNum(),custAddress.getLineOne(),custAddress.getLineTwo(),custAddress.getCity(),custAddress.getPinCode());
	row3=dao.addCarDetails(car.getCarNumberPlateNum(),car.getCarName(),car.getCarCategory(),car.getInsuranceNumber());	
	} catch (Exception e) {
		 //TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(row1==1&&row2==1&&row3==1) {
		rowAdded=1;
	}
	System.out.println(rowAdded+"row added");
	
	return rowAdded;
}
	
@POST
@Path("calAmount")
@Consumes({ MediaType.APPLICATION_JSON})
public double calAmount(Service service) {
	String carCategory=null;
	
	 
String[] serviceName=service.getServiceName();

DAO dao=new ServiceDAOImpl();
try {
	carCategory=dao.findType(service.getCarNumberPlateNum());
} catch (Exception e) {
	e.printStackTrace();
}
try {
	for(int i=0;i<serviceName.length;i++) {
	double amount=dao.getServiceCost(carCategory, serviceName[i]);
	netAmount=	netAmount+amount;
}

} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
double grandTotal=netAmount-service.getInsuranceAmount();
Service forLog=new Service(service.getCarNumberPlateNum(),service.getInsuranceAmount());
forLog.setCarNumberPlateNum(service.getCarNumberPlateNum());
forLog.setInsuranceAmount(service.getInsuranceAmount());
Logger log=Logger.getLogger("second");
log.info("One Respose from Insurance Company"+"@"+ new Date()+" Recieved.");
log.info(forLog);

	return grandTotal;
}

@POST
@Path("confirm")
@Consumes( MediaType.APPLICATION_JSON)
public int confirm(Service service) {
	
	int rowAdded1=0;
	int rowAdded2=0;
	String carCategory=null;
	String[] serviceName=service.getServiceName();
	DAO dao=new ServiceDAOImpl();
	try {
		carCategory=dao.findType(service.getCarNumberPlateNum());
	} catch (Exception e) {
		e.printStackTrace();
	}
	try {
		for(int i=0;i<serviceName.length;i++) {
		double amount=dao.getServiceCost(carCategory, serviceName[i]);
		netAmount=	netAmount+amount;
		rowAdded1=dao.addService(service.getCarNumberPlateNum(), serviceName[i], amount);
		//System.out.println(rowAdded1);
	}

	} catch (Exception e) {
		
		e.printStackTrace();
	}
	double grandTotal=netAmount-service.getInsuranceAmount();
	
	try {
		rowAdded2=dao.addAmount(service.getCarNumberPlateNum(), service.getInsuranceAmount(), grandTotal);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//System.out.println(rowAdded2);
	return rowAdded1+rowAdded2;
}	

@POST
@Path("update")
@Consumes( MediaType.APPLICATION_JSON)
public int updateDetails(Customer customer) {
	
	int rowAdded=0;
	 Car car=customer.getCar();
	DAO dao=new ServiceDAOImpl();
	try {
		rowAdded=dao.updateField(customer.getField(), customer.getNewVal(), car.getCarNumberPlateNum());
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	 
	 
	return rowAdded;
	
	
}

}
