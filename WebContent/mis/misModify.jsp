<!--Mis 전체 수정 화면 !-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="/include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">MIS 전체 수정 화면</h3>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<form name="frm" method="post" action="/mis?command=mis_modify">
								<div class="row">
									<div class="col-md-2 col-xs-4">
										<select class="form-control" name="searchType">
											<option>이름</option>
											<!-- <option>학번</option> -->
										</select>
									</div>
									<div class="col-md-4 col-xs-8">
										<input type="text" class="form-control" placeholder="입력하시오" id="keyword" onkeydown="return enter(event)">
									</div>
									<div class="row">
										<input type="date" name="startDate"> &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
										<input type="date" name="endDate">
										<a href="mis?command=mis_modify_select_from" type="button" class="btn btn-default" >검색</a>
										<table class="table table-bordered" id="user-table">
											<thead>
											<tr>
												<th>no</th>
												<th>학번</th>
												<th>이름</th>
												<th>날짜</th>
												<th>수정날짜</th>
											</tr>
											</thead>
											
											<c:forEach items="${misModifyList}" var="MisVO">
												<tbody>
												<tr>
													<td><input type="checkbox" name="scoreId"
														value="${MisVO.scoreId}"></td>
													<td>${MisVO.stuId}</td>
													<td>${MisVO.stuName}</td>
													<td>${MisVO.scoreDate}</td>
													<td><input type="date"
														name="scoreDate_${MisVO.scoreId}"
														value="${MisVO.scoreDate}"></td>
												</tr>
												</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
								<a href="/mis?command=mis_list_form" type="button" class="btn btn-default" style = "float : right">취소</a>
								<button type="submit" class="btn btn-primary" style = "float : right">수정</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->

<script>
/* //학번 검색기능
$(document).ready(function() {
	$("#keyword").keyup(function(){
		var k = $(this).val();
		$("#user-table > tbody > tr").hide();
		var temp = $("#user-table > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
		
		$(temp).parent().show();
	})
}) */

//이름 검색기능
$(document).ready(function() {
	$("#keyword").keyup(function(){
		var k = $(this).val();
		$("#user-table > tbody > tr").hide();
		var temp = $("#user-table > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
		
		$(temp).parent().show();
	})
})

//엔터막기	
function enter(e){
	if(window.event){
		key = window.event.keyCode;
	}else if(e){
		key = e.which;
	}
	if(key==13){
		return false    
	}
}



</script>

<%@include file="../include/footer.jsp"%>
