package com.coder.dao;
import java.util.List;
import org.springframework.stereotype.Repository;

import com.coder.model.Admin;
import com.coder.model.Book;
import com.coder.model.Student;
import com.coder.model.Teacher;
@Repository("adminDao")
public class AdminDao extends AbstractDao<Integer,Admin>{
	
	public Integer saveAdmin(Admin admin)
	{
	return (Integer)super.persist(admin);
    }
	public Admin getTeacherById(int id){
		Admin admin=super.criteriaQuerryGetObjectById(id,"teacherId");
	return admin;
	}
    public void  updateAdmin(Admin admin)
    {
    super.update(admin);
    }
    public void  deleteAdmin(Admin admin)
    {
    super.delete(admin);
    }
    public List<Admin> getAdmins() {
	List<Admin> admins=(List<Admin>)super.getAllEntity();
		return admins;
	}

}
