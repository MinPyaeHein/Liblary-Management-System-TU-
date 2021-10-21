package com.coder.servic;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


import com.coder.dao.RentReturnStudentDao;
import com.coder.dao.RentReturnTeacherDao;
import com.coder.form.MailForm;
import com.coder.model.RentReturnStudent;
import com.coder.model.RentReturnTeacher;
import com.coder.util.DateFormat;
import com.coder.util.PrjSubFunction;

@Service
@Repository("autoMailServic")
public class AutoMailServic {
@Autowired
private RentReturnTeacherDao rentReturnTeacherDao;
@Autowired
private RentReturnStudentDao rentReturnStudentDao;
@Autowired
private GeneralService generalService;

@Scheduled(fixedDelay=50000)
public void autoMailStudent(){
	System.out.println("Working Student");
	List<RentReturnStudent> rentReturnStudents=rentReturnStudentDao.getRentReturnStuListBySent();
	if(rentReturnStudents!=null){
		  for(RentReturnStudent rrs:rentReturnStudents){
			  Date addDate=DateFormat.subDays(+1);
			  String dueDate=rrs.getDueDate()+"";
			  String testDate=DateFormat.dateToString_DB_Format(addDate);
			  if(testDate.equals(dueDate)){
				  String subject="";
				  MailForm mailForm=new MailForm();
				  System.out.println("rrs.getStudent().getEmail()="+rrs.getStudent().getEmail().trim());
				  mailForm.setToMail(rrs.getStudent().getEmail().trim());
				  subject+="Student Name="+rrs.getStudent().getStudentName()+"\n";
				  subject+="Book Name="+rrs.getBook().getBookName()+"\n";
				  subject+="Due Date="+DateFormat.dateToStringFormat_dd_mm_yyyy(rrs.getDueDate())+"\n";
				  subject+="You have to return it tomorrow.\n";
				  mailForm.setSubject(subject);
				  mailForm.setContent("Dear Member,I'd like to talk to you about a Your Rent Book\n");
				  generalService.processSendMail(mailForm);
				  rrs.setSent("sent");
				  this.rentReturnStudentDao.updateRentReturnStudent(rrs);
			  }
		  }
	}
}
//@Scheduled(fixedDelay=5000)
public void autoMailTeacher(){
	System.out.println("Working Teacher");
	List<RentReturnTeacher> rentReturnTeachers=rentReturnTeacherDao.getRentReturnTeacherListBySent();
	if(rentReturnTeachers!=null){
		  for(RentReturnTeacher rrs:rentReturnTeachers){
			  Date addDate=DateFormat.subDays(+1);
			  String dueDate=rrs.getDueDate()+"";
			  String testDate=DateFormat.dateToString_DB_Format(addDate);
			  if(testDate.equals(dueDate)){
				  String subject="";
				  MailForm mailForm=new MailForm();
				  mailForm.setToMail(rrs.getTeacher().getEmail().trim());
				  subject+=rrs.getTeacher().getTeacherName()+"\n";
				  subject+="Book Name="+rrs.getBook().getBookName()+"\n";
				  subject+="Due Date="+DateFormat.dateToStringFormat_dd_mm_yyyy(rrs.getDueDate())+"\n";
				  subject+="You have to return it tomorrow.\n";
				  mailForm.setSubject(subject);
				  mailForm.setContent("Dear Customer,I'd like to talk to you about a Your Rent Book\n");
				  generalService.processSendMail(mailForm);
				  int sent=rrs.getSent()-1;
				  rrs.setSent(sent);
				  this.rentReturnTeacherDao.updateRentReturnTeacher(rrs);
			  }
		  }
	}
}
}
