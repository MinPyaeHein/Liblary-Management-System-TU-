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

import com.coder.model.Login;
import com.coder.servic.RentReturnStudentServic;


@Controller
@Transactional
public class RentBookStudentController {
	@Autowired
	private RentReturnStudentServic rentReturnStudentServic;
	@RequestMapping("/rentBookPath")
	public String rentBookDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		LoginForm loginForm=new LoginForm();
		modelMap.addAttribute("loginForm",loginForm);
		//System.out.println("loginForm="+loginForm.getMessage());
		return "rentLogin";
	}
	@RequestMapping("/rentBookSubmitPath")
	public String rentBookSubmitDispatcher(@ModelAttribute("rentReturnStudentRegisterForm")RentReturnStudentRegisterForm rentReturnStudentRegisterForm,ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		HttpSession session=req.getSession(true);	
		Login login=(Login) session.getAttribute("login");
		
		 
		RentReturnStudentForm rentReturnStudentForm=rentReturnStudentRegisterForm.getRentReturnStudentForm();
		rentReturnStudentForm.setAdminId(login.getUserId());
		rentReturnStudentServic.prepareRentReturnStudentRegister(rentReturnStudentRegisterForm);
	    String result=rentReturnStudentRegisterForm.getMessage();
		
		String userId=(String) session.getAttribute("userId");
		rentReturnStudentForm.setUserId(userId);
		rentReturnStudentRegisterForm.setRentReturnStudentForm(rentReturnStudentForm);
		if(result==null){
		rentReturnStudentRegisterForm.setMessage("Succeed Rent Process!");
		}else{
			rentReturnStudentRegisterForm.setMessage(result);	
		}
		modelMap.addAttribute("rentReturnStudentRegisterForm",rentReturnStudentRegisterForm);
	    return "rentBook";
		
	}
	@RequestMapping("/showAllReturnPath")
	public String showAllReturnDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{RentReturnStudentRegisterForm returnStudentRegisterForm=new RentReturnStudentRegisterForm();
		this.rentReturnStudentServic.showAllReturnList(returnStudentRegisterForm);
		modelMap.addAttribute("returnStudentRegisterForm", returnStudentRegisterForm);
		return "showAllReturnStudent";
	}
	@RequestMapping("/showAllRentPath")
	public String showAllRentDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{RentReturnStudentRegisterForm returnStudentRegisterForm=new RentReturnStudentRegisterForm();
		this.rentReturnStudentServic.showAllRentList(returnStudentRegisterForm);
		modelMap.addAttribute("returnStudentRegisterForm", returnStudentRegisterForm);
		return "showAllRentStudent";
	}
	
	
}
