package com.extramarks.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.extramarks.sms.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	
}
