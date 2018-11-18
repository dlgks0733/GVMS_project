<!-- mis 상세 조회 -->

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
					<h3 class="box-title">MIS 상세 조회</h3>
				</div>
				<div class="box-body">
				<form name="frm" method="post" action="mis?command=mis_view">
					
					<table class="table table-bordered">
						<tr>
							<th>학번</th>
							<th>${stuId}</th>
							<th>이름</th>
							<th>${stuName}</th>
							<th>총점</th>
							<th>${scoreSum}</th>
						</tr>
					</table>
	
					<p>
					
					<table class="table table-bordered">
					
					<tr>
					<td><input type ="checkbox" name="stuId" value=""></td>
					<td>일자</td>
					<td>점수</td>
					</tr>			
						<c:forEach items="${misListRead}" var="MisVO">
							<tr>
								<td><input type ="checkbox" name="stuId" value="${MisVO.stuId}"></td>
								<td>${MisVO.scoreDate}</td>
								<td>3</td>
							</tr>
						</c:forEach>
					</table>
						 <button type="submit" class="btn btn-primary" id="submitbutton">등록</button>
					</form>
							 
				

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
