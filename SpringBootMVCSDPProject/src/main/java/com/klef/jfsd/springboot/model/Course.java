package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="course_table")
public class Course 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="course_id")
    private int id;

    @Column(name="course_name", nullable=false, length = 50)
    private String courseName;

    @Column(name="course_description", nullable=false, length = 255)
    private String description;

    @Column(name="course_duration", nullable=false, length = 20)
    private String duration;

    @Column(name="course_fee", nullable=false)
    private double fee;

    @Column(name="course_instructor", nullable=false, length = 50)
    private String instructor;

    @Column(name="course_category", nullable=false, length = 30)
    private String category;

    @Column(name="course_start_date", nullable=false)
    private String startDate;

    @Column(name="course_end_date", nullable=false)
    private String endDate;

    @Column(name="course_credits", nullable=false)
    private int credits; // New attribute for credits

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getCredits() { // Getter for credits
        return credits;
    }

    public void setCredits(int credits) { // Setter for credits
        this.credits = credits;
    }

    @Override
    public String toString() {
        return "Course [id=" + id + ", courseName=" + courseName + ", description=" + description + 
               ", duration=" + duration + ", fee=" + fee + ", instructor=" + instructor + 
               ", category=" + category + ", startDate=" + startDate + ", endDate=" + endDate +
               ", credits=" + credits + "]"; // Added credits to toString
    }
}
