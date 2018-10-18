package com.training.resources;



import java.util.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

import com.training.classes.Insurance;
import com.training.classes.InsuranceDAOImpl;
import com.training.ifaces.DAO;



@Path("/insurance")
public class InsuranceResources {
	

	@POST
	@Path("getInsurance")
	@Consumes( MediaType.APPLICATION_JSON)
	public double getInsurance(Insurance insurance) {
		Insurance forLog=new Insurance(insurance.getCarNumberPlateNum());
		forLog.setCarNumberPlateNum(insurance.getCarNumberPlateNum());
		
		double insuranceAmount=0.0;
		DAO dao=new InsuranceDAOImpl();
		try {
			insuranceAmount=dao.getInsuranceAmount(insurance.getCarNumberPlateNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(insuranceAmount);
		Logger log=Logger.getLogger("second");
		log.info("One Request from Automobile Service Company"+"@"+ new Date()+" Recieved.");
		log.info(forLog);
		return insuranceAmount;
	
}
	
	
}
