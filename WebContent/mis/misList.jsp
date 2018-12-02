<!--Mis 리스트 화면 !-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="/include/header.jsp"%>

<!-- Main content -->
	<style>
	
		#container {width: 960px; margin: 0 auto;}
        #container #input-form {text-align: left;}
        #user-table {margin: 0 auto; text-align: center;}
        #input-form {margin-top: 10px; margin-bottom: 10px;}

        #user-table {border-collapse: collapse;}
        #user-table > thead > tr { background-color: #333; color:#fff; }
        #user-table > thead > tr > th { padding: 8px; width: 150px; }
        #user-table > tbody > tr > td { border-bottom: 1px solid gray; padding:8px; }
	</style>

<section class="content">
	
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title" align = "center">MIS 점수 조회 목록</h3>
				</div>
				<div class="box-body">
					<div id="container">
					<div id="input-form">
					<b>	학생 검색 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b> <input type="text" id="keyword">
					</div>
					<div style="overflow-y: scroll; height:400px;">	
					<table class="table table-bordered" id="user-table">
						<thead>
						<tr>
							<th style="text-align : center;">학번</th>
							<th style="text-align : center;">이름</th>
							<th style="text-align : center;">총점</th>
						</tr>
						</thead>
						
						<c:forEach items="${misList}" var="MisVO">
							<tbody>
							<tr>
								<td>${MisVO.stuId}</td>
								<td><a href="mis?command=mis_read&stuId=${MisVO.stuId}">${MisVO.stuName}</a></td>
								<td>${MisVO.scoreSum}</td>
							</tr>

						</c:forEach>
							</tbody>
					</table>
					</div>
					<br>
					
					<a type="button" class="btn btn-primary btn-modify" id="submitbutton" href="/mis?command=mis_modify_form" style = "float : right">전체수정</a>
					<a type="button" class="btn btn-default" id="newBtn" href="/mis?command=mis_regist_form" style = "float : right">신규 등록</a>

					</div>
				</div>
				<!-- /.box-body -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->

<script>

	$(document).ready(function() {
		$("#keyword").keyup(function(){
			var k = $(this).val();
			$("#user-table > tbody > tr").hide();
			var temp = $("#user-table > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
			
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
