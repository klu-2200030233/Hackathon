package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service; 

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;

	@Override
	public String studentRegistration(Student student)
	{
		studentRepository.save(student);
		return "Student Registered Successfully";
	}

	@Override
	public Student checkStudentLogin(String email, String pwd) 
	{
	    return studentRepository.checkStudentLogin(email, pwd);	 
	}

	@Override
	public String updateStudentProfile(Student student) {
		
		Student s = studentRepository.findById(student.getId()).get();
	    
	    s.setContact(student.getContact());
	    s.setDateofbirth(student.getDateofbirth());
	    s.setDepartment(student.getDepartment());
	    s.setGender(student.getGender());
	    s.setLocation(student.getLocation());
	    s.setName(student.getName());
	    s.setPassword(student.getPassword());
	    
	    
	    studentRepository.save(s);
	    
	    return "Student Updated Successfully";
	}

	@Override
	public Student displayStudentByID(int sid) {
		return studentRepository.findById(sid).get();
	}

	@Override
	public List<Student> displayStudentsByDept(String department)
	{
		return studentRepository.findByDepartment(department);
	}
}
