package com.coder.form;

import java.util.List;

import com.coder.model.Book;
import com.coder.model.RentReturnStudent;

public class RentReturnStudentRegisterForm {
private RentReturnStudentForm rentReturnStudentForm=null;
private String message=null;
private String studentId;
private String stuRentId=null;
private MessageForm messageForm;
private List<RentReturnStudent> rentReturnStudents;
public RentReturnStudentForm getRentReturnStudentForm() {
	return rentReturnStudentForm;
}

public void setRentReturnStudentForm(RentReturnStudentForm rentReturnStudentForm) {
	this.rentReturnStudentForm = rentReturnStudentForm;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public List<RentReturnStudent> getRentReturnStudents() {
	return rentReturnStudents;
}

public void setRentReturnStudents(List<RentReturnStudent> rentReturnStudents) {
	this.rentReturnStudents = rentReturnStudents;
}

public String getStudentId() {
	return studentId;
}

public void setStudentId(String studentId) {
	this.studentId = studentId;
}

public String getStuRentId() {
	return stuRentId;
}

public void setStuRentId(String stuRentId) {
	this.stuRentId = stuRentId;
}

public MessageForm getMessageForm() {
	return messageForm;
}

public void setMessageForm(MessageForm messageForm) {
	this.messageForm = messageForm;
}

}
