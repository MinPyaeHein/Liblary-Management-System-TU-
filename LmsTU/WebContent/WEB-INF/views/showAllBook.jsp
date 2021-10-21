
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
        <div class="row mb-25">
          <div class="col">
            <h1>Show All Book</h1>
          </div>
          <div class="col-sm-25">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Show All Book</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
 
      
       <section class="content">
      <div class="row">
        <div class="col-15">
          <div class="card">
            <div class="card-header">
             
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
            <tr>
			<th>No</th>
			<th>Book Id</th>
			<th>Book Name</th>
			<th>Book Group</th>
			<th>Book Types</th>
			<th>Book Author</th>
			<th>Book Edition</th>
			<th>Create Date</th>
			<th>Qty</th>
			<th>ISBN</th>
			<th>Publisher Date</th>
			<th>Show Detail</th>
			<th>Delete</th>
			<th>Update</th>
		    </tr>
                </thead>
                <tbody>
             <c:forEach var="at" items="${saveBookConfrimForm.books}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>BID-${at.bookId}</td>
				<td>${at.bookName}</td>
				<td>${at.bookGroup.groupName}</td>
				<td>
				  <c:forEach var="bt" items="${at.bookTypes}" varStatus="s">
				  ${bt.type.typeName}:
				  </c:forEach>
				</td>
				<td>
				 <c:forEach var="ba" items="${at.bookAuthors}" varStatus="s">
				  ${ba.author.authorName}:
				  </c:forEach>
				</td>
				<td>${at.bookEdition.editionName}</td>
				<td>${at.createDate}</td>
				<td>${at.qty}</td>
				<td>${at.isbn}</td>
				<td>${at.publisherDate}</td>
				<td><a href="bookShowDetailSubmitPath?frmBookId=${at.bookId}" class="btn btn-block btn-outline-primary btn-sm">Show Detail</a></td>
				<td><a href="bookDeleteSubmitPath?frmBookId=${at.bookId}" class="btn btn-block btn-outline-primary btn-sm">Delete</a></td>
				<td><a href="updateBookPath?frmBookId=${at.bookId}" class="btn btn-block btn-outline-primary btn-sm">Update</a></td>
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
