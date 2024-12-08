package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service; 

import com.klef.jfsd.springboot.model.Employee;
import com.klef.jfsd.springboot.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService
{
	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public String EmployeeRegistration(Employee emp)
	{
		employeeRepository.save(emp);
		return "Employee Registered Successfully";
	}

	@Override
	public Employee checkemplogin(String email, String pwd) 
	{
	    return employeeRepository.checkemplogin(email, pwd);	 
	}

	@Override
	public String updateEmployeeProfile(Employee employee) {
		
		Employee e = employeeRepository.findById(employee.getId()).get();
	    
	    e.setContact(employee.getContact());
	    e.setDateofbirth(employee.getDateofbirth());
	    e.setDepartment(employee.getDepartment());
	    e.setGender(employee.getGender());
	    e.setLocation(employee.getLocation());
	    e.setName(employee.getName());
	    e.setPassword(employee.getPassword());
	    e.setSalary(employee.getSalary());
	    
	    employeeRepository.save(e);
	    
	    return "Employee Updated Successfully";
	}

	@Override
	public Employee displayEmployeebyID(int eid) {
		// TODO Auto-generated method stub
		return employeeRepository.findById(eid).get();
	}

	@Override
	public List<Employee> displayEmployeeByDept(String department)
	{
		return employeeRepository.findByDepartment(department);
	}
	
	@Override
	public String deleteEmployee(int id) {
	    Employee emp = employeeRepository.findById(id).orElse(null);
	    if (emp != null) {
	        employeeRepository.delete(emp);
	        return "Employee deleted successfully.";
	    } else {
	        return "Employee not found.";
	    }
	}




}