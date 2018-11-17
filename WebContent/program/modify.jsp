<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/admin/validity/program.js?ver=2"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary ">
				<div class="box-header">
					<h3 class="box-title">프로그램 수정</h3>
				</div>
				<!-- /.box-header -->

			<form name="regist" role="form" action="modify" method="post"  onsubmit="return registVal()">
				<input type='hidden' name='page' value="${cri.page}"> 
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">
				<input type='hidden' name='compnums' value="${cri.compnums}">
					
					<div class="box-body">
					
						<input type="hidden" class="form-control" name='intronum' value="${programVO.intronum}" readonly="readonly">
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">프로그램명</label> 
							<div class="col-sm-9"> 
							<input type="text" name='title' class="form-control" value="${programVO.title}" placeholder="제목">
							</div>
							<div class="col-sm-1"></div>
						</div>
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">분류</label> 
							<div class="col-sm-9"> 
							<select class="form-control" name="category" class="form-control" required="required">
										<option value="1" <c:if test="${programVO.category eq 1}">selected</c:if>>학습법</option>
										<option value="2" <c:if test="${programVO.category eq 2}">selected</c:if>>소프트웨어</option>
							</select>
							</div>
							<div class="col-sm-1"></div>
						</div>
						
						<div class="col-sm-2">
						</div>
						
						<div class="form-group input-long col-sm-9 right-pull">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">기관선택</label> 
							<div class="col-sm-9"> 
								<select class="form-control" name="compnum">
										
									<c:forEach items="${centerList}" var="ProvideVO"> 
										<option value="${ProvideVO.compnum}" <c:if test="${ProvideVO.compnum eq programVO.compnum}">selected</c:if>>${ProvideVO.compname}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-1"></div>
						</div>
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputEmail1">소개 영상 링크</label> 
							<div class="col-sm-9"> 
							<input type="text" name="link" class="form-control"
								value="${programVO.link}" placeholder="[Youtube 영상 링크만 가능]">
								</div>
							<div class="col-sm-1"></div>
						</div> 
						
						<div class="col-sm-2">
						</div>
						<div class="form-group input-long col-sm-9">
							<label class="col-sm-2 control-label" for="exampleInputPassword1">내용</label>
							<div class="col-sm-9"> 
							<textarea class="form-control" name="content" rows="5">${programVO.content}</textarea>
							</div>
							<div class="col-sm-1"></div>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer col-md-12 col-xs-12">
					<div class="text-center">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-cancel">취소</button>
					</div>
				</div>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-cancel")
				.on("click",function() {
					self.location = "../program/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&compnums=${programVO.compnum}";
				});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "remove?intronum=${programVO.intronum}");
			formObj.submit();
		});
		
		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<%@include file="../include/footer.jsp"%>
