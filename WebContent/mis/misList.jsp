<!--Mis 리스트 화면 !-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="/include/header.jsp"%>


<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">MIS 출결 목록</h2>
				</div>	
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<form method="get">
							<div class="row">
								<div class="col-md-2 col-xs-4">
									<select class="form-control" name="searchType">
										<option>이름</option>
									</select>
								</div>
								<div  class="col-md-4 col-xs-8">
									<input type="text" class="form-control" placeholder="이름을 입력하세요"
										id="keyword" onkeydown="return enter(event)">
								</div>
							</div>
							</form>
							<br>
						</div>
						
						<table class="table table-bordered" id="user-table">
						<thead>
							<tr>
								<th style="text-align: center;">학번</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">총점</th>
							</tr>
						</thead>

						<c:forEach items="${misList}" var="MisVO">
							<tbody>
								<tr>
									<td style="text-align: center;">${MisVO.stuId}</td>
									<td style="text-align: center;"><a
										href="mis?command=mis_read&stuId=${MisVO.stuId}">${MisVO.stuName}</a></td>
									<td style="text-align: center;">${MisVO.scoreSum}</td>
								</tr>
						</tbody>
						</c:forEach>
					</table>
					
					<div class="box-footer btn-group-right">				
					<a type="button" class="btn btn-default" id="submitbutton"
						href="/mis?command=mis_modify_form" style="float: right">전체수정</a>
					<a type="button" class="btn btn-primary" id="newBtn"
						href="/mis?command=mis_regist_form" style="float: right">신규 등록</a>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</section>



<%-- <section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<form method="get" role="form">
					<div class="box-header with-border">
						<h3 class="box-title" align="center">MIS 출결 목록</h3>
					</div>

					<div class="box-body">
						<div class="col-md-2 col-xs-4">
							<select class="form-control" name="searchType">
								<option>이름</option>
							</select>
						</div>
						<div class="col-md-4 col-xs-8">
							<input type="text" class="form-control" placeholder="이름을 입력하세요"
								id="keyword" onkeydown="return enter(event)">
						</div>

					</div>

					<table class="table table-bordered" id="user-table">
						<thead>
							<tr>
								<th style="text-align: center;">학번</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">총점</th>
							</tr>
						</thead>

						<c:forEach items="${misList}" var="MisVO">
							<tbody>
								<tr>
									<td style="text-align: center;">${MisVO.stuId}</td>
									<td style="text-align: center;"><a
										href="mis?command=mis_read&stuId=${MisVO.stuId}">${MisVO.stuName}</a></td>
									<td style="text-align: center;">${MisVO.scoreSum}</td>
								</tr>
						</tbody>
						</c:forEach>
					</table>


					<a type="button" class="btn btn-default" id="submitbutton"
						href="/mis?command=mis_modify_form" style="float: right">전체수정</a>
					<a type="button" class="btn btn-primary" id="newBtn"
						href="/mis?command=mis_regist_form" style="float: right">신규 등록</a>
				</form>
			</div>
			<!-- <div class="box"> -->
		</div>
		<!-- <div class="col-md-12"> -->
	</div>
	<!-- <div class="row"> -->
</section> --%>


<script>
	//검색기능
	$(document)
			.ready(
					function() {
						$("#keyword")
								.keyup(
										function() {
											var k = $(this).val();
											$("#user-table > tbody > tr")
													.hide();
											var temp = $("#user-table > tbody > tr > td:nth-child(5n+2):contains('"
													+ k + "')");

											$(temp).parent().show();
										})
					})

	//엔터막기	
	function enter(e) {
		if (window.event) {
			key = window.event.keyCode;
		} else if (e) {
			key = e.which;
		}
		if (key == 13) {
			return false
		}
	}
</script>

<%@include file="../include/footer.jsp"%>
