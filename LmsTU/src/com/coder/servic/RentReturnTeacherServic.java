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
import com.coder.dao.RentReturnTeacherDao;
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
import com.coder.form.RentReturnTeacherForm;
import com.coder.form.RentReturnTeacherRegisterForm;
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
import com.coder.model.RentReturnTeacher;
import com.coder.model.Shell;
import com.coder.model.Student;
import com.coder.model.Teacher;
import com.coder.util.DateFormat;
import com.coder.util.PrjSubFunction;
@Service
@Repository("rentReturnTeacherServic")
public class RentReturnTeacherServic {
	@Autowired
	private RentReturnTeacherDao rentReturnTeacherDao;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private TeacherDao teacherDao;
	
	
	public void prepareRentReturnTeacherRegister(RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm){
		RentReturnTeacherForm rentReturnTeacherForm=rentReturnTeacherRegisterForm.getRentReturnTeacherForm();
		if(rentReturnTeacherForm!=null){
			int id=rentReturnTeacherRegister(rentReturnTeacherRegisterForm);
		}
		rentReturnTeacherForm=new RentReturnTeacherForm();
	Date date=new Date();
	Date dueDate=DateFormat.addDays(date,1);
	String rentDate=DateFormat.dateToStringFormat_dd_mm_yyyy(date);
    String dueDateStr=DateFormat.dateToStringFormat_dd_mm_yyyy(dueDate);
    rentReturnTeacherForm.setDueDate(dueDateStr);
    rentReturnTeacherForm.setRentDate(rentDate);
    rentReturnTeacherRegisterForm.setRentReturnTeacherForm(rentReturnTeacherForm);
	}
	private int rentReturnTeacherRegister(RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm){
		RentReturnTeacher rentReturnTeacher=new RentReturnTeacher();
		RentReturnTeacherForm rentReturnTeacherForm=rentReturnTeacherRegisterForm.getRentReturnTeacherForm();
		Book book=this.bookDao.getBookById(Integer.parseInt(rentReturnTeacherForm.getBookId()));
		int qty=book.getQty();
		int id=-1;
		if(qty>0){
		String result=testUserForRent(rentReturnTeacherForm.getUserId());
		if(result==null){
			rentReturnTeacher.setRentDate(new Date());
			rentReturnTeacher.setDueDate(DateFormat.stringToDateFormat_dd_mm_yyyy(rentReturnTeacherForm.getDueDate()));
			rentReturnTeacher.setLateFeet(0);
		Student student=new Student();  
		Admin admin=new Admin();
		// book=new Book();
		int sid=PrjSubFunction.convertId(rentReturnTeacherForm.getUserId(),"SID");
		Teacher teacher=this.teacherDao.getTeacherById(sid);
		Set<RentReturnTeacher> rentReturnTeachers=teacher.getRentReturnTeachers();
		Boolean flag=true;
		for(RentReturnTeacher rentReturnTeacher2:rentReturnTeachers){
			
			int rentBook=rentReturnTeacher2.getBook().getBookId();
		//	System.out.println("ReturnDate="+rentReturnStudent2.getReturnDate()+"::"+rentBook+"=="+book.getBookId());
			if("9999-09-09".equals(rentReturnTeacher2.getReturnDate()+"")&&(rentBook==book.getBookId())){
				flag=false;
			}
		}
		if(flag){
			int aid=PrjSubFunction.convertId(rentReturnTeacherForm.getAdminId(),"ID");
	
		admin.setAdminId(aid);
		book.setBookId(Integer.parseInt(rentReturnTeacherForm.getBookId()));
		rentReturnTeacher.setBook(book);
		rentReturnTeacher.setAdmin(admin);
		rentReturnTeacher.setTeacher(teacher);		
		rentReturnTeacher.setSent(1);
		Date returnDate=DateFormat.stringToDateFormat_dd_mm_yyyy("09/09/9999");
		rentReturnTeacher.setReturnDate(returnDate);
		id=this.rentReturnTeacherDao.saveRentReturnTeacher(rentReturnTeacher);
		System.out.println("id="+id);
		if(id!=-1){
			 book=this.bookDao.getBookById(Integer.parseInt(rentReturnTeacherForm.getBookId()));
			 qty=book.getQty()-1;
			 book.setQty(qty);
			 this.bookDao.update(book);
		}
		
		}else{
			rentReturnTeacherRegisterForm.setMessage("You have already borrowed this book!");	
		}
		}else{
			rentReturnTeacherRegisterForm.setMessage(result);	
		}
		}else{
			rentReturnTeacherRegisterForm.setMessage("You can't rent that book yet because this book is out of stock in the liblary!");
		}
		return id; 
	}
	public String testUserForRent(String stuId){
		int sid=PrjSubFunction.convertId(stuId,"SID");
		Teacher teacher=this.teacherDao.getTeacherById(sid);
		Member member=teacher.getMember();
		Set<RentReturnTeacher> rentReturnTeachers=teacher.getRentReturnTeachers();
		int count=0;
		for(RentReturnTeacher rentReturnTeacher:rentReturnTeachers){
			Date returnDate=rentReturnTeacher.getReturnDate();
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
	public void perparReturnBook1(RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm){
		int sid=PrjSubFunction.convertId(rentReturnTeacherRegisterForm.getTeacherId(),"SID");
		Teacher teacher=this.teacherDao.getTeacherById(sid);
		Set<RentReturnTeacher> rentReturnTeachers=teacher.getRentReturnTeachers();
		List<RentReturnTeacher> rentReturnTeachers2=new ArrayList<RentReturnTeacher>();
		for(RentReturnTeacher rentReturnTeacher:rentReturnTeachers){
			if("9999-09-09".equals(rentReturnTeacher.getReturnDate()+"")){
				rentReturnTeachers2.add(rentReturnTeacher);
			}
		}
		rentReturnTeacherRegisterForm.setRentReturnTeachers(rentReturnTeachers2);	
			
	}
	public MessageForm preparReturnBook2(RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm) throws ParseException{
	RentReturnTeacher rentReturnTeacher=this.rentReturnTeacherDao.getRentReturnTeacherById(Integer.parseInt(rentReturnTeacherRegisterForm.getTeaRentId()));
	rentReturnTeacher.setReturnDate(new Date());
	Date date1=rentReturnTeacher.getDueDate();
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
	int bookId=rentReturnTeacher.getBook().getBookId();
	messageForm.setBookId(bookId+"");
	messageForm.setUserId(rentReturnTeacher.getTeacher().getTeacherId()+"");
	messageForm.setUserName(rentReturnTeacher.getTeacher().getTeacherName());
	messageForm.setRentDate(DateFormat.dateToStringFormat_dd_mm_yyyy(rentReturnTeacher.getRentDate()));
	messageForm.setDueDate(DateFormat.dateToStringFormat_dd_mm_yyyy(date1));
	messageForm.setReturnDate(DateFormat.dateToStringFormat_dd_mm_yyyy(new Date()));
	rentReturnTeacher.setLateFeet(feet);
	Book book=this.bookDao.getBookById(bookId);
	int qty=book.getQty()+1;
	book.setQty(qty);
	this.bookDao.update(book);
	this.rentReturnTeacherDao.update(rentReturnTeacher);
	return messageForm;
	}
	public void showAllRentReturnList(RentReturnTeacherRegisterForm rentReturnTeacherRegisterForm){
		List<RentReturnTeacher> rentReturnTeachers=this.rentReturnTeacherDao.getRentReturnTeachers();
		for(RentReturnTeacher rentReturnTeacher:rentReturnTeachers){
			String returnDate=rentReturnTeacher.getReturnDate()+"";
			if(returnDate.equals("9999-09-09")){
				rentReturnTeacher.setReturnDate(null);
			}
		}
		rentReturnTeacherRegisterForm.setRentReturnTeachers(rentReturnTeachers);
	}
	

}
