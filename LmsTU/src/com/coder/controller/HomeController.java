package com.coder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.jpl7.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coder.form.AuthorRegisterForm;
import com.coder.servic.AuthorRegisterService;

@Controller
@Transactional
public class HomeController {
	
	
	@RequestMapping("/ggg")
	public String TypeRegisterDispatcher(HttpServletRequest req,HttpServletResponse resp)
	{   
		/*try {
			String path= Class.forName("org.jpl7.JPL").getProtectionDomain().getCodeSource().getLocation().toString();
			System.out.println(path);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String t1="consult('C:/Users/Aspire/Documents/Prolog/family.pl')";
		Query q1=new Query(t1);
		System.out.println(t1+" "+(q1.hasSolution() ?"Successed":"fail"));
		String t2="child_of(joe,ralf)";
		Query q2=new Query(t2);
		System.out.println(t2+"is"+(q2.hasSolution() ?"provable":"notProbable"));*/
		return "home";
	}
	

}
