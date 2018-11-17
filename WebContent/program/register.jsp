<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/admin/validity/program.js?ver=1"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">프로그램 등록</h3>
				</div>
				<!-- /.box-header -->

				<form name="regist" role="form" method="post"  onsubmit="return registVal()">
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' name='compnums' id="compnums" value="${cri.compnums}">
					<div class="form-group">
								<input type="hidden" name="adminId" class="form-control"
									value='${login.adminId }' readonly>
							</div>
					<div class="box-body">
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputEmail1" >프로그램명</label>
							<div class="col-sm-9"> 
								<input type="text" name="title" class="form-control" placeholder="제목">
							</div>
							<div class="col-sm-1"></div>
						</div>
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">분류</label>
							<div class="col-sm-9"> 
								<select class="form-control" name="category" id="category" class="form-control">
										<option value="">--</option>
										<option value="1">학습법</option>
										<option value="2">소프트웨어</option>
								</select>
							</div>
							<div class="col-sm-1"></div>
						</div>
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9 right-pull">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">기관선택</label> 
							<div class="col-sm-9"> 
							<select class="form-control" name="compnum" id="compnum" class="form-control">
								<option value="">--</option>
								<c:forEach items="${centerList}" var="provideVO"> 
									<option value="${provideVO.compnum}">${provideVO.compname}</option>>
								</c:forEach>
							</select>
							</div>
							<div class="col-sm-1"></div>
						</div>
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">소개영상</label> 
							<div class="col-sm-9"> <input type="text" name="link" class="form-control" 7></div>
							<div class="col-sm-1"></div>
						</div> 
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputPassword1">내용</label>
							<div class="col-sm-9"> 
							<textarea class="form-control" name="content" id="content" rows="5">${programVO.content}</textarea>
							</div>
							<div class="col-sm-1"></div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center col-sm-12">
						<button type="button" class="btn btn-cancel">${cri.compnums}취소</button>
						<button type="button" class="btn btn-primary" >저장</button>
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
<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-cancel").on("click", function() {
					self.location = "../program/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&compnums=${cri.compnums}";
				});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		
		$(".btn-primary").on("click",function() {
					formObj.submit();
				});
	}
	);
</script>

<%@include file="../include/footer.jsp"%>
