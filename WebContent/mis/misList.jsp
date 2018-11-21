<!--Mis 리스트 화면 !-->

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
					<h3 class="box-title">MIS 점수 조회 목록</h3>
				</div>
				<div class="box-body">
					<h4>
						이름 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text"> <input
							type="submit" value="검색">
						
					</h4>
					<table class="table table-bordered">
						<tr>
							<th>학번</th>
							<th>이름</th>
							<th>총점</th>
						</tr>


						<c:forEach items="${misList}" var="MisVO">

							<tr>
								<td>${MisVO.stuId}</td>
								<td><a href="mis?command=mis_read&stuId=${MisVO.stuId}
								&stuName=${MisVO.stuName}&scoreSum=${MisVO.scoreSum}">${MisVO.stuName}</a></td>
								<td>${MisVO.scoreSum}</td>
							</tr>

						</c:forEach>
					</table>
					<a type="button" class="btn btn-danger" id="submitbutton" href="/mis?command=mis_modify_form">전체수정</a>

				</div>
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
