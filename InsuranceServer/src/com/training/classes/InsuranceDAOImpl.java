package com.training.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.training.ifaces.DAO;

public class InsuranceDAOImpl implements DAO {

	private Connection con;
	private Context ctx;
	public InsuranceDAOImpl() {
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
	public double getInsuranceAmount(String carNumberPlateNum) throws Exception {
		String sql="select * from insuranceDetRam where carNumberPlateNum=?";
		double insuranceAmt=0.0;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carNumberPlateNum);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			insuranceAmt=rs.getDouble("insuranceAmount");
		}
		
		
		return insuranceAmt;
	}
	
	

}
