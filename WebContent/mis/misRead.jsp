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
				<form name="frm" method="post" action="mis?command=mis_delete">
					<input type="hidden" name ="stuId" value="${stuId}">
					<input type="hidden" name ="stuName" value="${stuName}">
					<input type="hidden" name ="scoreSum" value="${scoreSum}">
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
					<td><%-- <input type ="checkbox" name="stuId" value="${stuId}"></td> --%>
					<td>일자</td>
					<td>점수</td>
					</tr>			
						<c:forEach items="${misListRead}" var="MisVO">
							<tr>
								<td><input type ="checkbox" name="scoreDate" value="${MisVO.scoreDate}"></td>
								<td>${MisVO.scoreDate}</td>
								<td>3</td>
							</tr>
						</c:forEach>
					</table>
						 <button type="submit" class="btn btn-danger" id="submitbutton">삭제</button>
						 
						 <%-- <a type="button" class="btn btn-danger" href="mis?command=mis_delete&stuId=${stuId}&stuName=${stuName}">삭제</a> --%>
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
