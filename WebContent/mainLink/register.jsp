<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<!-- admin/validity/board.js에서 사용중 -->
<script type="text/javascript"
	src="/resources/admin/validity/board.js?ver=1"></script>



<!-- Main content -->
<section class="content">




	<div class="row">
		<!-- left column -->
		<div class="col-md-10">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">메인링크 등록</h3>
				</div>
				<!-- /.box-header -->

				<form name="frm" role="form" method="post" class="form-horizontal">
					<div class="box-body box-form-custom">
						<div class="form-group input-long">

							<label for="exampleInputEmail1" class="col-sm-2 control-label">센터명<span
								style="color: red">*</span></label>

							<div class="col-sm-8">
								<select name="compNum" id="compNum" class="form-control"
									onchange="compSelect(this.value)">
									<option value="">기관명</option>
									<c:forEach var="list" items="${list}">
<%-- 										<c:if test="${list.linkName eq null or list.linkName eq ''} "> --%>
											<option value="${list.compNum}">${list.compName}</option>
<%-- 										</c:if> --%>

									</c:forEach>
								</select>
							</div>
						</div>


						<!-- 링크 입력칸 : 해당 유튜브 화면에서 공유하기 링크를 복사 붙여넣기 해야함 -->
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">유튜브
								링크<span style="color: red">*</span>
							</label>
							<div class="col-sm-10">
							
								<input type="text" name='linkName' class="form-control col-sm-6" id='linkName'
									placeholder="유튜브 링크를 입력해주세요">

								<!-- admin/validity.board.js / vidPreview()  -->
								<div class="col-sm-5">
								<input class="btn btn-dark col-sm-6" value="미리보기" name="srch_btn"
									type="button" style="width: 80px"
									onclick="vidMainLinkPreview()">
							</div>
							</div>
						</div>

						<!-- 프리뷰 화면 -->
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">동영상
								프리뷰</label>
							<div class="col-sm-10">
								<div class="" style="width: 360px">
									<iframe id="vid_prv_admin" height="170px"
										src="https://www.youtube.com/embed/" frameborder="0"
										gesture="media" allow="encrypted-media" allowfullscreen></iframe>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>





		</div>
		<!-- /.box -->

	</div>
	<!--/.col (left) -->

	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
	$(document).ready(
			
			function() {

		$(".btn-cancel").on("click", function() {
			self.location = "/admin/mainLink/list";
		});
		
		$(".btn-primary").on("click",function(video) {
			
			if(document.getElementById("linkName").value == "") {
				alert("링크를 입력해주세요")
				return false;
				
			}else if(document.getElementById("compNum").value ==""){
				alert("센터를 입력해주세요")
				return false;
			}else{
				formObj.submit();
			}
				});
	
	});
	
	
	
</script>

<%@include file="../include/footer.jsp"%>
