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
import com.coder.form.LoginForm;
import com.coder.form.RentReturnStudentForm;
import com.coder.form.RentReturnStudentRegisterForm;
import com.coder.model.Login;
import com.coder.servic.AdminServic;
import com.coder.servic.LoginServic;
import com.coder.servic.RentReturnStudentServic;


@Controller
@Transactional
public class LoginController {
	
	@Autowired
	private LoginServic loginServic;
	@Autowired
	private AdminServic adminServic;
	@Autowired
	private RentReturnStudentServic rentReturnStudentServic;
	@RequestMapping("/")
	public String loginDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		LoginForm loginForm=new LoginForm();
		modelMap.addAttribute("loginForm",loginForm);
		return "login";
	}
	@RequestMapping("/loginSubmitPath")
	public String loginSubmitDispatcher(@ModelAttribute("LoginForm") LoginForm loginForm,ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp)
	{	HttpSession session=req.getSession(true);	
		String newacount=req.getParameter("newaccount");
		String login=req.getParameter("login");
		String rentlogin=req.getParameter("rentlogin");
		if(login!=null){
	    Login loginObj=this.loginServic.testLogin(loginForm);
		if(loginObj!=null){
		String id=loginObj.getUserId();
			if(id.startsWith("SID")){
			session.setAttribute("login",loginObj);
			session.setAttribute("idType","sid");
			return "userHome";
		}else if(id.startsWith("TID")){
			session.setAttribute("login",loginObj);
			session.setAttribute("idType","tid");
			return "userHome";
		}else if(id.startsWith("ID")){
			session.setAttribute("login",loginObj);
			session.setAttribute("idType","id");
			return "adminHome";
		}
		}else{
			req.setAttribute("error","Incorrect User Name And Password!");
		}
	    }else if(rentlogin!=null){
	    	   System.out.println("Arriving rentlogin");
	    	 Login loginObj=this.loginServic.testLogin(loginForm);
	    	 if(loginObj!=null){
	    		 
	    		 session.setAttribute("userId",loginObj.getUserId());
	    		 RentReturnStudentRegisterForm rentReturnStudentRegisterForm=new RentReturnStudentRegisterForm();
	    		 rentReturnStudentServic.prepareRentReturnStudentRegister(rentReturnStudentRegisterForm);
	    		 RentReturnStudentForm rentReturnStudentForm= rentReturnStudentRegisterForm.getRentReturnStudentForm();
	    		 rentReturnStudentForm.setUserId(loginObj.getUserId());
	    		 rentReturnStudentRegisterForm.setRentReturnStudentForm(rentReturnStudentForm);
	    		 modelMap.addAttribute("rentReturnStudentRegisterForm",rentReturnStudentRegisterForm);
	    		 return "rentBook";
	    	      }else{
       	        loginForm=new LoginForm();
       	        loginForm.setMessage("Incorrect User ID And Password!");
       			modelMap.addAttribute("loginForm",loginForm);
       	    	return "rentLogin";
        	      }
    	     }else if(newacount!=null){
	    	 System.out.println("Arriving newacount");
	    	 AdminRegisterform adminRegisterform=new AdminRegisterform();
	 	     this.adminServic.prepareAdminRegister(adminRegisterform);
	 		 modelMap.addAttribute("adminRegisterForm",adminRegisterform);
		 	 return "adminRegister";
    	     }
		modelMap.addAttribute("loginForm",loginForm);
		return "login";
		
      }
	@RequestMapping("/logoutPath")
	public String logoutDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{HttpSession session=req.getSession(true);	
	session.removeAttribute("login");
	session.removeAttribute("idType");
		LoginForm loginForm=new LoginForm();
		modelMap.addAttribute("loginForm",loginForm);
		return "login";
	}
	
	
}
