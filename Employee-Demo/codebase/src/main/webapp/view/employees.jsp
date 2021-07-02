<%@page import="com.extramarks.sms.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
	<body>
		<div class="container">
		<h1 style="text-align: center; margin: 15px; color: teal;" >Employee List</h1>
		<font color="green">${message }</font>
		<div class= "row" style="margin-bottom: 10px">
			<div class = "col-lg-3">
				<a href="/add-employee" class="btn btn-info">Add Employee</a>
			</div>
		</div>
		<table class="table table-striped">
		  <thead class="table-success">
		    <tr>
		      <th>Name</th>
		      <th>Email</th>
		      <th>Mobile</th>
		      <th>State</th>
		      <th>Gender</th>
		      <th>Skills</th>
		      <th>Image</th>
		      <th style="text-align: right;">Update/Delete</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${empls}" var="emp">		  
		  	<tr>	      
		      <td>${emp.name}</td>
		      <td>${emp.email}</td>
		      <td>${emp.mobile}</td>
		      <td>${emp.state}</td>
		      <td>${emp.gender}</td>
		      <td>
		      	<c:forEach items ="${emp.skills}" var="skill">
		      		${skill} <br/>
		      	</c:forEach>		      
		      </td>
		      <td><img src="/imagedata/${emp.profileImage }" alt="Pic" width="80" height="80"></td>
		      <td style="text-align: right; margin: auto;">
		      	<a class="btn btn-secondary" href="/employees/update/${emp.id}">Update Profile</a>
		      	<a class="btn btn-danger" href="/employees/delete/${emp.id}">Delete</a>
		      </td>
		    </tr>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
</body>
</html>