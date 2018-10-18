<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.training.classes.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">
<style>body{padding-left: 1em;}</style>
<title>Bill</title>
</head>
<body>
<div><jsp:include page="header.html"></jsp:include></div>
<form action="form1.jsp" >
<input type="submit" value="Go Home" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<%Customer customer=(Customer)session.getAttribute("customer");
Service service=(Service)session.getAttribute("service");
List<Service> printList=(List<Service>)session.getAttribute("printList");

%>
<div>

<p>Car Number:<%=session.getAttribute("regNum") %></p>
<p>Customer Name:<%=customer.getCustName() %></p>
<p>Mobile Number:<%=customer.getMobNum() %></p>
<p>Email Id:<%=customer.getEmailId() %></p>

<table class="table table-striped">
<tr>
<th>Service Name</th>
<th>Service Cost</th>
</tr>

<%

for(Service eachService:printList){

%>
<tr>
<td><%=eachService.getEachServiceName() %></td>
<td><%=eachService.getServiceCost() %></td>
</tr>
<%} %>
</table>

<p>Net Amount is Rs.<%=service.getNetAmount() %></p>
<p>Insurance Amount is Rs.<%=service.getInsuranceAmount() %></p>
<p>Grand Total is Rs.<%=service.getGrandTotal() %></p>
<p>Expected date of Delivery is :<%=session.getAttribute("expectedDateOfDelivery") %></p> 
<p>Thank you! Visit Again!</p>
</div>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>