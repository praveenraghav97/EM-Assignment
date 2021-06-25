package com.extramarks.sms.service.impl;

import java.util.List;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.extramarks.sms.entity.Employee;
import com.extramarks.sms.repository.EmployeeRepository;
import com.extramarks.sms.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	private EmployeeRepository employeeRepository;	
	
	public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
		super();
		this.employeeRepository = employeeRepository;
	}

	@Override
	public List<Employee> getAllEmployees() {		
		return employeeRepository.findAll();
	}

	@Override
	public boolean addEmployee(Employee employee) {
		List<Employee> employees = employeeRepository.findAll();
		for(Employee emp : employees) {
			if(emp.getEmail().equalsIgnoreCase(employee.getEmail())) {
				return false;
			}
		}
		employeeRepository.save(employee);
		return true;
	}

	@Override
	public Employee updateEmployee(Employee employee) {
		return employeeRepository.save(employee);
	}

	@Override
	public Employee getEmployeeById(Long id) {
		return employeeRepository.findById(id).get();
	}

	@Override
	public void deleteEmployee(Long id) {
		employeeRepository.deleteById(id);		
	}	
}
