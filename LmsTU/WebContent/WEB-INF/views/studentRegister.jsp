
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
            <h1>Student Register</h1>
           
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Student Register</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
   


    <!-- Main content -->
        <div class="card card-success">
                <div class="card-header">
                <h3 class="card-title">Student Register</h3>
              </div>
        <div class="card-body">
          <form:form action="studentRegisterSubmitPath" modelAttribute="studentRegisterForm.studentForm" method="POST" enctype="multipart/form-data" >
              <div class="card-body">
                <div class="row">
        	    <div class="col-md-6">
        	      <div class="form-group">
				Student Id :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="studentId" path="studentId" name="studentId"  class="form-control"  data-mask="data-mask" readonly="true"/>
                  </div>
         		 </div>
        	     <div class="form-group">
				student Name :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="studentName" path="studentName" name="studentName"  class="form-control"  data-mask="data-mask"  />
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
                         <form:radiobutton path="gender" value="Male" class="form-check-input" name="gender"/>
                          <label class="form-check-label">Male</label>
                        </div><br>
                        <div class="form-check">
                         <form:radiobutton path="gender" value="Female" class="form-check-input" name="gender"/>
                          <label class="form-check-label">Female</label>
                        </div>
                    </div>
                    </div>
                    <div class="form-group">
				  Roll Number:
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="rollNumber" path="rollNumber" name="rollNumber"  class="form-control"  data-mask="data-mask"  />
                  </div>
         		 </div>
         		   <div class="form-group">
				  Phone:
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="phone" path="phone" name="phone"  class="form-control"  data-mask="data-mask"  />
                  </div>
         		 </div>
         		 <div class="form-group">
				  Gmail:
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="email" path="email" name="email"  class="form-control"  data-mask="data-mask"  />
                  </div>
         		 </div>
                   <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Academic Year</label>
                       <form:select path="yearId" name="yearId" id="yearId" class="form-control" > 
                       <form:options items="${studentRegisterForm.mapAcademicYears}"/>
                       </form:select>
                      </div>
                </div> 
                 <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Major</label>
                       <form:select path="majorId" name="majorId" id="majorId" class="form-control" > 
                       <form:options items="${studentRegisterForm.mapMajors}"/>
                       </form:select>
                      </div>
                </div>
                  <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Grade</label>
                       <form:select path="greadId" name="greadId" id="greadId" class="form-control" > 
                       <form:options items="${studentRegisterForm.mapGreads}"/>
                       </form:select>
                      </div>
                </div> 
                  <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Select Member Type</label>
                       <form:select path="memberId" name="memberId" id="memberId" class="form-control" > 
                       <form:options items="${studentRegisterForm.mapMembers}"/>
                       </form:select>
                      </div>
                    </div>
                  <div class="form-group">
				  Address:
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="address" path="address" name="address"  class="form-control"  data-mask="data-mask"  />
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
			<th>Student Id</th>
			<th>Student Name</th>
			<th>Roll Number</th>
			<th>Gender</th>
			<th>AcademicYear</th>
			<th>Major</th>
			<th>Grade</th>
			<th>Phone</th>
			<th>Create Date</th>
			<th>Email</th>
            <th>Address</th>
			<th>Address1</th>
		       </tr>
                </thead>
                <tbody>
            <c:forEach var="at" items="${studentRegisterForm.students}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>SID-${at.studentId}</td>
				<td>${at.studentName}</td>
				<td>${at.rollNumber}</td>
				<td>${at.gender}</td>
				<td>${at.academicYear.startYear}-${at.academicYear.endYear}</td>
				<td>${at.major.majorName}</td>
				<td>${at.gread.greadName}</td>
				<td>${at.phone}</td>
				<td>${at.createDate}</td>
				<td>${at.email}</td>
				<td>${at.address}</td>
				<td>${at.address1}</td>
				<td><a href="doctorDeletePath?frmDoctorId=${at.studentId}"class="btn btn-block btn-outline-primary btn-sm">Delete</a></td>
				<td><a href="doctorUpdatePath?frmDoctorId=${at.studentId}"class="btn btn-block btn-outline-primary btn-sm">Update</a></td>
			</tr>		
		</c:forEach>
                </tbody>
                <tfoot>
                <tr>
			<th>No</th>
			<th>Student Id</th>
			<th>Student Name</th>
			<th>Roll Number</th>
			<th>Gender</th>
			<th>AcademicYear</th>
			<th>Major</th>
			<th>Grade</th>
			<th>Phone</th>
			<th>Create Date</th>
			<th>Email</th>
            <th>Address</th>
			<th>Address1</th>
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
