<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">
<style>body{padding-left: 1em;}</style>
<title>Customer</title>

<script type="text/javascript" src="js/jquery1-7-2.js"></script>
<script type="text/javascript">

$(function(){
	
	
	$("#register").on('click',function(){
		
		if($('#work')[0].checkValidity()){
		
		var carNumberPlateNum=$("#carNumberPlateNum").val();
		var custName=$("#custName").val();
		var mobNum=$("#mobNum").val();
		var emailId=$("#emailId").val();
		var lineOne=$("#lineOne").val();
		var lineTwo=$("#lineTwo").val();
		var city=$("#city").val();
		var pinCode=$("#pinCode").val();
		var carName=$("#carName").val();
		var carCategory=$("#carCategory").val();
		var insuranceNumber=$("#insuranceNumber").val();
		
		
		 obj={"carNumberPlateNum":carNumberPlateNum,
				 "custName":custName,
				 "mobNum":mobNum,
				 "emailId":emailId,
				 "car":{
				 "carNumberPlateNum":carNumberPlateNum,
				 "carName":carName,
				 "carCategory":carCategory,
				 "insuranceNumber":insuranceNumber},
				"custAddress":{
				 "lineOne":lineOne,
				 "lineTwo":lineTwo,
				 "city":city,
				 "pinCode":pinCode}
				 };
		 
		$.ajax({
			
			url:"http://localhost:8080/AutomobileServiceCompany/rest/company/addCustDetails",
			type:'POST',
			dataType:'html',
			data:JSON.stringify(obj),
			contentType:'application/json;charset=utf-8',
			success:function(data,textStatus,jqXHR){
				console.log(data);
				$("#avail").show();},
			error:function(jqXHR,textStatus,errorThrown){
					console.log(errorThrown);
				}
		});
		
	
		}
		
	
});
});
</script> 
</head>


<body>
<div><jsp:include page="header.html"></jsp:include></div>

<form action="form1.jsp" >
<input type="submit" value="Go Home" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<p class="text-info">New User! Enter the details and Register</p>
<c:set var = "regNum" value='${sessionScope["regNum"]}'/>

<form id="work">
<div class="form-group">
<label for="carNumberPlateNum">Enter your car Number</label>
<input type="text" value=<c:out value = "${regNum}"/> required 
name="carNumberPlateNum" id="carNumberPlateNum" 
 class="form-control" />
</div>

<div class="form-group">
<label for="custName">Customer Name</label>
<input type="text" required name="custName" id="custName" 
placeholder="Enter Customer name" class="form-control"/>
</div>

<div class="form-group">
<label for="mobNum">Mobile Number</label>
<input type="text" required name="mobNum" id="mobNum"
placeholder="eg. 9454339566" class="form-control"/>
</div>

<div class="form-group">
<label for="emailId">Email ID</label>
<input type="email" required name="emailId" id="emailId"
placeholder="eg. abc@host.com" class="form-control"/>
</div>

<div class="form-group">
<label for="lineOne">ADDRESS: Line One</label>
<input type="text" required name="lineOne" id="lineOne" 
placeholder="Line 1" class="form-control"/>
</div>

<div class="form-group">
<label for="lineTwo">Line Two</label>
<input type="text"  name="lineTwo" id="lineTwo" 
placeholder="Line Two" class="form-control"/>
</div>

<div class="form-group">
<label for="city">City:</label>
<input type="text" required name="city" id="city"
placeholder="Enter City" class="form-control"/>
</div>

<div class="form-group">
<label for="pinCode">Pincode:</label>
<input type="text" required name="pinCode" id="pinCode"
placeholder="eg. 560018" class="form-control"/>
</div>

<div class="form-group">
<label for="carName">Car Model Name</label>
<input type="text" required name="carName" id="carName" 
placeholder="Enter Customer name" class="form-control"/>
</div>

<div class="form-group">
<label for="carCategory">Select the range of cost of car</label>
<select name="carCategory" id="carCategory">
<option value="Type1">less than 10lakhs</option>
<option value="Type2">between 10 and 30 lakhs</option>
<option value="Type3">more than 30lakhs</option>
</select>
</div>

<div class="form-group">
<label for="insuranceNumber">Insurance Number(if any)</label>
<input type="insuranceNumber"  name="insuranceNumber" id="insuranceNumber"
placeholder="Enter the car insurance number" class="form-control"/>
</div>


<input type="submit" value="Register" id="register" class="btn btn-success"/>
</form>
<p></p>
<p></p>
<form action="custExists.jsp" >
<input type="submit" value="Go to Next Page" class="btn btn-info" style="display:none" id="avail"/>
</form>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>