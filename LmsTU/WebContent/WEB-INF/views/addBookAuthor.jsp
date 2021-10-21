
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
            <h1>Add Book Author </h1>
            <h1>Your Selected Book Groups::</h1>
            <h3>${bookGroupForm.groupName}</h3>

          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Add Book Author</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
         <div class="card card-success">
                <div class="card-header">
                <h3 class="card-title">Add New Author</h3>
              </div>
        <div class="card-body">
          <form:form action="authorRegisterSubmitPath" modelAttribute="authorRegisterForm.authorForm" method="POST" enctype="multipart/form-data" >
              <div class="card-body">
                <div class="row">
        	    <div class="col-md-6">
        	    
        	     <div class="form-group">
				Author Name :
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                 <form:input type="text" id="authorName" path="authorName" name="authorName"  class="form-control"  data-mask="data-mask"  />
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
            </div>
            </div>
      <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
             <h3>Liblary Authors</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
              <thead>
            <tr>
			<th>No</th>
			<th>Author Id</th>
			<th>Author Name</th>
			<th>Select Author</th>
		    </tr>
               </thead>
               <tbody>
            <c:forEach var="at" items="${authorRegisterForm.authors}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.authorId}</td>
				<td>${at.authorName}</td>
				<td><a class="btn btn-block btn-outline-primary btn-sm" href="addBookAuthorSubmitPath?frmAuthorId=${at.authorId}&frmAuthorName=${at.authorName}">Add</a></td>
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
                <h2>Book Author</h2>
                <h4>BookName=${bookForm.bookName}</h4>
                <h4>BookId=${bookForm.bookId}</h4>

            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
            <tr>
			<th>No</th>
			<th>Author Id</th>
			<th>Author Name</th>
			<th>Select Author</th>
		    </tr>
                </thead>
                <tbody>
           <c:forEach var="at" items="${authorForms}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${at.authorId}</td>
				<td>${at.authorName}</td>
				<td><a class="btn btn-block btn-outline-primary btn-sm"  href="deleteBookAuthorSubmitPath?frmAuthorId=${at.authorId}">delete</a></td>
			</tr>		
		   </c:forEach>
              
                </tbody>
                <tfoot>
                </tfoot>
              </table>
            </div>
            
              <div class="card-body">
          <form:form action="goToBookShellPath"  method="POST" enctype="multipart/form-data" >
              <div class="card-body">
                <div class="row">
        	    <div class="col-md-6">
        	    
        	    
                 <div class="form-group">
	             <div class="input-group">
	             <div class="input-group-prepend">
                 <span></span>
                </div>
              <input type="submit" name="next"
             class="btn btn-block bg-gradient-primary btn-m" value="Next"/>
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
