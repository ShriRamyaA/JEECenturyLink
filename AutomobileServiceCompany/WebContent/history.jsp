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
<title>History</title>
</head>
<body>
<div><jsp:include page="header.html"></jsp:include></div>
<form action="form1.jsp" >
<input type="submit" value="Go Home" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<table class="table table-striped">
<tr>
<th>Car Registration Number</th>
<th>Date Of Service</th>
<th>Service Name</th>
<th>Service Cost</th>



</tr>



<%Service service=(Service)session.getAttribute("service");
List<Service> historyList=(List<Service>)session.getAttribute("historyList");
for(Service eachService:historyList){

%>
<tr>
<td><%=eachService.getCarNumberPlateNum()%></td>
<td><%=eachService.getDateOfService() %></td>
<td><%=eachService.getEachServiceName()%></td>
<td><%=eachService.getServiceCost()%></td>



</tr>
<%} %>
</table>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>