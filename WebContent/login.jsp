<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- Meta Tags -->
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="description" content="StudyPress | Education & Courses HTML Template" />
<meta name="keywords" content="academy, course, education, education html theme, elearning, learning," />
<meta name="author" content="ThemeMascot" />

<!-- Page Title -->
<title>관리자 로그인</title>

<!-- Favicon and Touch Icons -->
<link href="../resources/images/favicon.png" rel="shortcut icon" type="image/png">
<link href="../resources/images/apple-touch-icon.png" rel="apple-touch-icon">
<link href="../resources/images/apple-touch-icon-72x72.png" rel="apple-touch-icon" sizes="72x72">
<link href="../resources/images/apple-touch-icon-114x114.png" rel="apple-touch-icon" sizes="114x114">
<link href="../resources/images/apple-touch-icon-144x144.png" rel="apple-touch-icon" sizes="144x144">

<!-- Stylesheet -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../resources/css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<link href="../resources/css/animate.css" rel="stylesheet" type="text/css">
<link href="../resources/css/css-plugin-collections.css" rel="stylesheet"/>
<!-- CSS | 로그인 폼을 위한 스타일 -->
<link href="../resources/admin/login.css" rel="stylesheet"/>
<!-- CSS | menuzord megamenu skins -->
<link id="menuzord-menu-skins" href="../resources/css/menuzord-skins/menuzord-rounded-boxed.css" rel="stylesheet"/>
<!-- CSS | Main style file -->
<link href="../resources/css/style-main.css" rel="stylesheet" type="text/css">
<!-- CSS | Preloader Styles -->
<link href="../resources/css/preloader.css" rel="stylesheet" type="text/css">
<!-- CSS | Custom Margin Padding Collection -->
<link href="../resources/css/custom-bootstrap-margin-padding.css" rel="stylesheet" type="text/css">
<!-- CSS | Responsive media queries -->
<link href="../resources/css/responsive.css" rel="stylesheet" type="text/css">
<!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
<!-- <link href="css/style.css" rel="stylesheet" type="text/css"> -->

<!-- CSS | Theme Color -->
<link href="../resources/css/colors/theme-skin-color-set-1.css" rel="stylesheet" type="text/css">

<!-- external javascripts -->
<script src="../resources/js/jquery-2.2.4.min.js"></script>
<script src="../resources/js/jquery-ui.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="../resources/js/jquery-plugin-collection.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="">
<c:if test="${sessionScope.login.adminId ne null}">
	<% 
	/*
		이미 로그인 세션이 존재하면
		관리자 메인 화면으로 이동
	*/
	response.sendRedirect("/admin/main"); 	
	%>
</c:if>
<div id="wrapper" class="clearfix">
  <!-- preloader -->
  <div id="preloader">
    <div id="spinner">
      <div class="preloader-dot-loading">
        <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
      </div>
    </div>
    <div id="disable-preloader" class="btn btn-default btn-sm">Disable Preloader</div>
  </div> 
  
  <!-- start main-content -->
  <div class="main-content"> 
    <!-- Section: home -->
    <section id="home" class="divider fullscreen bg-lighter">
      <div class="display-table">
        <div class="display-table-cell">
          <div class="container">
            <div class="row">
              <div class="col-md-6 col-md-push-3">
                <div class="text-center mb-60"><a href="/" class=""><img alt="" src="../resources/images/logo1.png"></a></div>
                <h4 class="text-theme-colored mt-0 pt-10 line-bottom"> 관리자 로그인</h4>
                <hr>
                <form name="login-form" onsubmit="return validateEmptyVal()" role="form" class="clearfix" method="post" action="loginPost">
                  <div class="row">
                    <div class="form-group col-md-12">
                      <label for="form_username_email">아이디</label>
                      <input id="form_username_email"  name="adminid" class="form-control" type="text">
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-12">
                      <label for="form_password">비밀번호</label>
                      <input id="form_password" name="adminpw" class="form-control" type="password">
                    </div>
                  </div>
                  <div class="clear text-center pt-10">
                    <button type="submit" class="btn btn-dark btn-lg btn-block no-border mt-15 mb-15" href="#" data-bg-color="#3b5998">
                    	관리자 계정으로 로그인
                    </button>
                    <a class="btn btn-dark btn-lg btn-block no-border" href="/">
                    	<i class="fa fa-home"></i>
                    	홈으로 돌아가기
                    </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- end main-content -->

