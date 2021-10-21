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
import com.coder.model.Login;
import com.coder.servic.AdminServic;
import com.coder.servic.LoginServic;
import com.coder.servic.RentReturnStudentServic;


@Controller
@Transactional
public class ReturnControllerStudent {
	
	@Autowired
	private LoginServic loginServic;
	@Autowired
	private AdminServic adminServic;
	@Autowired
	private RentReturnStudentServic rentReturnStudentServic;
	@RequestMapping("/returnLoginPath")
	public String loginDispatcher(ModelMap modelMap,HttpServletRequest req,HttpServletResponse resp)
	{
		LoginForm loginForm=new LoginForm();
		modelMap.addAttribute("loginForm",loginForm);
		return "returnLogin";
	}
	@RequestMapping("/returnloginSubmitPath")
	public String loginSubmitDispatcher(@ModelAttribute("LoginForm") LoginForm loginForm,ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp)
	{	HttpSession session=req.getSession(true);	
		
	    Login loginObj=this.loginServic.testLogin(loginForm);
	    session.setAttribute("login",loginObj);
		    	 if(loginObj!=null){
		    	 RentReturnStudentRegisterForm rentReturnStudentRegisterForm=new RentReturnStudentRegisterForm();
		    	 rentReturnStudentRegisterForm.setStudentId(loginObj.getUserId());
		    	 this.rentReturnStudentServic.perparReturnBook1(rentReturnStudentRegisterForm);
		    	 modelMap.addAttribute("rentReturnStudentRegisterForm", rentReturnStudentRegisterForm);
	    		 return "selectRentBook";
	    	      }else{
       	        loginForm=new LoginForm();
       	        loginForm.setMessage("Incorrect User ID And Password!");
       			modelMap.addAttribute("loginForm",loginForm);
       	    	return "returnLogin";
        	      }
    	     }
	@RequestMapping("/selectRentBookPath")
	public String selectRentbookDispatcher(ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp)
	{	HttpSession session=req.getSession(true);	
		
	 Login login= (Login) session.getAttribute("login");
		    
		    	 RentReturnStudentRegisterForm rentReturnStudentRegisterForm=new RentReturnStudentRegisterForm();
		    	 rentReturnStudentRegisterForm.setStudentId(login.getUserId());
		    	 this.rentReturnStudentServic.perparReturnBook1(rentReturnStudentRegisterForm);
		    	 modelMap.addAttribute("rentReturnStudentRegisterForm", rentReturnStudentRegisterForm);
	    		 return "selectRentBook";
	    	    
    	     }
	@RequestMapping("/returnBookSubmitPath")
	public String returnBookSubmitDispatcher(@ModelAttribute("rentReturnStudentRegisterForm") RentReturnStudentRegisterForm rentReturnStudentRegisterForm,ModelMap modelMap,
			HttpServletRequest req,HttpServletResponse resp) throws ParseException
	{	
		           String rentStuId=req.getParameter("frmStuRentId");
	     		   rentReturnStudentRegisterForm.setStuRentId(rentStuId);
	     		MessageForm messageForm= this.rentReturnStudentServic.preparReturnBook2(rentReturnStudentRegisterForm);
	     		 modelMap.addAttribute("messageForm", messageForm);
		    	 
	    		 return "returnResult";
	    	  
    	     }
	
		
      }
	
	

