package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Student;

public interface StudentService
{
  public String studentRegistration(Student student);
  public Student checkStudentLogin(String email, String pwd);
  public String updateStudentProfile(Student student);
  public Student displayStudentByID(int id);
  public List<Student> displayStudentsByDept(String department);
}
