<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee Data</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<div class = "container col-lg-6">
	<div class="card" style="margin-top:40px; color:teal;">
	<h1 style="margin-bottom: 20px; margin-top: 20px; text-align: center; color:teal" class="text-center">Update Details</h1>
	
	<font color="red" style="text-align: center;">${message}</font>
	<div class="card-body">
	<form  method="post" action="/employee/${employee.id}" enctype="multipart/form-data">
	  <div class="form-group row">
	    <label for="inputName3" class="col-sm-2 col-form-label">Name</label>
	    <div class="col-sm-10">
	      <input type="text" name="name" class="form-control" id="inputName3" placeholder="Name" required pattern="^[a-zA-Z\s]+$" minlength="3" title="Enter Valid Name" value="${employee.name}" >
	    </div>
	  </div>
	  <div class="form-group row">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-10">
	      <input type="text" name="email" class="form-control" id="inputEmail3" placeholder="Email" required="required" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" value="${employee.email}" readonly>
	    </div>
	  </div>	
	  <div class="form-group row">
	    <label for="mobile" class="col-sm-2 col-form-label">Mobile</label>
	    <div class="col-sm-10">
	      <input type="text" name="mobile" class="form-control" id="mobile" placeholder="Mobile" pattern="^[0-9]{10}$" minlength ="10" maxlength="10" title="Enter Valid Mobile Number" required value="${employee.mobile}">
	    </div>
	  </div>
	  
	  <label class="my-1 mr-2" for="state">State</label>
	  <select class="custom-select my-1 mr-sm-2 col-sm-4 col-form-label" id="state" name = "state" style="margin-left:74px" >
	    <option selected>${employee.state}</option>
	    <option value="Uttar Pradesh">Uttar Pradesh</option>
	    <option value="Uttrakhand">Uttrakhand</option>
	    <option value="Himachal Pradesh">Himachal Pradesh</option>
	    <option value="Goa">Goa</option>
	    <option value="Bihar">Bihar</option>
	    <option value="Assam">Assam</option>
	  </select>
	  
	  <div class = "row">
	     <div class="col-2">
	         Gender
	     </div>
	     <div class="col-10">
		  <c:if test="${employee.gender == 'Male'}">	    
		      <input type="radio" id="male" name="gender" value="Male" checked="checked" required>
			  <label for="male">Male</label>
			  <input type="radio" id="female" name="gender" value="Female" required>
			  <label for="female">Female</label>
		  </c:if>
		  <c:if test="${employee.gender != 'Male'}">
		      <input type="radio" id="male" name="gender" value="Male" required>
			  <label for="male">Male</label>
			  <input type="radio" id="female" name="gender" value="Female" checked="checked" required>
			  <label for="female">Female</label>
		  </c:if>
		 </div>
	  </div>
	  <br/>
	  <div class = "row">
	  	<div class="col-2">
	  		Your Skills:
	  	</div>
	  	<div style="margin-left: 17px">
	  		<c:forEach items="${employee.skills }" var="skill">${skill } &nbsp;&nbsp;</c:forEach>
	  	</div>
	  	
	  </div><br/>
	  <div class="form-group row">
	    <div class="col-sm-2">Update Your Skills</div>
	    <div class="col-sm-10">
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="gridCheck1" name="skills" value="Java">
	        <label class="form-check-label" for="gridCheck1">
	          Java
	        </label>
	      </div>
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="gridCheck2" name="skills" value="Python3">
	        <label class="form-check-label" for="gridCheck2">
	          Python3
	        </label>
	      </div>
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="gridCheck3" name="skills" value="Springboot">
	        <label class="form-check-label" for="gridCheck3">
	          SpringBoot
	        </label>
	      </div>
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="gridCheck4" name="skills" value="MySql">
	        <label class="form-check-label" for="gridCheck4">
	          MySql
	        </label>
	      </div>
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="gridCheck5" name="skills" value="Javascript">
	        <label class="form-check-label" for="gridCheck5">
	          JavaScript
	        </label>
	      </div>
	    </div>
	  </div>
	  
	  <div class="row">
	  	<div class="col-2">
	  		<label>Update Profile:(jpg,jpeg,png) </label>
	  	</div>   
	    <div class="col-10">
	    	<input type="file" name="image" accept="image/png, image/jpeg, image/jpg" value="${employee.profileImage }"/><img src="/imagedata/${employee.profileImage }" height="70px" width="70px"/>
        </div>
      </div><br/>
	  
	  <div class="form-group row">
	    <div class="col-sm-10">
	      <button type="submit" class="btn btn-info" style="margin-left:125px">Update Profile</button>
	    </div>
	  </div>
	</form>
	<div class= "row" style="margin-left: 110px;">
		<div class = "col-lg-3">
			<a href="/" class="btn btn-info">Employees List</a>
		</div>
	</div>
	</div>
	</div>
</div>

</body>
</html>