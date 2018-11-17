<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<!-- admin/validity/board.js에서 사용중 -->
<script type="text/javascript"
	src="/resources/admin/validity/board.js?ver=3"></script>

<!-- Main content -->
<section class="content">



	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">동영상 목록</h3>
				</div>
				<!-- /.box-header -->
				
				<form name="frm" role="form" action="modify" method="post" class="form-horizontal">
					<div class="box-body box-form-custom">
					<input type='hidden' name='num' value="${videoBoardVO.num}"> 
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					
					

						
						
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제목<span style="color: red" >*</span></label>
							<div class="col-sm-10">
							 <input type="text" id="videoTitle"
								name="title" class="form-control" value="${videoBoardVO.title}">
						</div>
						</div>
						<div class="form-group input-long">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">기관<span style="color: red">*</span></label>
					<div class="col-sm-10">
								<select name="compnum" id="compnum" class="form-control"
									onchange="compSelect(this.value)">
									<option value="">기관명</option>
									<c:forEach var="lists" items="${list}">
<%-- 										<c:if test="${lists.linkName eq null or lists.linkName eq ''} "> --%>
											<option <c:out value="${lists.compnum eq videoBoardVO.compnum ?'selected':''}" /> value="${lists.compnum}">${lists.compname}</option>
<%-- 										</c:if> --%>

									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">유튜브 링크<span style="color: red" >*</span></label> 
							<div class="col-sm-10">
							
							<input type="text"  id="videoLink"
								name="link" class="form-control col-sm-6" value="https://youtu.be/${videoBoardVO.link}">
						
						
						
						<!-- board.js vidPreview()-->
						<div class="col-sm-5">
						<input value="미리보기" name="srch_btn" class="btn btn-default"
							type="button" style="width: 80px" onclick="vidPreview()">
						
					
					</div>
					</div>
					</div>
					
			
						<!-- 프리뷰 화면 -->
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">동영상
								프리뷰</label>
							<div class="col-sm-10">
								<div class="" style="width: 360px">
									<iframe id="vid_prv" height="170px"
										src="https://www.youtube.com/embed/${videoBoardVO.link}" frameborder="0"
										gesture="media" allow="encrypted-media" allowfullscreen></iframe>
								</div>
							</div>
						</div>


			<div class="form-group input-short">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label> 
					<div class="col-sm-10">
						<textarea  rows="5" name='content' class="form-control">${videoBoardVO.content}</textarea>
					</div>
				</div>
			</div>
					
					<!-- /.box-body -->
					
				<div class="box-footer btn-group-center">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-cancel">취소</button>
				</div>
				</form>
				

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-cancel")
				.on("click",function() {
					self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
		
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		
		$(".btn-primary").on("click",function(video) {
			
			if(document.getElementById("videoTitle").value == "") {
				alert("제목을 입력해주세요")
				return false;
				
			}else if(document.getElementById("videoLink").value == ""){
				alert("링크를 입력해주세요")
				return false;
			}else{
				formObj.submit();
			}
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
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
