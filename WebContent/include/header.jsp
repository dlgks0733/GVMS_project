<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>졸업인증관리시스템 관리자모드</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="../resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../resources/admin/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../resources/admin/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- CUSTOM STYLE | Created  by. KAYH -->
    <link href="../resources/admin/custom.css" rel="stylesheet" type="text/css" />
    <!-- CSS | Preloader Styles -->
	<link href="../resources/css/preloader.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
     <!-- jQuery 2.1.4 -->
    <script src="../resources/admin/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="../resources/js/jquery-ui.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	
	<!-- JS | jquery plugin collection for this theme -->
	<script src="../resources/js/jquery-plugin-collection.js"></script>
    
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">
    
    <!-- preloader -->
	  <div id="preloader">
	    <div id="spinner">
	      <div class="preloader-dot-loading">
	        <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
	      </div>
	    </div>
	    <div id="disable-preloader" class="btn btn-default btn-sm">Disable Preloader</div>
	  </div> 
	      
      <header class="main-header">
        <!-- Logo -->
        <a href="/main?command=main" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>MIS</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg">졸업인증관리시스템 <b>관리자모드</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->

              <!-- Notifications: style can be found in dropdown.less -->
           
              <!-- Tasks: style can be found in dropdown.less -->

              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="../resources/admin/dist/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">${login.adminName}님 반갑습니다.</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="../resources/admin/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p>
                      ${login.adminName}
                      <small>${login.adminEmail}</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="../resources/admin/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>${login.adminName}</p>
              <a class="btn-logout" href="#"><i class="fa fa-power-off"></i> 로그아웃</a>
            </div>
          </div>
          <!-- search form -->
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">관리자 메뉴</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i><!-- fa-files-o -->
               <span>학생졸업인증점수 관리</span> <i class="fa fa-angle-left pull-right"></i>
               <!--  <span class="label label-primary pull-right">4</span> -->
              </a>
              <ul class="treeview-menu">
                <li><a href="score?command=scoreListForm"><i class="fa fa-magic"></i> 졸업인증점수 조회</a></li>
                <li><a href="score?command=scoreListRegForm"><i class="fa fa-magic"></i> 졸업인증점수 등록</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-table"></i>
                <span>MIS 정보관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="mis?command=mis_list_form"><i class="fa fa-magic"></i> MIS 출결 조회</a></li>
                <li><a href="mis?command=mis_regist_form"><i class="fa fa-magic"></i> MIS 출결 등록</a></li>
                
               <%-- <li><a href="/admin/eventBoard/list"><i class="fa fa-magic"></i> 이벤트 목록</a></li>
                <li><a href="/admin/videoBoard/list"><i class="fa fa-magic"></i> 동영상 목록</a></li>
                --%>
                
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-book"></i> <span>기초정보관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="student?command=studentListForm"><i class="fa fa-magic"></i> 학생 목록</a></li>
                <li><a href="subject?command=subList"><i class="fa fa-magic"></i> 인증평가 목록</a></li>
              </ul>
             </li>
             <%-- 
             <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i>
                <span>수강 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/admin/course/list"><i class="fa fa-magic"></i> 과목 목록</a></li>
                <li><a href="/admin/apply/list"><i class="fa fa-magic"></i> 수강 목록</a></li>
              </ul>
            </li>
            --%>
            <%-- 
            <li class="treeview">
              <a href="#">
                <i class="fa fa-archive"></i> <span>기초정보관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/admin/company/list"><i class="fa fa-magic"></i> 기관 목록</a></li>
                <li><a href="/admin/user/list"><i class="fa fa-magic"></i> 관리자 목록</a></li>
                <li><a href="/admin/emp/list"><i class="fa fa-magic"></i> 직원 목록</a></li>
                <li><a href="/admin/student/list"><i class="fa fa-magic"></i> 학원생 목록</a></li>
                <li><a href="/admin/mainLink/list"><i class="fa fa-magic"></i> 메인 링크 목록</a></li>
              </ul>
             </li>
             --%>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
			<i class="fa fa-cogs"></i> 관리자 화면        
          </h1>
        </section>
        
        <script>
        	$(document).ready( function() {
        		$(".btn-logout").on("click", function(){
        			
        			var ok = confirm("정말 로그아웃 하시겠습니까?");
        			if (ok == true) {
        				self.location = "/admin/logout";
        			} else {
        				return false;
        			}
        			  
        		});
        	});
        </script>