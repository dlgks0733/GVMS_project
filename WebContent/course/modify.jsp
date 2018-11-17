<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript">
	//AJAX select box
	function compSelect(compname) {
		$.ajax({
			type : "POST",
			url : "testSelect",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : {
				param : compname
			},
			success : function(result) {

				//SELECT BOX 초기화           
				$("#empnum").find("option").remove().end().append(
						"<option value=''>선택</option>");

				//배열 개수 만큼 option 추가
				$.each(result, function(i) {
					$("#empnum").append(
							"<option value='"+result[i].empnum +"'>"
									+ result[i].empname + "</option>")
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류가 발생하였습니다.");
			}
		});
	}
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">과목 수정</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" onsubmit="return validateEmptyVal()" action="modify"  class="form-horizontal">
					<div class="box-body box-form-custom">
						<input type='hidden' name="cournum" value="${courseDTO.cournum}">
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								과정명
								<span class="must-mark">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" name="courname" class="form-control"
									placeholder="긴 입력용" value="${courseDTO.courname }">
							</div>
						</div>
						<div class="form-group input-double">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								담당 선생님
								<span class="must-mark">*</span>
							</label>
							<div class="col-sm-3">
								<select name="compno" class="form-control"
									onchange="compSelect(this.value)">
									<c:forEach var="list" items="${list}">
										<c:if test="${list.compnum eq courseDTO.compnum }">
											<option value="${list.compname}" selected="selected">${list.compname}</option>
										</c:if>
										<c:if test="${list.compnum ne courseDTO.compnum }">
											<option value="${list.compname}">${list.compname}</option>
										</c:if>
									</c:forEach>
								</select>

							</div>
							<div class="col-sm-7">
								<select id="empnum" name="empnum" class="form-control">
									<c:forEach var="list" items="${empList}">
										<c:if test="${list.compname eq courseDTO.compname }">
											<option value="${list.empnum }" selected="selected">${list.empname }</option>
										</c:if>
										<c:if test="${list.compname ne courseDTO.compname }">
											<option value="${list.empnum }">${list.empname }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

				</form>
					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-danger">삭제</button>
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="submit" class="btn btn-cancel">취소</button>
					</div>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);
		
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/admin/course/remove");
			formObj.submit();
		});
		
		$(".btn-cancel")
				.on("click",function() {
					self.location = "/admin/course/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
	
// 유효성 체크
function validateEmptyVal()
{
	if (document.getElementsByName("courname")[0].value == "")
	{
		alert("과목 이름을 입력해주세요");
		document.getElementsByName("courname")[0].focus();
		return false;
	}
	if (document.getElementsByName("compno")[0].value == "")
	{
		alert("기관을 선택해주세요");
		document.getElementsByName("compno")[0].focus();
		return false;
	}
	if (document.getElementsByName("empnum")[0].value == "")
	{
		alert("강사를 선택해주세요");
		document.getElementsByName("empnum")[0].focus();
		return false;
	}
	
	return true;
}
</script>




<%@include file="../include/footer.jsp"%>
