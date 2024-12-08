package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>
{
    // You can add custom query methods here if needed, for example:
    // List<Course> findByCategory(String category);
}
