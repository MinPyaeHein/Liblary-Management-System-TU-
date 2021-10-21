
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
            <h1>Update Book>>Step(2)</h1>
            <h1> Book Groups=${bookGroup.groupName}</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Update Book</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
 
      <form:form action="updateBookSubmitPath2" >
       <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
             <h1> Book Types</h1>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
            <tr>
			<th>No</th>
			<th>Type Id</th>
			<th>Type Name</th>
			<th>Type Code</th>
			<th>Delete Type</th>
		    </tr>
                </thead>
                <tbody>
            <c:forEach var="at" items="${bookTypes}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.type.typeId}</td>
				<td>${at.type.typeName}</td>
				<td>${at.type.typeCode}</td>
				<td><a class="btn btn-block btn-outline-primary btn-sm" href="updDeleteBookTypeSubmitPath?frmTypeId=${at.type.typeId}">Delete</a></td>
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
    
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
             <h1> Book Author</h1>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
            <tr>
			<th>No</th>
			<th>Author Id</th>
			<th>Author Name</th>
			<th>Delete Author</th>
		    </tr>
                </thead>
                <tbody>
            <c:forEach var="at" items="${bookAuthors}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.author.authorId}</td>
				<td>${at.author.authorName}</td>
				<td><a class="btn btn-block btn-outline-primary btn-sm" href="updDeleteBookAuthorSubmitPath?frmAuthorId=${at.author.authorId}">Delete</a></td>
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
     <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
             <h1> Book Shell</h1>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
            <tr>
			<th>No</th>
			<th>Shell Id</th>
			<th>Shell No</th>
			<th>Delete shell</th>
		    </tr>
                </thead>
                <tbody>
            <c:forEach var="at" items="${bookShells}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.shell.shellId}</td>
				<td>${at.shell.shellNo}</td>
				<td><a class="btn btn-block btn-outline-primary btn-sm" href="updDeleteBookShellSubmitPath?frmShellId=${at.shell.shellId}">Delete</a></td>
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
       <div class="form-group">
	             <div class="input-group">
	             <div class="input-group-prepend">
                 <span></span>
                    </div>
              <input type="submit" name="update"
             class="btn btn-block bg-gradient-primary btn-m" value="Update"/>
             </div>
       </div>
      <!-- /.row -->
    </section>
    
    </form:form>
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
