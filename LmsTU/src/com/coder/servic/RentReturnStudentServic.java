package com.coder.servic;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.user.UserRegistryMessageHandler;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.coder.dao.AcademicYearDao;
import com.coder.dao.BookDao;
import com.coder.dao.BookEditionDao;
import com.coder.dao.DepartmentDao;
import com.coder.dao.GreadDao;
import com.coder.dao.MajorDao;
import com.coder.dao.MemberDao;
import com.coder.dao.PositionDao;
import com.coder.dao.RentReturnStudentDao;
import com.coder.dao.ShellDao;
import com.coder.dao.StudentDao;
import com.coder.dao.TeacherDao;
import com.coder.form.BookForm;
import com.coder.form.BookRegisterForm;
import com.coder.form.LoginForm;
import com.coder.form.MemberForm;
import com.coder.form.MessageForm;
import com.coder.form.RentReturnStudentForm;
import com.coder.form.RentReturnStudentRegisterForm;
import com.coder.form.StudentForm;
import com.coder.form.StudentRegisterForm;
import com.coder.form.TeacherForm;
import com.coder.form.TeacherRegisterForm;
import com.coder.model.AcademicYear;
import com.coder.model.Admin;
import com.coder.model.Book;
import com.coder.model.BookEdition;
import com.coder.model.Department;
import com.coder.model.Gread;
import com.coder.model.Major;
import com.coder.model.Member;
import com.coder.model.Position;
import com.coder.model.RentReturnStudent;
import com.coder.model.Shell;
import com.coder.model.Student;
import com.coder.model.Teacher;
import com.coder.util.DateFormat;
import com.coder.util.PrjSubFunction;
@Service
@Repository("rentReturnStudentServic")
public class RentReturnStudentServic {
	@Autowired
	private RentReturnStudentDao rentReturnStudentDao;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private StudentDao studentDao;
	private  Class<RentReturnStudent> persistentClass;
	
