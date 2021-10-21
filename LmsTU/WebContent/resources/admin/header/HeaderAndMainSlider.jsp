
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<c:url value="resources/admin/dist/img/AdminLTELogo.png"/>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Library <c:choose>
                                       <c:when test="${idType=='id'}"> Admin</c:when>
                                       <c:when test="${idType=='sid'}">Student</c:when>
                                       <c:when test="${idType=='tid'}">teacher</c:when>
                                      </c:choose>
                                       </span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        
        <div class="info">
        <c:choose>
        <c:when test="${idType!=null}">
          <a href="#" class="d-block">${login.userId}</a>
          <a href="#" class="d-block">${login.userName}</a>
          </c:when>
          <c:when test="${idType==null}">  
          <a href="#" class="d-block">Unknow User</a>
          </c:when>
          </c:choose>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="userLoginPath" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p> User Home</p>
                </a>
              </li>
             
            </ul>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="logoutPath" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>LogOut</p>
                </a>
              </li>
             
            </ul>
          </li>
           <c:choose>
          <c:when test="${idType=='sid'}">
            <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
               Show Data Table
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="showRentStudentPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Show Rent Book        
              </p>
            </a>
          </li>
           
           <li class="nav-item">
            <a href="showReturnStudentPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Show Return Book        
              </p>
            </a>
          </li>
           
           <li class="nav-item">
            <a href="showDetailStudentPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Show User Detail       
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="saveBookConfrimSubmitPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Book
              </p>
            </a>
          </li>
          
          <li class="nav-item">
         
          </ul>
          </li>
           
          </c:when>
          </c:choose>
       
             <c:choose>
          <c:when test="${idType=='tid'}">
            <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
               Show Data Table
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="showRentTeacherPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Show Rent Book        
              </p>
            </a>
          </li>
             <li class="nav-item">
            <a href="showReturnTeacherPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Show Return Book        
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="saveBookConfrimSubmitPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Book
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="showDetailTeacherPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
            Show User Detail
              </p>
            </a>
          </li>
          </ul>       
          </li>
          
          </c:when>
          </c:choose>
          <c:choose>
          <c:when test="${idType=='id'}">
           <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
               Rent Return Book Student
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="rentBookPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Rent Book        
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="returnLoginPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Return Book        
              </p>
            </a>
          </li>
          </ul>
          </li>
           <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
               Rent Return Book Teacher
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="teacherRentLoginPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Rent Book        
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="teacherReturnLoginPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Return Book        
              </p>
            </a>
          </li>
          </ul>
          </li>
          
           <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
               User Register Pages
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="majorRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
                Major Register            
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="greadRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Grade Register           
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="academicYearRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Academic Year Register          
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="memberRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Member Register        
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="positionRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Position Register
              </p>
            </a>
          </li>
             <li class="nav-item">
            <a href="departmentRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Department Register
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="roleRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Role Register
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="adminRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Admin Register
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="studentRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
                Student Register              
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="teacherRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Teacher Register
              </p>
            </a>
          </li>
          </ul>
          </li>
          
           <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
               Book Register Pages
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="selectBookGroupPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
                Book Register
               
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="bookEditionRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Book Edition Register          
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="bookGroupRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
                Book Group Register               
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="typeRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
               Type Register        
              </p>
            </a>
          </li>
          
           <li class="nav-item">
            <a href="authorRegisterPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Author Register     
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="addBookAuthorPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
             Add Book Author    
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="saveBookConfrimSubmitPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Book
              </p>
            </a>
          </li>
          </ul>
          </li>
             <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
              Show Data Table
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
           <li class="nav-item">
            <a href="saveBookConfrimSubmitPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Book
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="showAllRentPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Return List
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="showAllReturnPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Rent List
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="showAllStudentPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Student
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="showAllTeacherPath" class="nav-link">
              <i class="far fa-circle nav-icon"></i>
              <p>
              Show All Teacher
              </p>
            </a>
          </li>
          </ul>
         </li>
         </c:when>
         </c:choose> 
          <li class="nav-header">Extra Functions</li>
          <li class="nav-item">
            <a href="pages/calendar.html" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
                Calendar
                <span class="badge badge-info right">2</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="pages/gallery.html" class="nav-link">
              <i class="nav-icon far fa-image"></i>
              <p>
                Gallery
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Mailbox
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/mailbox/mailbox.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inbox</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/mailbox/compose.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Compose</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/mailbox/read-mail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Read</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-book"></i>
              <p>
                Pages
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/examples/invoice.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Invoice</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/profile.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/e_commerce.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>E-commerce</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/projects.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Projects</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/project_add.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Add</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/project_edit.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Edit</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/project_detail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Detail</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/contacts.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Extras
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/examples/login.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Login</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/register.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Register</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/forgot-password.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Forgot Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/recover-password.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Recover Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/lockscreen.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Lockscreen</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/legacy-user-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Legacy User Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/language-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Language Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/404.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 404</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/500.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 500</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/pace.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pace</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/blank.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Blank Page</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="starter.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Starter Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">MISCELLANEOUS</li>
          <li class="nav-item">
            <a href="https://adminlte.io/docs/3.0" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>Documentation</p>
            </a>
          </li>
          <li class="nav-header">MULTI LEVEL EXAMPLE</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
                Level 1
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
              <li class="nav-item has-treeview">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Level 2
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-danger"></i>
              <p class="text">Important</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

