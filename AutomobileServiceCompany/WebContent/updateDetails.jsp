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
<title>Update</title>
<style>body{padding-left: 1em;}</style>
<script type="text/javascript" src="js/jquery1-7-2.js"></script>
<script type="text/javascript">
$(function(){
	var carNumberPlateNum=$("#carNumberPlateNum").val();

$("#update").on('click',function(){
	
	
	var field=$("#updateField").val();
	var newVal=$("#newVal").val();
	
	obj={
			 "car":{"carNumberPlateNum":carNumberPlateNum},
			 "field":field,
			 "newVal":newVal };
$.ajax({
		
		url:"http://localhost:8080/AutomobileServiceCompany/rest/company/update",
		type:'POST',
		dataType:'html',
		data:JSON.stringify(obj),
		contentType:'application/json;charset=utf-8',
		success:function(data,textStatus,jqXHR){
			console.log(data);
			var msg="Update Successfull!"
			$("#updated").show();
			
			},
		error:function(jqXHR,textStatus,errorThrown){
				console.log(errorThrown);
				
			}
	});
	
	
	});	


});

</script>
</head>
<body >
<div><jsp:include page="header.html"></jsp:include></div>
<form action="form1.jsp" >
<input type="submit" value="Go Home" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<c:set var = "regNum" value='${sessionScope["regNum"]}'/>
<form>
<div class="form-group">
<label for="carNumberPlateNum">Enter your car Number</label>
<input type="text" required name="carNumberPlateNum" id="carNumberPlateNum" 
value=<c:out value = "${regNum}"/> class="form-control"/>
</div>



<div class="form-group">
<label for="updateField">Select the field you want to update</label>
<select  name="updateField" id="updateField" >
<option >Choose a option</option>
<option value="custName">Customer Name</option>
<option value="mobNum">Mobile Number</option>
<option value="emailId">Email Id</option>
</select>
</div>

<div class="form-group"  id="hidden1">
<label for="newVal1">Enter the new value</label>
<input type="text" required name="newVal1" id="newVal" />
</div>


<input type="button" value="Update" id="update" class="btn btn-success"/>
<p id="updated" style="display:none">Update Successfull!</p>
</form>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>