	public void prepareRentReturnStudentRegister(RentReturnStudentRegisterForm rentReturnStudentRegisterForm ){
		RentReturnStudentForm returnStudentForm=rentReturnStudentRegisterForm.getRentReturnStudentForm();
		if(returnStudentForm!=null){
			int id=rentReturnStudentRegister(rentReturnStudentRegisterForm);
		}
    returnStudentForm=new RentReturnStudentForm();
	Date date=new Date();
	Date dueDate=DateFormat.addDays(date,1);
	String rentDate=DateFormat.dateToStringFormat_dd_mm_yyyy(date);
    String dueDateStr=DateFormat.dateToStringFormat_dd_mm_yyyy(dueDate);
    returnStudentForm.setDueDate(dueDateStr);
    returnStudentForm.setRentDate(rentDate);
    rentReturnStudentRegisterForm.setRentReturnStudentForm(returnStudentForm);
	}
	private int rentReturnStudentRegister(RentReturnStudentRegisterForm rentReturnStudentRegisterForm){
		RentReturnStudent rentReturnStudent=new RentReturnStudent();
		RentReturnStudentForm rentReturnStudentForm=rentReturnStudentRegisterForm.getRentReturnStudentForm();
		int bid=PrjSubFunction.convertId(rentReturnStudentForm.getBookId(),"BID");
		System.out.print("bid="+bid);
		Book book=this.bookDao.getBookById(bid);
		int qty=book.getQty();
		int id=-1;
		if(qty>0){
		String result=testUserForRent(rentReturnStudentForm.getUserId());
		if(result==null){
		rentReturnStudent.setRentDate(new Date());
		rentReturnStudent.setDueDate(DateFormat.stringToDateFormat_dd_mm_yyyy(rentReturnStudentForm.getDueDate()));
		rentReturnStudent.setLateFeet(0);
		Student student=new Student();  
		Admin admin=new Admin();
		// book=new Book();
		int sid=PrjSubFunction.convertId(rentReturnStudentForm.getUserId(),"SID");
		student=this.studentDao.getStudentById(sid);
		Set<RentReturnStudent> rentReturnStudents=student.getRentReturnStudents();
		Boolean flag=true;
		for(RentReturnStudent rentReturnStudent2:rentReturnStudents){
			
			int rentBook=rentReturnStudent2.getBook().getBookId();
		//	System.out.println("ReturnDate="+rentReturnStudent2.getReturnDate()+"::"+rentBook+"=="+book.getBookId());
			if("9999-09-09".equals(rentReturnStudent2.getReturnDate()+"")&&(rentBook==book.getBookId())){
				flag=false;
			}
		}
		if(flag){
			int aid=PrjSubFunction.convertId(rentReturnStudentForm.getAdminId(),"ID");
	//System.out.print("aid="+aid);
		admin.setAdminId(aid);
		
		book.setBookId(bid);
		rentReturnStudent.setBook(book);
		rentReturnStudent.setAdmin(admin);
		rentReturnStudent.setStudent(student);		
		rentReturnStudent.setSent("notSent");
		Date returnDate=DateFormat.stringToDateFormat_dd_mm_yyyy("09/09/9999");
		rentReturnStudent.setReturnDate(returnDate);
		id=this.rentReturnStudentDao.saveRentReturnStudent(rentReturnStudent);
		System.out.println("id="+id);
		if(id!=-1){
			 book=this.bookDao.getBookById(bid);
			 qty=book.getQty()-1;
			 book.setQty(qty);
			 this.bookDao.update(book);
		}
		
		}else{
			rentReturnStudentRegisterForm.setMessage("You have already borrowed this book!");	
		}
		}else{
			rentReturnStudentRegisterForm.setMessage(result);	
		}
		}else{
	    rentReturnStudentRegisterForm.setMessage("You can't rent that book yet because this book is out of stock in the liblary!");
		}
		return id; 
	}
	public String testUserForRent(String stuId){
		int sid=PrjSubFunction.convertId(stuId,"SID");
		Student student=this.studentDao.getStudentById(sid);
		Member member=student.getMember();
		Set<RentReturnStudent> rentReturnStudents=student.getRentReturnStudents();
		int count=0;
		for(RentReturnStudent rentReturnStudent:rentReturnStudents){
			Date returnDate=rentReturnStudent.getReturnDate();
			if(returnDate==null){
				count++;}
		}
		System.out.println("count="+count);
		String result=null;
		int coin=member.getCoin();
		if(coin<=count){
			result="Your limit is over,You can rent it after you return the rental book";
		}
		return result;
		
	}
	public void perparReturnBook1(RentReturnStudentRegisterForm returnStudentRegisterForm){
		int sid=PrjSubFunction.convertId(returnStudentRegisterForm.getStudentId(),"SID");
		Student student=this.studentDao.getStudentById(sid);
		Set<RentReturnStudent> rentReturnStudents=student.getRentReturnStudents();
		List<RentReturnStudent> rentReturnStudents2=new ArrayList<RentReturnStudent>();
		for(RentReturnStudent rentReturnStudent:rentReturnStudents){
			if("9999-09-09".equals(rentReturnStudent.getReturnDate()+"")){
				rentReturnStudents2.add(rentReturnStudent);
			}
		}
		returnStudentRegisterForm.setRentReturnStudents(rentReturnStudents2);	
			
	}
	public MessageForm preparReturnBook2(RentReturnStudentRegisterForm returnStudentRegisterForm) throws ParseException{

	RentReturnStudent rentReturnStudent=this.rentReturnStudentDao.getRentReturnStudentById(Integer.parseInt(returnStudentRegisterForm.getStuRentId()));
	rentReturnStudent.setReturnDate(new Date());
	Date date1=rentReturnStudent.getDueDate();
	Long day=DateFormat.dateDiff(date1,new Date());
	MessageForm messageForm=new MessageForm();
	int feet=0;
	if(day<0){
		feet=(int) ((0-day)*100);
		messageForm.setLateDay((0-day)+"");
		messageForm.setLateFeet(feet+"Kyats");
		messageForm.setMessage("You'll have to pay a fine because you're late ");
	}else{
		messageForm.setMessage("Return Process Complete");
	}
	int bookId=rentReturnStudent.getBook().getBookId();
	messageForm.setBookId(bookId+"");
	messageForm.setUserId(rentReturnStudent.getStudent().getStudentId()+"");
	messageForm.setUserName(rentReturnStudent.getStudent().getStudentName());
	messageForm.setRentDate(DateFormat.dateToStringFormat_dd_mm_yyyy(rentReturnStudent.getRentDate()));
	messageForm.setDueDate(DateFormat.dateToStringFormat_dd_mm_yyyy(date1));
	messageForm.setReturnDate(DateFormat.dateToStringFormat_dd_mm_yyyy(new Date()));
	rentReturnStudent.setLateFeet(feet);
	Book book=this.bookDao.getBookById(bookId);
	int qty=book.getQty()+1;
	book.setQty(qty);
	this.bookDao.update(book);
	this.rentReturnStudentDao.update(rentReturnStudent);
	return messageForm;
	}
	public void showAllRentList(RentReturnStudentRegisterForm returnStudentRegisterForm){
		List<RentReturnStudent> rentReturnStudents=this.rentReturnStudentDao.getRentReturnStudents();
		List<RentReturnStudent> rentReturnStudents1=new ArrayList<>();
	
		for(RentReturnStudent rentReturnStudent:rentReturnStudents){
			String returnDate=rentReturnStudent.getReturnDate()+"";
			if(returnDate.equals("9999-09-09")){
			rentReturnStudents1
			.add(rentReturnStudent);
				
			}
			
		}
		returnStudentRegisterForm.setRentReturnStudents(rentReturnStudents1);
	}
	public void showAllReturnList(RentReturnStudentRegisterForm returnStudentRegisterForm){
		List<RentReturnStudent> rentReturnStudents=this.rentReturnStudentDao.getRentReturnStudents();
		List<RentReturnStudent> rentReturnStudents1=new ArrayList<>();
		
		for(RentReturnStudent rentReturnStudent:rentReturnStudents){
			String returnDate=rentReturnStudent.getReturnDate()+"";
			if(!returnDate.equals("9999-09-09")){
				rentReturnStudents1.add(rentReturnStudent);
			}
			
		}
		returnStudentRegisterForm.setRentReturnStudents(rentReturnStudents1);
	}

}
