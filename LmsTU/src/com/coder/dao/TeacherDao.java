package com.coder.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.coder.model.Book;
import com.coder.model.Student;
import com.coder.model.Teacher;
@Repository("teacherDao")
public class TeacherDao extends AbstractDao<Integer,Teacher>{
	
	public Integer saveTeacher(Teacher teacher)
	{
	return (Integer)super.persist(teacher);
    }
	public Teacher getTeacherById(int id){
		   Teacher teacher=super.criteriaQuerryGetObjectById(id,"teacherId");
	return teacher;
	}
    public void  updateTeacher(Teacher teacher)
    {
    super.update(teacher);
    }
    public void  deleteTeacher(Teacher teacher)
    {
    super.delete(teacher);
    }
    public List<Teacher> getTeachers() {
	List<Teacher> teachers=(List<Teacher>)super.getAllEntity();
		return teachers;
	}

}