<!-- Footer -->
  <footer id="footer" class="footer text-center bg-lighter">
    <div class="container pt-10 pb-10">
      <div class="row">
        <div class="col-md-12">
          <p class="mb-0">Copyright ©2018 HanBitChan. All Rights Reserved</p>
        </div>
      </div>
    </div>
  </footer>
  <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
</div>
<!-- end wrapper -->

<!-- Footer Scripts -->
<!-- JS | Custom script for all pages -->
<script src="../resources/js/custom.js"></script>
<!-- 유효성검사 -->
<script>

function validateEmptyVal()
{
	if (document.getElementsByName("adminid")[0].value == "")
	{
		alert("아이디를 입력해주세요");
		document.getElementsByName("adminid")[0].focus();
		return false;
	}
	if (document.getElementsByName("adminpw")[0].value == "")
	{
		alert("비밀번호를 입력해주세요");
		document.getElementsByName("adminpw")[0].focus();
		return false;
	}
	
	return true;
}
</script>

</body>


</html> --%>

/////////////////////////////////////////////////////////////


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<%-- <c:if test="${sessionScope.stuLogin.stuid ne null}">
	<% 
	/*
		이미 로그인 세션이 존재하면
		관리자 메인 화면으로 이동
	*/
	response.sendRedirect("admin/login.jsp"); 	
	%>
</c:if>


 --%>
<!-- Start main-content -->
<div class="main-content">
	<!-- Section: inner-header -->
	<section
		class="inner-header divider parallax layer-overlay overlay-dark-5"
		data-bg-img="/resources/images/courseapply.jsp.jpg">
		<div class="container pt-70 pb-20">
			<!-- Section Content -->
			
		</div>
	</section>

</div>

<!-- Section: Course list -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-9 blog-pull-right">
		        <div class="display-table-cell">
		          <div class="container">
		            <div class="row">
		              <div class="col-md-6 col-md-push-1">
		                <h4 class="text-theme-colored mt-0 pt-10 line-bottom"> 관리자 로그인</h4>
		                <hr>
			 <form class="form" name="fm" method=post action = "/adminLogin.do">
			 <input type="hidden" name="command" value="login">
                   <div class="form-group">
                    <input type="text" class="form-control" id="inputId" name="adminid" placeholder="아이디">
                    </div>
                    <div class = "form-group">
                    <input type="password" class="form-control" id="inputPw" name="adminpw" placeholder="비밀번호">
                    </div>
                    
                    <div class = "row">
                   <div class="col-lg-12">
                   <button type="submit"class="btn btn-primary btn-block btn-lg" value="login">
                   	로그인</button>

                   </div>
                   </div>
                   <br>
                   <p>
                      <a href = "#" data-toggle = "tooltip" 
                         data-placement = "bottom"
                         title = "초기 비밀번호 - 0000">
                         비밀번호를 잊어버리셨나요?
                      </a>
                      <br>
                      <span>문의 : 042)000-0000 (관리자)</span>
                      <script>
                         $(document).ready(function(){
                             $('[data-toggle="tooltip"]').tooltip(); 
                         });
                      </script>
                      <br><br>
                   </p>  
         </form>
		                




		</div>
	</div>
</section>
</div>
<!-- end main-content -->

	<script>
		$(document).ready(
				function() {

					$('#btn-default').on(
							"click",
							function(event) {

								self.location = "center"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();

							});

				});
	</script>

	<%@include file="../include/footer.jsp"%>
