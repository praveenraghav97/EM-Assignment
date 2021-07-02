package com.extramarks.sms.service;

import java.util.List;

import com.extramarks.sms.entity.Employee;

public interface EmployeeService {
	public List<Employee> getAllEmployees();
	
	public boolean addEmployee(Employee employee);
	
	public Employee updateEmployee(Employee employee);
	
	public Employee getEmployeeById(Long id);

	public void deleteEmployee(Long id);
}
