package com.extramarks.sms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.extramarks.sms.entity.Employee;
import com.extramarks.sms.service.EmployeeService;


@Controller
public class EmployeeController {
	
	public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/imagedata";

	private EmployeeService employeeService;

	public EmployeeController(EmployeeService employeeService) {
		super();
		this.employeeService = employeeService;
	}

	// Handler method to handle list of Employees and return Model and View
	@RequestMapping(value = "/add-employee", method = RequestMethod.GET)
	public String addEmployeePage(Model model) {
		return "add-employee";
	}


	
	 @RequestMapping(value="/add-employee", method = RequestMethod.POST) 
	 public	String addEmployee(Employee employee,
			 @RequestParam("image") MultipartFile file, ModelMap model) throws IOException {
		 
		 String fileName = employee.getName()+file.getOriginalFilename(); 		 
		 Path fileNameAndPath = Paths.get(uploadDirectory, fileName);	     
		 Files.write(fileNameAndPath, file.getBytes());		 
		 employee.setProfileImage(fileName);
		 
		 if(employeeService.addEmployee(employee))
		 { 
			 return "redirect:/";
		 }
		 
		 //If email already exists
		 model.put("message", "Email id already exists...");
		 return "add-employee";	 
	 }

	@GetMapping("/")
	public String listEmployees(Model model) {
		model.addAttribute("empls", employeeService.getAllEmployees());
		return "employees";
	}
	
	@GetMapping("/employees/update/{id}")
	public String updateEmployeeForm(@PathVariable("id") Long id,
			Model model) {
		
		model.addAttribute("employee", employeeService.getEmployeeById(id));
		return "update-form";
	}	
	
	@PostMapping("/employee/{id}")
	public String updateEmployee(@PathVariable("id") Long id,
			@ModelAttribute("employee") Employee employee,
			@RequestParam("image") MultipartFile file,
			Model model ) throws IOException {
		
		//Get Employee from database by Id
		Employee empOld = employeeService.getEmployeeById(id);
		String fileName = employee.getName() + file.getOriginalFilename();		
		
		if(!fileName.equals(employee.getName())) {
			Path fileNameAndPath = Paths.get(uploadDirectory, fileName);	     
			Files.write(fileNameAndPath, file.getBytes());		 
			empOld.setProfileImage(fileName);
		}		
		
		empOld.setId(id);
		empOld.setEmail(employee.getEmail());
		empOld.setName(employee.getName());
		empOld.setMobile(employee.getMobile());
		empOld.setGender(employee.getGender());
		empOld.setState(employee.getState());
		
		if(employee.getSkills() != null) {
			empOld.setSkills(employee.getSkills());
		}
		
		employeeService.updateEmployee(empOld);
		
		model.addAttribute("message", "Record Updated Successfully");
		return "redirect:/";
	}
	
	
	@GetMapping("/employees/delete/{id}")
	public String deleteEmployee(@PathVariable("id") Long id, ModelMap model) {
		
		employeeService.deleteEmployee(id);
		model.put("message", "Deleted Successfully");
		return "redirect:/";
	}
	
	@GetMapping(".*?")
	public String errorHandler() {
		return "error";
	}

}
