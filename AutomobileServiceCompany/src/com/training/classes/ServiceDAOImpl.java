package com.training.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.training.ifaces.DAO;

public class ServiceDAOImpl implements DAO {

	
	private Connection con;
	private Context ctx;
	public ServiceDAOImpl() {
		super();
		try {
			ctx = new InitialContext();
			DataSource  dataSource=(DataSource) ctx.lookup("java:comp/env/jdbc/ds1");
			con=dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(con);
	}

	@Override
	public String validateCredential(String empUserName, String empPassword) throws Exception{
		String sql = "select * from empDetRam where empUsername=?";
		String password=null;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,empUserName);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			password=rs.getString("empPassword");
		}
		pstmt.close();
		return password;
	}

	@Override
	public int empRegister(String empUserName, String empPassword) throws Exception {
		String sql = "insert into empDetRam (empUserName,empPassword) values(?,?)";
		int rowAdded=0;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,empUserName);
		pstmt.setString(2,empPassword);
		rowAdded= pstmt.executeUpdate();
		
		return rowAdded;
	}

	@Override
	public int checkExistence(String carNumberPlateNum) throws Exception {
		String sql="select * from autoRam where carNumberPlateNum=?";
		int exists=0;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			exists=1;
		}
		
		return exists;
	}

	@Override
	public int addCustDetails(String carNumberPlateNum, String custName, String mobNum, String emailId)
			throws Exception {
		
		String sql = "insert into autoRam (carNumberPlateNum,custName,mobNum,emailId ) values(?,?,?,?)";
		int rowAdded=0;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,custName);
		pstmt.setString(3,mobNum);
		pstmt.setString(4,emailId);
		rowAdded= pstmt.executeUpdate();
		
		return rowAdded;
	}

	@Override
	public int addAddress(String carNumberPlateNum, String lineOne, String lineTwo, String city, String pinCode)
			throws Exception {
		String sql = "insert into custAddressRam (carNumberPlateNum,lineOne,lineTwo,city,pinCode ) values(?,?,?,?,?)";
		int rowAdded=0;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,lineOne);
		pstmt.setString(3,lineTwo);
		pstmt.setString(4,city);
		pstmt.setString(5,pinCode);
		rowAdded= pstmt.executeUpdate();
		
		return rowAdded;
	}

	@Override
	public int addCarDetails(String carNumberPlateNum, String carName, String carCategory, String insuranceNumber)
			throws Exception {
		String sql = "insert into carDetRam (carNumberPlateNum,carName,carCategory,insuranceNumber ) values(?,?,?,?)";
		int rowAdded=0;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,carName);
		pstmt.setString(3,carCategory);
		pstmt.setString(4,insuranceNumber);
		rowAdded= pstmt.executeUpdate();
		
		return rowAdded;
	}

	@Override
	public int updateField(String field, String newVal, String carNumberPlateNum) throws Exception {
		String sql = "update autoRam set "+field+"=? where carNumberPlateNum=?";
				int rowAdded=0;
				PreparedStatement pstmt = null;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,newVal);
				pstmt.setString(2,carNumberPlateNum);
				
				rowAdded= pstmt.executeUpdate();
				
				return rowAdded;
	}

	@Override
	public String findType(String carNumberPlateNum) throws Exception {
		String sql="select * from carDetRam where carNumberPlateNum=?";
		String carCategory=null;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			carCategory=rs.getString("carCategory");
		}
		
		return carCategory;
	}

	@Override
	public double getServiceCost(String carCategory, String serviceName) throws Exception {
		double serviceCost = 0.0;
		
		
			String sql="select serviceCost from serviceListRam where carCategory=? and serviceName=?";
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,carCategory);
			pstmt.setString(2, serviceName);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				serviceCost=rs.getDouble("serviceCost");
			}
		
		
		
		
		return serviceCost;
	}

	@Override
	public int addService(String carNumberPlateNum, String serviceName, double serviceCost) throws Exception {
		String sql = "insert into serviceHistRam (carNumberPlateNum,dateOfService,serviceName,serviceCost ) values(?,?,?,?)";
		int rowAdded=0;
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date dateOfService = new Date();  
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,formatter.format(dateOfService));
		pstmt.setString(3,serviceName);
		pstmt.setDouble(4,serviceCost);
		rowAdded= pstmt.executeUpdate();
		
		return rowAdded;
	}

	@Override
	public int addAmount(String carNumberPlateNum, double insuranceAmount, double grandTotal)
			throws Exception {
		String sql = "insert into amountHistRam (carNumberPlateNum,dateOfService,insuranceAmount,grandTotal ) values(?,?,?,?)";
		int rowAdded=0;
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date dateOfService = new Date();  
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,formatter.format(dateOfService));
		pstmt.setDouble(3,insuranceAmount);
		pstmt.setDouble(4,grandTotal);
		rowAdded= pstmt.executeUpdate();
		
		return rowAdded;
	}

	@Override
	public Customer getCustDetails(String carNumberPlateNum) throws Exception {
		String custName = null;
		String mobNum = null;
		String emailId = null;
		
		
		String sql="select custName,mobNum,emailId from autoRam where carNumberPlateNum=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			custName=rs.getString("custName");
			mobNum=rs.getString("mobNum");
			emailId=rs.getString("emailId");
		}
	
	Customer customer=new Customer(custName,mobNum,emailId);
	
	
	return customer;
	}

	@Override
	public Service getAmount(String carNumberPlateNum) throws Exception {
		double insuranceAmount=0;
		double grandTotal=0;
		double netAmount=0 ;
		
		
		String sql="select insuranceAmount,grandTotal from amountHistRam where carNumberPlateNum=? and dateOfService=?";
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date dateOfService = new Date();  
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,formatter.format(dateOfService));
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			insuranceAmount=rs.getDouble("insuranceAmount");
			grandTotal=rs.getDouble("grandTotal");	
		}
	netAmount=insuranceAmount+grandTotal;
	Service service=new Service(insuranceAmount,netAmount,grandTotal);
	
	
	return service;
	}

	@Override
	public List<Service> getServiceDetails(String carNumberPlateNum) throws Exception {
		String eachServiceName;
		double serviceCost;
		List<Service> serviceList = new ArrayList<>();
		String sql="select serviceName,serviceCost from serviceHistRam where carNumberPlateNum=? and dateOfService=?";
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date dateOfService = new Date();  
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		pstmt.setString(2,formatter.format(dateOfService));
		
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			eachServiceName = rs.getString("serviceName");
			serviceCost=rs.getDouble("serviceCost");
			Service service=new Service(eachServiceName,serviceCost);
			serviceList.add(service);
			
		}
		
		
		return serviceList;
	}

	@Override
	public List<Service> getHistory() throws Exception {
		List<Service> serviceList = new ArrayList<>();
		String carNumberPlateNumber;
		String dateOfService;
		String eachServiceName;
		double serviceCost;
		
		String sql="select * from serviceHistRam";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			carNumberPlateNumber=rs.getString("carNumberPlateNum");
			dateOfService=rs.getString("dateOfService");
			eachServiceName = rs.getString("serviceName");
			serviceCost=rs.getDouble("serviceCost");
			Service service=new Service(carNumberPlateNumber,dateOfService,eachServiceName,serviceCost);
			serviceList.add(service);
		}
	 
		return serviceList;
	}

	

}
