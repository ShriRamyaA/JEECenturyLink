package com.training.ifaces;

import java.util.HashMap;
import java.util.List;

import com.training.classes.Insurance;

public interface DAO {
 
	public double getInsuranceAmount(String carNumberPlateNum ) throws Exception;
}
