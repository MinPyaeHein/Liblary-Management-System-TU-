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

import com.coder.form.AuthorForm;
import com.coder.form.AuthorRegisterForm;
import com.coder.form.BookRegisterForm;
import com.coder.form.StudentRegisterForm;
import com.coder.form.TeacherRegisterForm;
import com.coder.form.TypeRegisterForm;
import com.coder.model.Login;
import com.coder.servic.BookRegisterServic;
import com.coder.servic.StudentRegisterServic;
import com.coder.servic.TeacherServic;
import com.coder.servic.AuthorRegisterService;
@Controller
@Transactional
public class TeacherController {
	@Autowired
	private TeacherServic teacherServic;
	@RequestMapping("/teacherRegisterPath")
	public String studentRegisterDispatcher(@ModelAttribute("teacherRegisterForm")TeacherRegisterForm teacherRegisterForm,ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{   
		teacherRegisterForm=new TeacherRegisterForm();
		modelMap.addAttribute("teacherRegisterForm",teacherRegisterForm);
		teacherServic.prepareTeacherRegister(teacherRegisterForm);
		return "teacherRegister";
	}
	@RequestMapping("/teacherRegisterSubmitPath")
	public String studentRegisterSubmitDispatcher(@ModelAttribute("teacherRegisterForm")TeacherRegisterForm teacherRegisterForm,ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{   
		this.teacherServic.prepareTeacherRegister(teacherRegisterForm);
		modelMap.addAttribute("teacherRegisterForm",teacherRegisterForm);
		return "teacherRegister";
	}
	@RequestMapping("/showAllTeacherPath")
	public String showAllTeacherDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{   TeacherRegisterForm teacherRegisterForm=new TeacherRegisterForm();
		this.teacherServic.showAllTeacher(teacherRegisterForm);
		modelMap.addAttribute("teacherRegisterForm",teacherRegisterForm);
		return "showAllTeacher";
	}
	
	@RequestMapping("/showDetailTeacherPath")
	public String showTeacherDetailDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{  String exit= req.getParameter("exit");
	if(exit==null){
	HttpSession session=req.getSession(true);	
	Login login=(Login) session.getAttribute("login");
	TeacherRegisterForm teacherRegisterForm=new TeacherRegisterForm();
	teacherRegisterForm.setTeacherId(login.getUserId());
	this.teacherServic.showTeacherDetail(teacherRegisterForm);
	modelMap.addAttribute("teacher", teacherRegisterForm.getTeacher());
		return "showDetailTeacher";
	}else{
		return "userHome";
	}
	}
	@RequestMapping("/showRentTeacherPath")
	public String showRentStudentDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{  String exit= req.getParameter("exit");
	if(exit==null){
	HttpSession session=req.getSession(true);	
	Login login=(Login) session.getAttribute("login");
	TeacherRegisterForm teacherRegisterForm=new TeacherRegisterForm();
	teacherRegisterForm.setTeacherId(login.getUserId());
	this.teacherServic.showRentTeacher(teacherRegisterForm);
	modelMap.addAttribute("teacherRegisterForm", teacherRegisterForm);
		return "showRentTeacher";
	}else{
		return "userHome";
	}
	}
	@RequestMapping("/showReturnTeacherPath")
	public String showReturnStudentDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{  String exit= req.getParameter("exit");
	if(exit==null){
	HttpSession session=req.getSession(true);	
	Login login=(Login) session.getAttribute("login");
	TeacherRegisterForm teacherRegisterForm=new TeacherRegisterForm();
	teacherRegisterForm.setTeacherId(login.getUserId());
	this.teacherServic.showRentTeacher(teacherRegisterForm);
	modelMap.addAttribute("teacherRegisterForm", teacherRegisterForm);
		return "showReturnTeacher";
	}else{
		return "userHome";
	}
	}
	
}
