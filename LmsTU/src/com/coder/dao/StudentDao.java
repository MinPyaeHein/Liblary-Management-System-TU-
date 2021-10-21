package com.coder.dao;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.coder.model.Book;
import com.coder.model.Student;
import com.coder.model.Teacher;
@Repository("studentDoa")
public class StudentDao extends AbstractDao<Integer,Student>{
	
	public Integer saveStudent(Student student)
	{
	return (Integer)super.persist(student);

		}
	public Student getStudentById(int id){
		Student student=super.criteriaQuerryGetObjectById(id,"studentId");
		return student;
		}
  
public void  updateStudent(Student student)
{
super.update(student);

}

public void  deleteStudent(Student student)
{
super.delete(student);
}
public List<Student> getStudents() {
List<Student> students=(List<Student>)super.getAllEntity();
	return students;
}



}
