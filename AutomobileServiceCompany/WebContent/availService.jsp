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
<title>Services</title>


<script type="text/javascript" src="js/jquery1-7-2.js"></script>

<script type="text/javascript">

$(function(){
	var carNumberPlateNum=$("#carNumberPlateNum").val();
	var insuranceAmount = 0.0;
	$("#insuranceClaim").change(function() {
	    if( this.checked ){
		
		obj={
			 "carNumberPlateNum":carNumberPlateNum
			 
			 };
	
	$.ajax({
		
		url:"http://localhost:8080/InsuranceServer/rest/insurance/getInsurance",
		type:'POST',
		dataType:'html',
		data:JSON.stringify(obj),
		contentType:'application/json;charset=utf-8',
		success:function(data,textStatus,jqXHR){
			insuranceAmount = data;
			$("#showInsurance").show();
			$('#insAmt').text(data);
			
			},
		error:function(jqXHR,textStatus,errorThrown){
				console.log(errorThrown);
			}
	});
	}
	    });
	
	$("#CalculateAmount").on('click',function(){
		
		var selected = [];
		$('div#selected input[type=checkbox]').each(function() {
		 if ($(this).is(":checked")) {
		   selected.push($(this).attr('name'));
		}
		});
	 
		obj={
			 "carNumberPlateNum":carNumberPlateNum,
			 "insuranceAmount":insuranceAmount,
			 "serviceName":selected
			 };
	
	$.ajax({
		
		url:"http://localhost:8080/AutomobileServiceCompany/rest/company/calAmount",
		type:'POST',
		dataType:'html',
		data:JSON.stringify(obj),
		contentType:'application/json;charset=utf-8',
		success:function(data,textStatus,jqXHR){
			console.log(data);
			var grandTotal=data;
			var netAmount=parseFloat(insuranceAmount)+parseFloat(data);
			$("#showNetAmount").show();
			$('#netAmount').text(netAmount);
			$("#showTotalAmount").show();
			$('#grandTotal').text(data);
			$('#confirm').show();
			$('#cancel').show();
			
			
		},
		error:function(jqXHR,textStatus,errorThrown){
				console.log(errorThrown);
			}
	});
});

	
$("#confirm").on('click',function(){
	
		var selected = [];
		$('div#selected input[type=checkbox]').each(function() {
		 if ($(this).is(":checked")) {
		   selected.push($(this).attr('name'));
		}
		});
	 
		obj={
			 "carNumberPlateNum":carNumberPlateNum,
			 "insuranceAmount":insuranceAmount,
			 "serviceName":selected
			 };
	
	$.ajax({
		
		url:"http://localhost:8080/AutomobileServiceCompany/rest/company/confirm",
		type:'POST',
		dataType:'html',
		data:JSON.stringify(obj),
		contentType:'application/json;charset=utf-8',
		success:function(data,textStatus,jqXHR){
			console.log(data);
			$("#generate").show();
			
			
		},
		error:function(jqXHR,textStatus,errorThrown){
				console.log(errorThrown);
			}
	});
});



		
	$("#cancel").on('click',function(){
		window.location.href="custExists.jsp";
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
<c:set var = "regNum" value='${sessionScope["regNum"]}'/>

<form id="work">

<div class="form-group">
<label for="carNumberPlateNum">Enter your car Number</label>
<input type="text" required name="carNumberPlateNum" id="carNumberPlateNum" 
value=<c:out value = "${regNum}"/> class="form-control"/>
</div>





<div class="form-group">
<label for="service">Check service(s)</label><br>


<div id="selected">
    <input type="checkbox" name="Polishing" id="Polishing" value="Polishing">Polishing<br>
	<input type="checkbox" name="WheelBalancing" id="WheelBalancing" value="WheelBalancing">Wheel balancing<br>
	<input type="checkbox" name="FullService" id="FullService" value="FullService"> Full Service<br>
	<input type="checkbox" name="DecorService" id="DecorService" value="DecorService">Decor Service<br>
	<input type="checkbox" name="BatteryReplacement" id="BatteryReplacement" value="BatteryReplacement">Battery Replacement<br>
	</div>
	<p></p>
	<label for="insuranceClaim">Check this box to claim insurance</label><br>
	<input type="checkbox" name="insuranceClaim" id="insuranceClaim" value="insuranceClaim">Claim Insurance<br>
	<p id="showInsurance" style="display:none">Insurance Claim amount is Rs.<span id="insAmt"></span></p>
</div>

<p></p><p></p>

<input type="button" value="Calculate Amount" id="CalculateAmount" class="btn btn-success"/>
<p id="showNetAmount" style="display:none">Net Amount without Insurance Claim is Rs.<span id="netAmount"></span></p>
<p id="showTotalAmount" style="display:none">Amount to be paid for Service(s) is Rs.<span id="grandTotal"></span></p>
<input type="button" value="Confirm Services" id="confirm" class="btn btn-success" style="display:none"/>
<p></p><p></p>
<input type="button" value="Cancel" id="cancel" class="btn btn-danger" style="display:none"/>



</form>
<p></p><p></p>
<form action="PrintBillServlet" method="post">
<input type="submit" value="Generate Bill" id="generate" class="btn btn-success" style="display:none"/>
</form>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>