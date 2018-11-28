<!-- mis 등록 화면 -->

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
					<h3 class="box-title">MIS 출결 등록</h3>
				</div>
				<div class="box-body">
				<form name="frm" method="post" action="mis?command=mis_regist" onsubmit="return validateEmptyVal()">
					*날짜 <input type="date" name="scoreDate" >
					<div style="overflow-y: scroll; height:400px;">	
					<table class="table table-bordered">
						<tr>
							<th><input type ="checkbox" name="stuIdAll" /></th>
							<th>학번</th>
							<th>이름</th>
						</tr>

						<c:forEach items="${misListRegist}" var="MisVO">
							<tr>
								<td><input type ="checkbox" name="stuId" value="${MisVO.stuId}"/></td>
								<td>${MisVO.stuId}</td>
								<td>${MisVO.stuName}</td>
							</tr>
						</c:forEach>
					</table>
					</div>
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

$("input[name=stuIdAll]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='stuId']").prop("checked", true);
	} else{
		$("input[name='stuId']").prop("checked", false);
	}
});

function validateEmptyVal()
{
	if (document.getElementsByName("scoreDate")[0].value == "")
	{
		alert("날짜를 입력하시오.");
		document.getElementsByName("scoreDate")[0].focus();
		return false;
	}
	return true;
} 

	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<%@include file="../include/footer.jsp"%>
