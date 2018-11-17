<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<!-- admin/validity/board.js에서 사용중 -->
<script type="text/javascript"
	src="/resources/admin/validity/board.js?ver=2"></script>



<!-- Main content -->
<section class="content">




	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">동영상 등록</h3>
				</div>
				<!-- /.box-header -->

				<form name="frm" role="form" method="post" class="form-horizontal">
					<div class="box-body box-form-custom">
					
					<div class="form-group input-long">
							
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제목<span style="color: red">*</span></label>
							
							<div class="col-sm-10">
								<input type="text" name='title' class="form-control"
									placeholder="제목을 입력해주세요">

								<!--로그인아이디 강제 삽입 -->
								<input type="hidden" name="adminid" value="${login.adminId }">


							</div>
						</div>
					<div class="form-group input-long">
					
					<label for="exampleInputEmail1" class="col-sm-2 control-label">기관<span style="color: red">*</span></label>
					<div class="col-sm-10">
								<select name="compnum" id="compnum" class="form-control"
									onchange="compSelect(this.value)">
									<option value="">기관명</option>
									<c:forEach var="list" items="${list}">
<%-- 										<c:if test="${list.linkName eq null or list.linkName eq ''} "> --%>
											<option value="${list.compnum}">${list.compname}</option>
<%-- 										</c:if> --%>

									</c:forEach>
								</select>
							</div>
					
						</div>

						<!-- 링크 입력칸 : 해당 유튜브 화면에서 공유하기 링크를 복사 붙여넣기 해야함 -->
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label" >유튜브
								링크<span style="color: red" >*</span></label>
							<div class="col-sm-10">
								
							<input type="text" name='link' class="form-control col-sm-6"
									placeholder="유튜브 링크를 입력해주세요">
									
								<!-- admin/validity.board.js / vidPreview()  -->
								<div class="col-sm-5">
								<input class="btn btn-default col-sm-6" value="미리보기" name="srch_btn"
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
										src="https://www.youtube.com/embed/" frameborder="0"
										gesture="media" allow="encrypted-media" allowfullscreen></iframe>
								</div>
							</div>
						</div>


						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea rows="5" name='content' class="form-control"
									placeholder="긴 내용 입력용"></textarea>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-primary"
							onclick="return writeCheck()">등록</button>
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

<script>
	$(document).ready(function() {

		$(".btn-cancel").on("click", function(){
	        self.location = "/admin/videoBoard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
	        + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	   });
	});
</script>

<%@include file="../include/footer.jsp"%>
