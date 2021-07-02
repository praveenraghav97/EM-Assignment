package com.extramarks.sms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.extramarks.sms.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long>{

	List<Employee> findByStatus(Long status);
	
}
