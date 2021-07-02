<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<div class = "container col-lg-6">
	<div class="card" style="margin-top:40px; margin-bottom:40px; color:teal;">
	<h1 style="margin-bottom: 20px; margin-top: 20px; text-align: center;" class="text-center">Add Employee Details</h1>
	
	<font color="red" style="text-align: center;">${message}</font>
	<div class="card-body">
	<form  method="post" enctype="multipart/form-data">
	  <div class="form-group row">
	    <label for="inputName3" class="col-sm-2 col-form-label">Name</label>
	    <div class="col-sm-10">
	      <input type="text" name="name" class="form-control" id="inputName3" placeholder="Name" required pattern="^[a-zA-Z\s]+$"  title="Enter Valid Name" >
	    </div>
	  </div>
	  <div class="form-group row">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-10">
	      <input type="text" name="email" class="form-control" id="inputEmail3" placeholder="Email" title="Enter Valid Email" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" required>
	    </div>
	  </div>	
	  <div class="form-group row">
	    <label for="mobile" class="col-sm-2 col-form-label">Mobile</label>
	    <div class="col-sm-10">
	      <input type="text" name="mobile" class="form-control" id="mobile" placeholder="Mobile"  pattern="^[0-9]{10}$" minlength="10" maxlength="10" title="Enter Valid Mobile Number" required>
	    </div>
	  </div>
	  
	  <label class="my-1 mr-2" for="state">State</label>
	  <select class="custom-select my-1 mr-sm-2 col-sm-4 col-form-label" id="state" name = "state" style="margin-left:74px"  required>
	    <option selected value="">Choose State</option>
	    <option value="Uttar Pradesh">Uttar Pradesh</option>
	    <option value="Uttrakhand">Uttrakhand</option>
	    <option value="Himachal Pradesh">Himachal Pradesh</option>
	    <option value="Goa">Goa</option>
	    <option value="Bihar">Bihar</option>
	    <option value="Assam">Assam</option>
	  </select>
	    
	  <fieldset class="form-group">
	    <div class="row">
	      <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="Male" required>
	          <label class="form-check-label" for="gridRadios1">
	            Male
	          </label>
	        </div>
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="Female" required>
	          <label class="form-check-label" for="gridRadios2">
	            Female
	          </label>
	        </div>
	      </div>
	    </div>
	  </fieldset>
	  <div class="form-group row">
	    <div class="col-sm-2">Skills</div>
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
	  		<label>Profile:(jpg,jpeg,png) </label>
	  	</div>   
	    <div class="col-10">
	    	<input type="file" name="image" accept="image/png, image/jpeg, image/jpg" required="required" />
        </div>
      </div><br/>
	  <div class="form-group row">
	    <div class="col-sm-10">
	      <button type="submit" class="btn btn-info" style="margin-left:125px">Add Employee</button>
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