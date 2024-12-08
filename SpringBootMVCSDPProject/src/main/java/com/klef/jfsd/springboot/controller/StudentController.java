package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController 
{
  @Autowired
  private StudentService studentService;

  @GetMapping("/s")
  public ModelAndView home()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("home");
    return mv;
  }
   
  @GetMapping("studentreg")
  public ModelAndView studentreg()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentreg");
    return mv;
  }
   
  @PostMapping("insertstudent")
  public ModelAndView insertstudent(HttpServletRequest request)
  {
      String name = request.getParameter("sname");
      String gender = request.getParameter("sgender");
      String dob = request.getParameter("sdob");
      String dept = request.getParameter("sdept");

      // Check for null or empty and handle accordingly
      String cgpaString = request.getParameter("scgpa");
      double cgpa = 0.0;  // Default value
      if (cgpaString != null && !cgpaString.trim().isEmpty()) {
          try {
              cgpa = Double.parseDouble(cgpaString.trim());
          } catch (NumberFormatException e) {
              // Handle invalid cgpa format (e.g., show an error message)
              return new ModelAndView("errorPage").addObject("message", "Invalid CGPA format");
          }
      }

      String location = request.getParameter("slocation");
      String email = request.getParameter("semail");
      String password = request.getParameter("spwd");
      String contact = request.getParameter("scontact");
      String status = "Registered";
      
      Student student = new Student();
      student.setName(name);
      student.setGender(gender);
      student.setDepartment(dept);
      student.setDateofbirth(dob);
      student.setCgpa(cgpa);
      student.setLocation(location);
      student.setEmail(email);
      student.setPassword(password);
      student.setContact(contact);
      student.setStatus(status);
      
      String msg = studentService.studentRegistration(student);
      
      ModelAndView mv = new ModelAndView("regsuccess");
      mv.addObject("message", msg);
      
      return mv;
  }

   
  @GetMapping("studentlogin")
  public ModelAndView studentlogin()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentlogin");
    return mv;
  }
   
  @PostMapping("checkstudentlogin")
  public ModelAndView checkstudentlogin(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
    String semail = request.getParameter("semail");
    String spwd = request.getParameter("spwd");
    
    Student student = studentService.checkStudentLogin(semail, spwd);
    
    if (student != null)
    {
      HttpSession session = request.getSession();
      session.setAttribute("student", student); // student is session variable
      mv.setViewName("studenthome");
    }
    else
    {
      mv.setViewName("studentlogin");
      mv.addObject("message", "Login Failed");
    }
    return mv;
  }
   
  @GetMapping("studenthome")
  public ModelAndView studenthome()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studenthome");
    
    return mv;
  }
   
  @GetMapping("studentprofile")
  public ModelAndView studentprofile()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentprofile");
    
    return mv;
  }
   
  @GetMapping("studentcontactus")
  public ModelAndView studentcontactus()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentcontactus");
    
    return mv;
  }
   
  @GetMapping("studentlogout")
  public ModelAndView studentlogout(HttpServletRequest request)
  {
    HttpSession session = request.getSession();
    session.removeAttribute("student");
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentlogin");
    
    return mv;
  }
   
  @GetMapping("updatestudent")
  public ModelAndView updatestudent()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("updatestudent");
    return mv;
  }
   
  @PostMapping("updatestudentprofile")
  public ModelAndView updatestudentprofile(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
    try
    {
      int id = Integer.parseInt(request.getParameter("sid"));
      String name = request.getParameter("sname");
      String gender = request.getParameter("sgender");
      String dob = request.getParameter("sdob");
      String dept = request.getParameter("sdept");
      double cgpa = Double.parseDouble(request.getParameter("scgpa"));
      String password = request.getParameter("spwd");
      String location = request.getParameter("slocation");
      String contact = request.getParameter("scontact");
      
      Student student = new Student();
      student.setId(id);
      student.setName(name);
      student.setGender(gender);
      student.setDepartment(dept);
      student.setDateofbirth(dob);
      student.setCgpa(cgpa);
      student.setPassword(password);
      student.setLocation(location);
      student.setContact(contact);
      
      String msg = studentService.updateStudentProfile(student);
      
      Student s = studentService.displayStudentByID(id);
      HttpSession session = request.getSession();
      session.setAttribute("student", s); // student is session variable
      
      mv.setViewName("updatesuccess");
      mv.addObject("message", msg);
    }
    catch (Exception e)
    {
      mv.setViewName("updateerror");
      mv.addObject("message", e);
    }
    return mv;
  }
   
  @GetMapping("studentsessionexpiry")
  public ModelAndView studentsessionexpiry(HttpServletRequest request)
  {
    HttpSession session = request.getSession();
    session.removeAttribute("student");
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentsessionexpiry");
    
    return mv;
  }
   
  @GetMapping("viewstudentsbydept")
  public ModelAndView viewstudentsbydept(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView("viewstudentsbydept");
    HttpSession session = request.getSession();
    Student student = (Student) session.getAttribute("student"); // student is session object
    List<Student> studentList = studentService.displayStudentsByDept(student.getDepartment());
    mv.addObject("studentList", studentList);
    
    return mv;
  }
  @Autowired 
  private JavaMailSender mailSender; 
   
  @PostMapping("sendemail") 
  public ModelAndView sendEmail(HttpServletRequest request) throws Exception  
  { 
      String name = request.getParameter("name"); 
      String toemail = request.getParameter("email"); 
      String subject = request.getParameter("subject"); 
      String msg = request.getParameter("message"); 
   
      MimeMessage mimeMessage = mailSender.createMimeMessage(); 
      MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 
       
      int otp = (int)(Math.random() * 99999); // random number generation         
   
      helper.setTo(toemail); 
      helper.setSubject(subject); 
      helper.setFrom("srijayanthguntupalli@gmail.com"); 
   
      String htmlContent =  
                 "<h3>Contact Form Details</h3>" + 
                 "<p><strong>Name:</strong> " + name + "</p>" + 
                 "<p><strong>Email:</strong> " + toemail + "</p>" + 
                 "<p><strong>Subject:</strong> " + subject + "</p>" + 
                 "<p><strong>Message:</strong> " + msg + "</p>" + 
                 "<p><strong>Student OTP:</strong> " + otp + "</p>"; 
   
      helper.setText(htmlContent, true); 
      mailSender.send(mimeMessage); 
        
      ModelAndView mv = new ModelAndView("mailsuccess"); 
      mv.addObject("message", "Email Sent Successfully"); 
   
      return mv; 
  }  

}
