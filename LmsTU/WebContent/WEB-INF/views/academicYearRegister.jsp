
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
            <h1>Academic Year Register</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Academic Year Register</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
 
        <div class="card-body">
          <form:form action="academicYearRegisterSubmitPath" modelAttribute="academicYearRegisterForm.academicYearForm" method="POST" enctype="multipart/form-data" >
      
	       
              <div class="card-body">
             <div class="row">
        	<div class="col-md-6">
       	    <div class="form-group">
				Start Year :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="startYear" path="startYear" name="startYear"  class="form-control"  data-mask="data-mask" placeholder="dd/MM/yyyy"/>
                  </div>
         		 </div>
         		 <div class="form-group">
				End Year :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="endYear" path="endYear" name="endYear"  class="form-control"  data-mask="data-mask" placeholder="dd/MM/yyyy"/>
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
              <input type="submit" name="finish"
             class="btn btn-block bg-gradient-primary btn-m" value="Finish"/>
             </div>
            </div>
          </div>
		  </div>
		  </div> 
            
              </form:form>
             
                <!-- /.form-group -->
              
              <!-- /.col -->
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
    
                  <th>No#</th>
                  <th>Year-Id</th>
                  <th>Start Year</th>
                  <th>End year</th>
                  <th>Delete</th>
			      <th>Update</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="at" items="${academicYearRegisterForm.academicYears}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.yearId}</td>
				<td>${at.startYear}</td>
				<td>${at.endYear}</td>
				<td><a href="addBookTypeSubmitPath?frmTypeId=${at.yearId}" class="btn btn-block btn-outline-primary btn-sm">Delete</a></td>
				<td><a href="addBookTypeSubmitPath?frmTypeId=${at.yearId}" class="btn btn-block btn-outline-primary btn-sm">Update</a></td>
			</tr>		
		      </c:forEach>
                </tbody>
                <tfoot>
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
