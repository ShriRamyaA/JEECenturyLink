<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">
<style>body{padding-left: 1em;}</style>
<title>Choose</title>
</head>
<body>
<div><jsp:include page="header.html"></jsp:include></div>
<form action="form1.jsp" >
<input type="submit" value="Go Home" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<form action="availService.jsp" >
<input type="submit" value="Avail Service" class="btn btn-info"/>
</form>
<p></p>
<p></p>
<form action="updateDetails.jsp" >
<input type="submit" value="Update Details" class="btn btn-info"/>
</form>
<p></p>
<p></p>



<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>