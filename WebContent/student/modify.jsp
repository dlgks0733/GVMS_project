<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">학생 수정</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" action="student?command=stud_modify"
					class="form-horizontal" onsubmit="return validateEmptyVal()">
					<input type="hidden" name="validation">
					<div class="box-body box-form-custom">
						<div class="form-group input-short"></div>
					</div>

					<!-- 필수항목 학번 입력 -->
					<div class="form-group input-short">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">
							학번 <span class="must-mark">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" name='stuId' class="form-control"
								placeholder="학번을 입력해주세요" value="${stuId}" readonly="readonly">
							<span id="validatePwEmailMessage"></span>
						</div>
					</div>




					<!-- 필수항목 이름 입력 -->
					<div class="form-group input-short">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">
							이름 <span class="must-mark">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" name='stuName' class="form-control"
								placeholder="이름을 입력해주세요" value="${stuName}"> <span
								id="validatePwEmailMessage"></span>
						</div>
					</div>


					<!-- 필수항목 재적상태 입력 -->
					<div class="form-group input-short">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">
							재학상태 <span class="must-mark">*</span>


						</label>
						<div class="col-sm-10">

							<select id='stuStat' name='stuStat'>
								<c:if test="${stuStat == '재학'}">
									<option value='재학' selected="selected">재학</option>
									<option value='휴학'>휴학</option>
								</c:if>

								<c:if test="${stuStat == '휴학'}">
									<option value='재학'>재학</option>
									<option value='휴학 ' selected="selected">휴학</option>
								</c:if>
							</select> </select> <span id="validateCompanyMessage"></span>
						</div>
					</div>


					<div class="box-footer btn-group-center">
						<!-- <button type="button" class="btn btn-danger" onclick="remove()">삭제</button> -->
						<button type="submit" class="btn btn-primary">수정</button>
						<a type="button" href="/student?command=studentListForm"
							class="btn btn-default">취소</a>
						<!-- <button type="button" class="btn btn-cancel">취소</button> -->
					</div>
				</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->


<%@include file="../include/footer.jsp"%>



//유효성검사
<script>
	function validateEmptyVal() {
		if (document.getElementsByName("stuId")[0].value == "") {
			alert("학번을 입력해주세요");
			document.getElementsByName("stuId")[0].focus();
			return false;
		}
		if (document.getElementsByName("stuName")[0].value == "") {
			alert("이름을 입력해주세요");
			document.getElementsByName("stuName")[0].focus();
			return false;
		}
		if (document.getElementsByName("stuStat")[0].value == "") {
			alert("재적상태를 입력해주세요");
			document.getElementsByName("stuStat")[0].focus();
			return false;
		}

		alert("수정되었습니다.");
		return true;
	}
</script>