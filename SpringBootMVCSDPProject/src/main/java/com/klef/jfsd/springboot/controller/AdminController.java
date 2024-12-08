package com.klef.jfsd.springboot.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Employee;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController 
{
  @Autowired // Communication b/w 2 beans
     private AdminService adminService;
  
  @GetMapping("adminhome")
  public ModelAndView adminhome()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("adminhome");
    
    long count=  adminService.empcount();
    mv.addObject("empcount", count);
    
    return mv;
  }
  
  @GetMapping("adminlogin")
  public ModelAndView adminlogin()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("adminlogin");
    
    return mv;
  }
  
  @PostMapping("checkadminlogin")
  //@ResponseBody
  public ModelAndView checkadminlogin(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
    
       String auname = request.getParameter("auname");
       String apwd = request.getParameter("apwd");
       
       long count=  adminService.empcount();
       mv.addObject("empcount", count);
       
      Admin admin =  adminService.checkadminlogin(auname, apwd);
      
      if(admin!=null)
      {
        //return "Admin Login Success";
        mv.setViewName("adminhome");
        
      }
      else
      {
        //return "Admin Login Fail";
        mv.setViewName("adminloginfail");
        mv.addObject("message","Login Failed");
      }
      return mv;
  }
  
  @GetMapping("viewallemps")
    public ModelAndView viewallemps()
    {
      ModelAndView mv = new ModelAndView();
      List<Employee> emplist = adminService.viewAllEmployees();
      mv.setViewName("viewallemps");
      mv.addObject("emplist",emplist);
      
      long count=  adminService.empcount();
      mv.addObject("empcount", count);
      
      return mv;
    }
  
  @GetMapping("deleteemp")
  public ModelAndView deleteemp()
  {
    ModelAndView mv = new ModelAndView();
    List<Employee> emplist = adminService.viewAllEmployees();
    mv.setViewName("deleteemp");
    mv.addObject("emplist",emplist);
    return mv;
  }
  
  @GetMapping("updateempstatus")
  public ModelAndView updateempstatus()
  {
    ModelAndView mv = new ModelAndView();
    List<Employee> emplist = adminService.viewAllEmployees();
    mv.setViewName("updateempstatus");
    mv.addObject("emplist",emplist);
    return mv;
  }
  
  @GetMapping("updatestatus")
  public String updatestatus(@RequestParam("id") int eid,@RequestParam("status") String status)
  {
	  adminService.updateemployeestatus(status, eid);
	  return "redirect:/updateempstatus";
  }
  
  @GetMapping("delete")
  public String deleteoperation(@RequestParam("id") int eid)
  {
    adminService.deleteemp(eid);
    
    return "redirect:/deleteemp"; // redirection to specific 
  }
  
  @GetMapping("adminlogout")
  public ModelAndView adminlogout()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("adminlogin");
    
    return mv;
  }
  
  @GetMapping("addcourse")
  public String addcourse(Model m)
  {
	  m.addAttribute("course",new Course());
	  return "addcourse";  //addcustomer.jsp
  }
  
   @PostMapping("insertcourse")
   public ModelAndView insertcourse(@ModelAttribute("course") Course c)
   {
	   ModelAndView mv = new ModelAndView();
	   
	   mv.setViewName("coursesuccess");
	   
	   String msg = adminService.addcourse(c);
	   mv.addObject("message",msg);
	   
	   return mv;
   }
   
  
  
}