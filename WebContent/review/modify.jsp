<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/admin/validity/review.js"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수강후기 수정</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modify" method="post" name="regist" class="form-horizontal" onsubmit="return registVal(this);">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' name='reviewNum' value="${reviewVO.reviewNum}">

					<div class="box-body box-form-custom">
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name='reviewTitle' class="form-control"
									value="${reviewVO.reviewTitle}">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">센터</label>
							<div class="col-sm-10">
								<!-- 게시물을 등록할 때 선택되었던 센터 정보를 보여줌 -->
								<select id="company" name="company"
									onchange="compSelect(this.value)" class="form-control">
									<option value=""></option>
									<c:forEach items="${compSelect}" var="companyVO"
										varStatus="status">
										
										<c:choose>
											<c:when test="${companyVO.compnum eq reviewVO.compNum}">
												<option value="${companyVO.compnum} " selected="selected">${companyVO.compname }</option>
											</c:when>
											<c:otherwise>
												<option value="${companyVO.compnum} ">${companyVO.compname }</option>
											</c:otherwise>
										</c:choose>										
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">강좌</label>
							<div class="col-sm-10">
								<select id="cour" name="courNum" class="form-control">
									<option value="">강좌선택</option>
									<!-- 게시물을 등록할 때 선택되었던 강좌 정보를 보여줌 -->
									<c:forEach items="${courList}" var="cour" varStatus="status">
										<c:choose>
											<c:when test="${cour.cournum eq reviewVO.courNum}">
												<option value="${cour.cournum} " selected="selected">${cour.courname }</option>
											</c:when>
											<c:otherwise>
												<option value="${cour.cournum} ">${cour.courname }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">링크</label>
							<div class="col-sm-10">
								<input type="text" name='uri' class="form-control" 	placeholder="등록을 추가해야합니다." value="${reviewVO.uri}">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea rows="5" name='reviewText' class="form-control">${reviewVO.reviewText}</textarea>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="submit" class="btn btn-danger">삭제</button>
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-cancel">취소</button>
					</div>
				</form>

				<script>
					$(document)
							.ready(
									function() {
										
										var formObj = $("form[role='form']");

										console.log(formObj);
	
										// 삭제 버튼
										$(".btn-danger")
												.on(
														"click",
														function() {
															formObj
																	.attr(
																			"action",
																			"/admin/review/delete");
															formObj.submit();
														});

										// 수정 버튼
										$(".btn-primary").on("click",
												function() {
													formObj.submit();
												});

										// 취소 버튼을 누르면 원래의 페이지로 돌아감
										$(".btn-cancel")
												.on(
														"click",
														function() {
															self.location = "/admin/review/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
																	+ "&searchCour=${cri.searchCour}&searchComp=${cri.searchComp}"
																	+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
														});
										$("")
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
<script type="text/javascript">
	//AJAX select box
	function compSelect(company) {
		$.ajax({
			type : "POST",
			url : "/admin/review/list.do",
			dataType : "json",
			data : {
				param : company
			},
			success : function(result) {

				//SELECT BOX 초기화           
				$("#cour").find("option").remove().end().append(
						"<option value=''>강좌선택</option>");

				//배열 개수 만큼 option 추가
				$.each(result, function(i) {
					$("#cour").append(
							"<option value='"+result[i].cournum+"'>"
									+ result[i].courname + "</option>")
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류가 발생하였습니다.");
			}
		});
	}
</script>
<%@include file="../include/footer.jsp"%>
