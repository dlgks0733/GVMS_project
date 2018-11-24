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
				
				<form name="frm" method="post" action="/mis?command=mis_modify">
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>no</th>
							<th>학번</th>
							<th>이름</th>
							<th>날짜</th>
						</tr>
					<c:forEach items="${misModifyList}" var="MisVO">
						<tr>
							<td> <input type="checkbox" name="scoreId" value="${MisVO.scoreId}" ></td>
							<td>${MisVO.stuId}</td>
							<td>${MisVO.stuName}</td>
							<td> <input type="date" name="scoreDate" value="${MisVO.scoreDate}" ></td>
						</tr>
					</c:forEach>
					</table>
				</div>
				<button type="submit" class="btn btn-primary">수정</button>
	</form>
	
	
				<!-- /.box-body -->
				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<%@include file="../include/footer.jsp"%>
