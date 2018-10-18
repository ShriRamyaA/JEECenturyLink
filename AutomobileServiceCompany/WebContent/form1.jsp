<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">
<style>
h2{
text-align: center;
color: #073278  ;
}
body{padding-left: 1em;}
</style>
<title>Home</title>
</head>
<body>
<div><jsp:include page="header.html"></jsp:include></div>
<h2>Home Page</h2>
<p><b>Click this button to see service history</b></p>
<form action="HistoryServlet" method="post">
<input type="submit" value="Show History" id="generate" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<div class="form-group">
<form action="ValidateLoginServlet" method="get">
<label for="carNumberPlateNum">Enter the car Number</label>
<input type="text" required name="carNumberPlateNum" placeholder="eg. KA191703" class="form-control"/>
<p></p>
<input type="submit" value="Check" class="btn btn-success"/>
</form>


</div>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>