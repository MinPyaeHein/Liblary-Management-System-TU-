package com.coder.servic;

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
import com.coder.dao.GreadDao;
import com.coder.dao.MajorDao;
import com.coder.dao.MemberDao;
import com.coder.dao.ShellDao;
import com.coder.dao.StudentDao;
import com.coder.form.BookForm;
import com.coder.form.BookRegisterForm;
import com.coder.form.LoginForm;
import com.coder.form.StudentForm;
import com.coder.form.StudentRegisterForm;
import com.coder.model.AcademicYear;
import com.coder.model.Book;
import com.coder.model.BookEdition;
import com.coder.model.Gread;
import com.coder.model.Major;
import com.coder.model.Member;
import com.coder.model.RentReturnStudent;
import com.coder.model.Shell;
import com.coder.model.Student;
import com.coder.util.DateFormat;
import com.coder.util.PrjSubFunction;
@Service
@Repository("studentRegisterService")
public class StudentRegisterServic {
	@Autowired
	private MajorDao majorDao;
	@Autowired
	private GreadDao greadDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private AcademicYearDao academicYearDao;
	@Autowired
	private LoginServic loginServic;
	@Autowired
	private MemberDao memberDao;

	public void prepareStudentRegister(StudentRegisterForm studentRegisterForm){
		StudentForm studentForm=studentRegisterForm.getStudentForm();
		
		if(studentForm!=null){
			int id=studentRegister(studentRegisterForm);
			
			}
		studentForm=new StudentForm();
		
		
		List<Major> majors=this.majorDao.getMajors();
		List<Gread> greads=this.greadDao.getGreads();
		List<Student> students=this.studentDao.getStudents();
		if(students.size()==0){
			studentForm.setStudentId("SID-"+1);
		}else{
			studentForm.setStudentId("SID-"+(students.size()+1));
		}
		studentRegisterForm.setStudentForm(studentForm);
		studentRegisterForm.setStudents(students);
		List<AcademicYear> academicYears=this.academicYearDao.getAcademicYears();
		
		for(Major m:majors){
			studentRegisterForm.getMapMajors().put(m.getMajorId()+"",m.getMajorName());
		}
		for(AcademicYear ac:academicYears){
		studentRegisterForm.getMapAcademicYears().put(""+ac.getYearId(),DateFormat.dateToString_YYYY(ac.getStartYear())+"-"+DateFormat.dateToString_YYYY(ac.getEndYear()));
		}
		for(Gread ad:greads){
		studentRegisterForm.getMapGreads().put(ad.getGreadId()+"",ad.getGreadName());
		}
		List<Member> members=this.memberDao.getMembers();
		for(Member me:members){
		studentRegisterForm.getMapMembers().put(""+me.getMemberId(),me.getMemberName());
		}
	}
	private int studentRegister(StudentRegisterForm studentRegisterForm){
		Student student=new Student();
		StudentForm studentForm=studentRegisterForm.getStudentForm();
		student.setStudentName(studentForm.getStudentName());
		student.setEmail(studentForm.getEmail());
		student.setAddress(studentForm.getAddress());
		student.setCreateDate(new Date());
		student.setPhone(studentForm.getPhone());
		student.setGender(studentForm.getGender());
		student.setRollNumber(Integer.parseInt(studentForm.getRollNumber()));
		student.setAddress1(studentForm.getAddress1());	
		AcademicYear academicYear=new AcademicYear();
		Major major=new Major();
		Gread gread=new Gread();
		Member member=new Member();
		member.setMemberId(Integer.parseInt(studentForm.getMemberId()));
		academicYear.setYearId(Integer.parseInt(studentForm.getYearId()));
		major.setMajorId(Integer.parseInt(studentForm.getMajorId()));
		gread.setGreadId(Integer.parseInt(studentForm.getGreadId()));
	    student.setAcademicYear(academicYear);
	    student.setMember(member);
		student.setMajor(major);
		student.setGread(gread);
		int id=studentDao.saveStudent(student);
		
		LoginForm loginForm=new LoginForm();
		loginForm.setPassword(studentForm.getPassword());
		loginForm.setUserName(studentForm.getStudentName());
		loginForm.setUserId(studentForm.getStudentId());
		this.loginServic.LoginRegister(loginForm);
	    return id; 
	}
public void showAllStudent(StudentRegisterForm studentRegisterForm){
	List<Student> students=this.studentDao.getStudents();
	studentRegisterForm.setStudents(students);
}
public void showUserDetail(StudentRegisterForm studentRegisterForm){
	int id=PrjSubFunction.convertId(studentRegisterForm.getStudentId(),"SID");
	Student student=this.studentDao.getStudentById(id);
	studentRegisterForm.setStudent(student);
}
public void showRentStudent(StudentRegisterForm studentRegisterForm){
	int id=PrjSubFunction.convertId(studentRegisterForm.getStudentId(),"SID");
	Student student=this.studentDao.getStudentById(id);
	Set<RentReturnStudent> rentReturnStudentSets=student.getRentReturnStudents();
	List<RentReturnStudent> rentReturnStudents=new ArrayList<RentReturnStudent>();
	for(RentReturnStudent rentReturnStudent:rentReturnStudentSets){
		if("9999-09-09".equals(""+rentReturnStudent.getReturnDate())){
			rentReturnStudent.setReturnDate(null);
			rentReturnStudents.add(rentReturnStudent);
		}
	}
	
	studentRegisterForm.setRentReturnStudents(rentReturnStudents);
}
public void showReturnStudent(StudentRegisterForm studentRegisterForm){
	int id=PrjSubFunction.convertId(studentRegisterForm.getStudentId(),"SID");
	Student student=this.studentDao.getStudentById(id);
	Set<RentReturnStudent> rentReturnStudentSets=student.getRentReturnStudents();
	List<RentReturnStudent> rentReturnStudents=new ArrayList<RentReturnStudent>();
	for(RentReturnStudent rentReturnStudent:rentReturnStudentSets){
		if(!"9999-09-09".equals(""+rentReturnStudent.getReturnDate())){
			rentReturnStudents.add(rentReturnStudent);
		}
	}
	
	studentRegisterForm.setRentReturnStudents(rentReturnStudents);
}
}
