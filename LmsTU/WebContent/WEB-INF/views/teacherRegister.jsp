<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/resources/admin/header/header.jsp" %>
<%@ include file="/resources/admin/header/HeaderAndMainSlider.jsp" %>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <div class="content-wrapper">
  <section class="content">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col">
            <h1>Teacher Register</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Teacher Register</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
        <div class="card card-success">
                <div class="card-header">
                <h3 class="card-title">Teacher Register</h3>
              </div>
        <div class="card-body">
          <form:form action="teacherRegisterSubmitPath" modelAttribute="teacherRegisterForm.teacherForm" method="POST" enctype="multipart/form-data" >
 
   
	       
                <div class="card-body">
                <div class="row">
        	    <div class="col-md-6">
        	     <div class="form-group">
				Teacher Id :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="teacherId" path="teacherId" name="teacherId"  class="form-control"  data-mask="data-mask" readonly="true"/>
                  </div>
         		 </div>
         		 <div class="form-group">
				Teacher Name :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="teacherName" path="teacherName" name="teacherName"  class="form-control"  data-mask="data-mask" />
                  </div>
         		 </div>
         		  <div class="form-group">
				Password :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="password" id="password" path="password" name="password"  class="form-control"  data-mask="data-mask" />
                  </div>
         		 </div>
         		   <div class="form-group">
				Gender :
         		 <div class="input-group">
                       <div class="form-check">
                         <form:radiobutton path="gender" value="M" class="form-check-input" name="gender"/>
                          <label class="form-check-label">Male</label>
                        </div><br>
                        <div class="form-check">
                         <form:radiobutton path="gender" value="F" class="form-check-input" name="gender"/>
                          <label class="form-check-label">Female</label>
                        </div>
                    </div>
                    </div>
                    
         		<div class="form-group">
				 Gmail :
                <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="email" path="email" name="email"  class="form-control"  data-mask="data-mask" />
                  </div>
         		 </div>
         		<div class="form-group">
				 Phone :
                <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="phone" path="phone" name="phone"  class="form-control"  data-mask="data-mask" />
                  </div>
         		 </div>
         		  
         		<div class="form-group">
				 Address :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="address" path="address" name="address"  class="form-control"  data-mask="data-mask" />
                  </div>
         		 </div>
         		 
         		 <div class="form-group">
				Another Address :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="address1" path="address1" name="address1"  class="form-control"  data-mask="data-mask" />
                  </div>
         		 </div>
                    
                   <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Select Department</label>
                       <form:select path="departmentId" name="departmentId" id="departmentId" class="form-control" > 
                       <form:options items="${teacherRegisterForm.mapDepartments}"/>
                       </form:select>
                      </div>
                    </div> 
                      <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Select Position</label>
                       <form:select path="positionId" name="positionId" id="positionId" class="form-control" > 
                       <form:options items="${teacherRegisterForm.mapPositions}"/>
                       </form:select>
                      </div>
                    </div> 
                     <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Select Member Type</label>
                       <form:select path="memberId" name="memberId" id="memberId" class="form-control" > 
                       <form:options items="${teacherRegisterForm.mapMembers}"/>
                       </form:select>
                      </div>
                    </div> 
                      <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Select Academic Year</label>
                       <form:select path="yearId" name="yearId" id="yearId" class="form-control" > 
                       <form:options items="${teacherRegisterForm.mapAcademicYears}"/>
                       </form:select>
                      </div>
                    </div>  
                   
                    
              <div class="form-group">
	             <div class="input-group">
	             <div class="input-group-prepend">
                 <span></span>
                    </div>
              <input type="submit" name="save"
             class="btn btn-block bg-gradient-primary btn-m" value="Save"/>
             </div>
            </div>
              <div class="form-group">
	             <div class="input-group">
	             <div class="input-group-prepend">
                 <span></span>
                    </div>
              <input type="submit" name="exit"
             class="btn btn-block bg-gradient-primary btn-m" value="Exit"/>
             </div>
            </div>
             </div>
			 </div>
			 </div> 
            
              </form:form>
             
                <!-- /.form-group -->
              
              <!-- /.col -->
              </div>
            </div>
       <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
   
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
               <tr>
			<th>No</th>
			<th>Teacher Id</th>
			<th>Teacher Name</th>
			<th>Gender</th>
			<th>Position</th>
			<th>Department</th>
			<th>Gmail</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Address1</th>
            <th>Delete</th>
			<th>Update</th>
		       </tr>
                </thead>
                <tbody>
            <c:forEach var="at" items="${teacherRegisterForm.teachers}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>TID-${at.teacherId}</td>
				<td>${at.teacherName}</td>
				<td>${at.gender}</td>
				<td>${at.position.positionName}</td>
				<td>${at.department.departmentName}</td>
				<td>${at.email}</td>
				<td>${at.phone}</td>
				<td>${at.address}</td>
				<td>${at.address1}</td>
				<td><a href="doctorDeletePath?frmDoctorId=${at.teacherId}"class="btn btn-block btn-outline-primary btn-sm">Delete</a></td>
				<td><a href="doctorUpdatePath?frmDoctorId=${at.teacherId}"class="btn btn-block btn-outline-primary btn-sm">Update</a></td>
			</tr>		
		</c:forEach>
                </tbody>
                <tfoot>
                 <tr>
			<th>No</th>
			<th>Teacher Id</th>
			<th>Teacher Name</th>
			<th>Gender</th>
			<th>Position</th>
			<th>Department</th>
			<th>Gmail</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Address1</th>
            <th>Delete</th>
			<th>Update</th>
		       </tr>
             
                </tfoot>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    </section>
  </div>
  <!-- /.content-wrapper -->
  <%@ include file="/resources/admin/footer/footer.jsp" %>

<!-- jQuery -->
<script src="<c:url value="resources/admin/plugins/jquery/jquery.min.js"/>"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value="resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- DataTables -->
<script src="<c:url value="resources/admin/plugins/datatables/jquery.dataTables.js"/>"></script>
<script src="<c:url value="resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="resources/admin/dist/js/adminlte.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="resources/admin/dist/js/demo.js"/>"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
    });
  });
</script>
</body>
</html>
