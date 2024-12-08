package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Employee;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.EmployeeRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	
  @Autowired
  private EmployeeRepository employeeRepository;
  
  @Autowired
  private AdminRepository adminRepository;
  
  @Autowired
  private CourseRepository courseRepository;

  @Override
  public List<Employee> viewAllEmployees()
  {
    return employeeRepository.findAll();
  }

  @Override
  public Admin checkadminlogin(String uname, String pwd)
  {
    return adminRepository.checkadminlogin(uname, pwd);
    
    
  }

 @Override
public Employee displayemployeebyID(int eid)
 {
	return employeeRepository.findById(eid).get();
}

@Override
public long empcount() 
{
	return employeeRepository.count();
}

@Override
public String deleteemp(int eid)
{
	
	 employeeRepository.deleteById(eid);
	 return "Employee Deleted Successfully";
}

@Override
public String updateemployeestatus(String status, int eid)
{
	
 employeeRepository.updateEmployeeStatus(status, eid);
 return "Employee updated successfully";
	
}

@Override
public String addcourse(Course c)
{
	courseRepository.save(c);
	return "Customer Added Successfully";
}

}