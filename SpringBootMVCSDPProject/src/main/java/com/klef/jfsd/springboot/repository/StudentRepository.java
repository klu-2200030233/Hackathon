package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
   @Query("select s from Student s where s.email=?1 and s.password=?2")
   public Student checkStudentLogin(String email, String pwd);
   
   @Query("update Student s set s.status=?1 where s.id=?2")
   @Modifying  // DML
   @Transactional  // to enable auto-commit
   public int updateStudentStatus(String status, int sid);
   
   // Reference
   // No need to write queries explicitly
   public List<Student> findByDepartment(String department);
   public List<Student> findByGenderAndDepartment(String gender, String department);
   public List<Student> findByGender(String gender);
}
