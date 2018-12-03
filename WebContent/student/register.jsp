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
					<h3 class="box-title">학생 등록</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" class="form-horizontal"
					onsubmit="return validateEmptyVal()">
					<input type="hidden" name="validation">
					<div class="box-body box-form-custom">
						<div class="form-group input-short">

							<div class="form-group input-short">
								<label for="exampleInputEmail1" class="col-sm-2 control-label">학번<span
									class="must-mark">*</span></label>
								<div class="col-sm-10">
									<input type="text" name='stuID' class="form-control"
										placeholder="학번을 입력해주세요"> <span
										id="validatePwEmailMessage"></span>
								</div>
							</div>

							<div class="form-group input-short">
								<label for="exampleInputEmail1" class="col-sm-2 control-label">이름<span
									class="must-mark">*</span></label>
								<div class="col-sm-10">
									<input type="text" name='stuName' class="form-control"
										placeholder="이름을 입력해주세요"> <span
										id="validatePwEmailMessage"></span>
								</div>
							</div>

							<div class="form-group input-short">
								<label for="exampleInputEmail1" class="col-sm-2 control-label">재학
									상태<span class="must-mark">*</span>
								</label>
								<div class="col-sm-10">
									<select id='stuStat' name='stuStat'>
										<option value='' selected>--선택--</option>
										<option value='재학'>재학</option>
										<option value='휴학'>휴학</option>
									</select>
								</div>
							</div>

						</div>
					</div>



					<!-- /.box-body -->

					<div class="box-footer btn-group-center">

						<button type="button" class="btn btn-primary" id="submitbutton">등록</button>
						<a type="button" href="/student?command=studentListForm"
							class="btn btn-default">취소</a>

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
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>



<script>

	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary").on("click", function() {
			formObj.attr("action", "/student?command=stud_register");
			formObj.attr("method", "post");
			formObj.submit();
			alert("등록되었습니다.");

		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/student?command=studentListForm");
			formObj.attr("method", "post");

		});

	});
	
//유효성검사
	function validateEmptyVal() {
		if (document.getElementsByName("stuID")[0].value == "") {
			alert("학번을 입력해주세요");
			document.getElementsByName("stuID")[0].focus();
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

		return true;
	}

	
</script>