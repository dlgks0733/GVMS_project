<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/login.css" rel="stylesheet">
<link href="/resources/css/all.css" rel="stylesheet">
<script type = "text/javascript" src="/resources/js/jquery-2.2.4.min.js"></script>
<script type = "text/javascript" src="/resources/js/bootstrap.min.js"></script>
<title>로그인 :: 졸업인증관리시스템</title>
</head>
<body>	
<div class ="login_form">
	<div class = "starter-template">
		<div class = "logo" style="text-align: center;">
		<img src = "/resources/images/login1.PNG">
		<h3>졸업인증관리시스템</h3>
		</div>
			<c:if test = "${message ne null}">
			<div class="alert alert-info alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  ${message}
			</div>
			</c:if>	
			<c:if test = "${param.session eq 'no'}">
			<div class="alert alert-warning alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  세션이 만료되었습니다. 다시 로그인해주세요.
			</div>
			</c:if>	
		<p class = "lead">
			<form class="form" name="fm" method=post action = "main?command=login">
                   <div class="form-group">
                    <input type="text" class="form-control" id="inputId" name="adminId" placeholder="아이디">
                    </div>
                    <div class = "form-group">
                    <input type="password" class="form-control" id="inputPw" name="adminPw" placeholder="비밀번호">
                    </div>
                    
                    <div class = "row">
                	<div class="col-lg-12">
                		<button class="btn btn-primary btn-block btn-lg">로그인</button>	
                	</div>
                	</div>
                	<br>
                	<div class = "logo" style="text-align: center;">
                	<p>
	                	<a href = "#" data-toggle = "tooltip" data-placement = "bottom" title = "초기 비밀번호 - 0000">비밀번호를 잊어버리셨나요?</a>
	                	<br>
	                	<span>문의 : 042)969-3333 (관리자)</span>
	                	<script>
		                	$(document).ready(function(){
		                	    $('[data-toggle="tooltip"]').tooltip(); 
		                	});
	                	</script>
	                	<br><br>
                	</p>
                	</div>
   	   </form>
	</div>
</div>
</body>
</html>
