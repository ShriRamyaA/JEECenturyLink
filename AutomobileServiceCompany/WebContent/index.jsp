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
<title>Login</title>
</head>
<body>
<div><jsp:include page="header.html"></jsp:include></div>



<c:set var="checkRequest" value="Login" scope="session"/>
<form action="ValidateLoginServlet" method="post">

<div class="form-group" >
<label for="empUserName">Username</label>
<input type="text" name="empUserName" placeholder="Please enter your user name" required class="form-control"/>
</div>

<div class="form-group">
<label for="empPassword">Password</label>
<input type="password" name="empPassword" placeholder="Please enter your password" required class="form-control"/>
</div>

<c:set var = "msg" value='${requestScope["msg"]}'/>
      <c:if test = "${msg !=null}">
         <p style="color:#B50808"><c:out value = "${msg}"/><p>
      </c:if>
      
<input type="submit" value="Login" class="btn btn-success"/>
</form>

<a href="register.jsp">Click here for new Registration</a>
<div><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>