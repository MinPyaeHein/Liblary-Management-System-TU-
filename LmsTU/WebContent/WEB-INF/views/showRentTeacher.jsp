
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
            <h1>All Rent List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active"> Rent List</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
 
      
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
			<th>TeaRent Id</th>
			<th>Admin Name</th>
            <th>Book Id</th>
			<th>Book Name</th>
			<th>Teacher Id</th>
			<th>Teacher Name</th>
			<th>Rent Date</th>
			<th>Return Date</th>
			<th>DueDate</th>
			<th>Late Feet</th>
	        <th>Show Detail</th>
     		</tr>
                </thead>
                <tbody>
              <c:forEach var="at" items="${teacherRegisterForm.rentReturnTeachers}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>RID-${at.teaRentId}</td>
				<td>${at.admin.adminName}</td>
				<td>BID-${at.book.bookId}</td>
				<td>${at.book.bookName}</td>
				<td>TID-${at.teacher.teacherId}</td>
				<td>${at.teacher.teacherName}</td>
				<td>${at.rentDate}</td>
				<td>${at.returnDate}</td>
				<td>${at.dueDate}</td>
				<td>${at.lateFeet}</td>
				<td><a href="returnBookSubmitPath?frmStuRentId=${at.teaRentId}" class="btn btn-block btn-outline-primary btn-sm">Show Detail</a></td>
			</tr>		
		</c:forEach>
        </tbody>
            <tfoot>
           <tr>
 			<th>No</th>
			<th>TeaRent Id</th>
			<th>Admin Name</th>
            <th>Book Id</th>
			<th>Book Name</th>
			<th>Teacher Id</th>
			<th>Teacher Name</th>
			<th>Rent Date</th>
			<th>Return Date</th>
			<th>DueDate</th>
			<th>Late Feet</th>
	        <th>Show Detail</th>
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
