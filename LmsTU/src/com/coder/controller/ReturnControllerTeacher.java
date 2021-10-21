package com.coder.controller;
import java.text.ParseException;
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
import com.coder.form.LoginForm;
import com.coder.form.MessageForm;
import com.coder.form.RentReturnStudentForm;
import com.coder.form.RentReturnStudentRegisterForm;
import com.coder.form.RentReturnTeacherRegisterForm;
import com.coder.model.Login;
import com.coder.servic.AdminServic;
import com.coder.servic.LoginServic;
import com.coder.servic.RentReturnStudentServic;
import com.coder.servic.RentReturnTeacherServic;


@Controller
@Transactional
public class ReturnControllerTeacher {
	
	@Autowired
	private LoginServic loginServic;
	@Autowired
	private AdminServic adminServic;
	@Autowired
	private RentReturnTeacherServic rentReturnTeacherServic;
	@RequestMapping("/teacherReturnLoginPath")
	public String loginDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		LoginForm loginForm=new LoginForm();
		modelMap.addAttribute("loginForm",loginForm);
		return "returnLoginTeacher";
	}
	@RequestMapping("/teacherReturnloginSubmitPath")
	public String loginSubmitDispatcher(@ModelAttribute("LoginForm") LoginForm loginForm,ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp)
	{	HttpSession session=req.getSession(true);	
		
	    Login loginObj=this.loginServic.testLogin(loginForm);
	    session.setAttribute("login",loginObj);
		    	 if(loginObj!=null){
		    	 RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm=new RentReturnTeacherRegisterForm();
		    	 rentReturnTeacherRegisterForm.setTeacherId(loginObj.getUserId());
		    	 this.rentReturnTeacherServic.perparReturnBook1(rentReturnTeacherRegisterForm);
		    	 modelMap.addAttribute("rentReturnTeacherRegisterForm", rentReturnTeacherRegisterForm);
	    		 return "selectRentBookTeacher";
	    	      }else{
       	        loginForm=new LoginForm();
       	        loginForm.setMessage("Incorrect User ID And Password!");
       			modelMap.addAttribute("loginForm",loginForm);
       	    	return "returnLoginTeacher";
        	      }
    	     }
	@RequestMapping("/selectRentBookTeacherPath")
	public String selectRentbookDispatcher(ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp)
	{	HttpSession session=req.getSession(true);	
		
	 Login login= (Login) session.getAttribute("login");
		    
	 RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm=new RentReturnTeacherRegisterForm();
	 rentReturnTeacherRegisterForm.setTeacherId(login.getUserId());
		    	 this.rentReturnTeacherServic.perparReturnBook1(rentReturnTeacherRegisterForm);
		    	 modelMap.addAttribute("rentReturnTeacherRegisterForm", rentReturnTeacherRegisterForm);
	    		 return "selectRentBookTeacher";
	    	    
    	     }
	@RequestMapping("/returnBookTeacherSubmitPath")
	public String returnBookSubmitDispatcher(@ModelAttribute("rentReturnTeacherRegisterForm") RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm,ModelMap modelMap,
			       HttpServletRequest req,HttpServletResponse resp) throws ParseException
	{	
		           String teaStuId=req.getParameter("frmTeaRentId");
		           rentReturnTeacherRegisterForm.setTeaRentId(teaStuId);
	     		   MessageForm messageForm= this.rentReturnTeacherServic.preparReturnBook2(rentReturnTeacherRegisterForm);
	     		   modelMap.addAttribute("messageForm", messageForm);
		    	 
	    		 return "returnResultTeacher";
	    	  
    	     }
	
		
      }
	
	

