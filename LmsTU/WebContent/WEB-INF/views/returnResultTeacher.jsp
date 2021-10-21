
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
            <h1>Detail Return Information</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin Home</a></li>
              <li class="breadcrumb-item active">Return Book</li>
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
                <h3 class="widget-user-username">User Id::${messageForm.userId}</h3>
                <h3 class="widget-user-username">User Name::${messageForm.userName}</h3>
 
              </div>
              <div class="card-footer p-0">
                <ul class="nav flex-column">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                    Book ID :: ${messageForm.bookId}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                   Rent Date :: ${messageForm.rentDate}
                     </a>
                  </li>
                   <li class="nav-item">
                    <a href="#" class="nav-link">
                   Due Date :: ${messageForm.dueDate}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                   Return Date :: ${messageForm.returnDate}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                    LateFeet :: ${messageForm.lateFeet}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                    LateDay :: ${messageForm.lateDay}
                     </a>
                  </li>
                    <li class="nav-item">
                    <a href="#" class="nav-link">
                   Message :: ${messageForm.message}
                     </a>
                  </li>
                  
                 <li class="nav-item">
                 <form:form action="selectRentBookTeacherPath">
                
              <div class="form-group">
	             <div class="input-group">
	             <div class="input-group-prepend">
                 <span></span>
              </div>
              <input type="submit" name="cancle"
             class="btn btn-block bg-gradient-primary btn-m" value="Exit"/>
             </div>
            </div>
 			</form:form> 
                  </li>
                </ul>
              </div>
            </div>
            <!-- /.widget-user -->
           
          </div>

     
   
    
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
