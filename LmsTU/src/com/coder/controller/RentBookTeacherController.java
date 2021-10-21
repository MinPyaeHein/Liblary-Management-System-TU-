package com.coder.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.coder.form.LoginForm;
import com.coder.form.RentReturnStudentForm;
import com.coder.form.RentReturnStudentRegisterForm;
import com.coder.form.RentReturnTeacherForm;
import com.coder.form.RentReturnTeacherRegisterForm;
import com.coder.model.Login;
import com.coder.servic.LoginServic;
import com.coder.servic.RentReturnStudentServic;
import com.coder.servic.RentReturnTeacherServic;


@Controller
@Transactional
public class RentBookTeacherController {
	@Autowired
	private LoginServic loginServic;
	@Autowired
	private RentReturnTeacherServic rentReturnTeacherServic;
	@RequestMapping("/teacherRentLoginPath")
	public String rentBookDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		LoginForm loginForm=new LoginForm();
		modelMap.addAttribute("loginForm",loginForm);
		//System.out.println("loginForm="+loginForm.getMessage());
		return "rentLoginTeacher";
	}
	@RequestMapping("/teacherRentloginSubmitPath")
	public String loginSubmitDispatcher(@ModelAttribute("LoginForm") LoginForm loginForm,ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp)
	{	HttpSession session=req.getSession(true);	

	Login loginObj=this.loginServic.testLogin(loginForm);
 	 if(loginObj!=null){
 		 
 		 session.setAttribute("userId",loginObj.getUserId());
 		 RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm=new RentReturnTeacherRegisterForm();
 		 rentReturnTeacherServic.prepareRentReturnTeacherRegister(rentReturnTeacherRegisterForm);
 		 RentReturnTeacherForm rentReturnTeacherForm= rentReturnTeacherRegisterForm.getRentReturnTeacherForm();
 		rentReturnTeacherForm.setUserId(loginObj.getUserId());
 		 rentReturnTeacherRegisterForm.setRentReturnTeacherForm(rentReturnTeacherForm);
 		 modelMap.addAttribute("rentReturnTeacherRegisterForm",rentReturnTeacherRegisterForm);
 		 return "rentBookTeacher";
 	      }else{
	        loginForm=new LoginForm();
	        loginForm.setMessage("Incorrect User ID And Password!");
			modelMap.addAttribute("loginForm",loginForm);
	    	return "rentLoginTeacher";
 	      }
    	     }
	@RequestMapping("/rentBookTeacherSubmitPath")
	public String rentBookSubmitDispatcher(@ModelAttribute("rentReturnTeacherRegisterForm")RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm,ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		HttpSession session=req.getSession(true);	
		Login login=(Login) session.getAttribute("login");
		
		 
		RentReturnTeacherForm rentReturnTeacherForm=rentReturnTeacherRegisterForm.getRentReturnTeacherForm();
		rentReturnTeacherForm.setAdminId(login.getUserId());
		rentReturnTeacherServic.prepareRentReturnTeacherRegister(rentReturnTeacherRegisterForm);
	    String result=rentReturnTeacherRegisterForm.getMessage();
		
		String userId=(String) session.getAttribute("userId");
		rentReturnTeacherForm.setUserId(userId);
		rentReturnTeacherRegisterForm.setRentReturnTeacherForm(rentReturnTeacherForm);
		if(result==null){
			rentReturnTeacherRegisterForm.setMessage("");
		}else{
			rentReturnTeacherRegisterForm.setMessage(result);	
		}
		modelMap.addAttribute("rentReturnTeacherRegisterForm",rentReturnTeacherRegisterForm);
	    return "rentBookTeacher";
		
	}
	@RequestMapping("/showAllRentReturnTeacherPath")
	public String showAllRentReturnDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm=new RentReturnTeacherRegisterForm();
		this.rentReturnTeacherServic.showAllRentReturnList(rentReturnTeacherRegisterForm);
		modelMap.addAttribute("rentReturnTeacherRegisterForm", rentReturnTeacherRegisterForm);
		return "showAllRentReturnTeacher";
	}
	
	
}
