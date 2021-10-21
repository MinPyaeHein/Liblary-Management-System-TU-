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

import com.coder.form.AdminRegisterform;
import com.coder.form.AuthorForm;
import com.coder.form.AuthorRegisterForm;
import com.coder.form.BookRegisterForm;
import com.coder.form.StudentRegisterForm;
import com.coder.form.TeacherRegisterForm;
import com.coder.form.TypeRegisterForm;
import com.coder.servic.BookRegisterServic;
import com.coder.servic.StudentRegisterServic;
import com.coder.servic.TeacherServic;
import com.coder.servic.AdminServic;
import com.coder.servic.AuthorRegisterService;
@Controller
@Transactional
public class AdminController {
	@Autowired
	private AdminServic adminServic;
	@RequestMapping("/adminRegisterPath")
	public String studentRegisterDispatcher(@ModelAttribute("adminRegisterForm")AdminRegisterform adminRegisterForm,ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{   
		adminRegisterForm=new AdminRegisterform();
		modelMap.addAttribute("adminRegisterForm",adminRegisterForm);
		adminServic.prepareAdminRegister(adminRegisterForm);
		return "adminRegister";
	}
	@RequestMapping("/adminRegisterSubmitPath")
	public String studentRegisterSubmitDispatcher(@ModelAttribute("adminRegisterForm")AdminRegisterform adminRegisterForm,ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{   
		this.adminServic.prepareAdminRegister(adminRegisterForm);
		modelMap.addAttribute("adminRegisterForm",adminRegisterForm);
		return "adminRegister";
	}
	
}
