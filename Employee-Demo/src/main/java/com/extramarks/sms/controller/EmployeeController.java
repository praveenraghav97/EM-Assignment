package com.extramarks.sms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
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

	
	@Autowired
	private EmployeeService employeeService;

	

	// Handler method to handle list of Employees and return Model and View
	@RequestMapping(value = "/add-employee", method = RequestMethod.GET)
	public String addEmployeePage(Model model) {
		return "add-employee";
	}


	
	 @RequestMapping(value="/add-employee", method = RequestMethod.POST) 
	 public	String addEmployee(Employee employee,
			 @RequestParam("image") MultipartFile file, ModelMap model) throws IOException {
		 
		 String fileName = employee.getName()+file.getOriginalFilename();
		 
		 String fileExtension = fileName.substring(fileName.length()- 4);
		 if(!(fileExtension.equals("jpeg") || fileExtension.equals(".jpg") || fileExtension.equals(".png"))) {
			 model.addAttribute("message", "File format not supported for 'Profile Picture', please upload jpeg, jpg or png only");
			 return "add-employee";
		 }
		 
		 		 
		 Path fileNameAndPath = Paths.get(uploadDirectory, fileName);	     
		 Files.write(fileNameAndPath, file.getBytes());		 
		 employee.setProfileImage(fileName);
		 employee.setStatus((long) 1);
		 
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
		Employee emp = employeeService.getEmployeeById(id);
		if(emp.getSkills() != null) {
			String skillSet = String.join(" ", emp.getSkills());
			model.addAttribute("skillSet", skillSet);	
		}
		
		//System.out.println(skillSet);
		model.addAttribute("employee", emp);
		
		return "update-form";
	}	
	
	@PostMapping("/employee/{id}")
	public String updateEmployee(@PathVariable("id") Long id,
			@ModelAttribute("employee") Employee employee,
			@RequestParam("image") MultipartFile file,
			Model model ) throws IOException {		
		
		Employee empOld = employeeService.getEmployeeById(id);
		String fileName = file.getOriginalFilename();	
		fileName = employee.getName() + fileName;		
		
		if(empOld.getSkills() != null) {
			String skillSet = String.join(" ", empOld.getSkills());
			model.addAttribute("skillSet", skillSet);	
		}
		if(!fileName.equals(employee.getName())) {			
			if(fileName.length() > 4) {
				String fileExtension = fileName.substring(fileName.length()- 4);
				if(!(fileExtension.equals("jpeg") || fileExtension.equals(".jpg") || fileExtension.equals(".png"))) {
					model.addAttribute("message", "File format not supported for 'Profile Picture', please upload jpeg, jpg or png only");
					model.addAttribute("employee", employeeService.getEmployeeById(id));
					return "update-form";
				}
			}			
			
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
		empOld.setSkills(employee.getSkills());		
		
		employeeService.updateEmployee(empOld);
		
		
		return "redirect:/";
	}
	
	
	@GetMapping("/employees/delete/{id}")
	public String deleteEmployee(@PathVariable("id") Long id) {	
		
		Employee emp = employeeService.getEmployeeById(id);
		
		emp.setStatus((long)5);
		
		employeeService.updateEmployee(emp);		
		
		//employeeService.deleteEmployee(id);
		
		return "redirect:/";
	}
	
	@GetMapping(".*?")
	public String errorHandlerGet() {
		return "error";
	}
	@PostMapping(".*?")
	public String errorHandlerPost() {
		return "error";
	}

}
