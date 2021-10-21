
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
            <h1>Detail Book Information</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Detail Book Information</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->

        	  <div class="col-md-4">
            <!-- Widget: user widget style 2 -->
            <div class="card card-widget widget-user-2">
              <!-- Add the bg color to the header using any of the bg-* classes -->
              <div class="widget-user-header bg-warning">
                <div class="widget-user-image">
                <img class="img-circle elevation-2" src="<c:url value="resources/admin/dist/img/user7-128x128.jpg"/>" alt="User Avatar">
                </div>
                <!-- /.widget-user-image -->
                <h3 class="widget-user-username">Book Id::${saveBookConfrimForm.book.bookId}</h3>
                <h3 class="widget-user-username">Book Name::${saveBookConfrimForm.book.bookName}</h3>
 
              </div>
              <div class="card-footer p-0">
                <ul class="nav flex-column">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                   Edition Name :: ${saveBookConfrimForm.book.bookEdition.editionName}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                   Publisher Date :: ${saveBookConfrimForm.book.publisherDate}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                   Create Date :: ${saveBookConfrimForm.book.createDate}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                    ISBN :: ${saveBookConfrimForm.book.isbn}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                    Qty :: ${saveBookConfrimForm.book.qty}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                    Group Name :: ${saveBookConfrimForm.book.bookGroup.groupName}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                    Group Code :: ${saveBookConfrimForm.book.bookGroup.groupCode}
                     </a>
                  </li>
                 <li class="nav-item">
                 <form:form action="saveBookConfrimSubmitPath">
           
             
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
              <input type="submit" name="cancle"
             class="btn btn-block bg-gradient-primary btn-m" value="Cancle"/>
             </div>
            </div>
 			</form:form> 
                  </li>
                </ul>
              </div>
            </div>
            <!-- /.widget-user -->
           
          </div>

      <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
             <h1>Book Author</h1>
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
           <c:forEach var="at" items="${saveBookConfrimForm.book.bookAuthors}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.author.authorId}</td>
				<td>${at.author.authorName}</td>
				<td><a href="sbcDeleteBookAuthorSubmitPath?frmAuthorId=${at.author.authorId}" class="btn btn-block btn-outline-primary btn-sm">Delete</a></td>
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
             <h1><p>Book Shell</p></h1>
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
           <c:forEach var="at" items="${saveBookConfrimForm.book.bookShells}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.shell.shellId}</td>
				<td>${at.shell.shellNo}</td>
				<td><a href="sbcDeleteBookShellSubmitPath?frmShellId=${at.shell.shellId}" class="btn btn-block btn-outline-primary btn-sm">Delete</a></td>
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
    
    </section>
    <!-- /.content -->
   
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