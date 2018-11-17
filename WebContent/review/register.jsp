<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!-- src 경로를 제대로 지정해줘야 함 -->
<script type="text/javascript" src="/resources/admin/validity/review.js"></script>



<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수강후기 등록</h3>
				</div>
				<!-- /.box-header -->
				
				<!-- form "regist"는 유효성 검사 registVal() 를 거쳐야함 -->
				<form role="form" method="post" class="form-horizontal" name="regist" onsubmit="return registVal(this);">
					<input type="hidden" name="adminId" value="${login.adminId }">
					<div class="box-body box-form-custom">
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제목</label> 
							<div class="col-sm-10">
								<input type="text" id="reviewTitle" name='reviewTitle' class="form-control" placeholder="제목을 입력해주세요." onkeyup="checkLength(this,90)">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">센터</label> 
							<div class="col-sm-10">
								<!-- DB에서 센터 데이터를 불러와서 셀렉트 박스에 나오도록 하여 센터를 선택받음-->
								<select id="company" name="company" onchange="compSelect(this.value)" class="form-control">
											<option value="0">센터선택</option>
										<c:forEach items="${compSelect}" var="companyVO" varStatus="status">
											<option value="${companyVO.compnum} ">${companyVO.compname }</option>
										</c:forEach>
									</select>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">강좌</label> 
							<div class="col-sm-10">
								<!-- 선택받은 센터에 해당되는 강좌 데이터를 DB에서 불러와서 셀렉트 박스에 나오도록 하여 강좌를 선택받음 -->
								<select id="cour" name="courNum" class="form-control">
   									 	<option value="0">강좌선택</option>
    								</select>  
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">링크</label> 
							<div class="col-sm-10">
								<input type="text" id='uri' name='uri' class="form-control" placeholder="링크를 넣어주세요">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label> 
							<div class="col-sm-10">
								<textarea rows="5" id='reviewText' name='reviewText' class="form-control" placeholder="수강후기를 입력해주세요." onKeyUp="javascript:fnChkByte(this,'2000')"></textarea>
								<span id="byteInfo">0</span>/2000Byte
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
				
				<script>
					$(document)
							.ready(
									function() {
										
										var formObj = $("form[role='form']");

										console.log(formObj);

										// 취소 버튼을 누르면 목록으로 돌아감
										$(".btn-cancel")
												.on(
														"click",
														function() {
															self.location = "/admin/review/list";
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

<!-- /.content-wrapper -->
<script type="text/javascript">
//AJAX select box
function compSelect(company){
$.ajax({
 type: "POST",
 url: "/admin/review/list.do",
 dataType:"json",
 data: {param:company},
 success: function(result){

  //SELECT BOX 초기화           
  $("#cour").find("option").remove().end().append("<option value=''>강좌선택</option>");
  
  //배열 개수 만큼 option 추가
   $.each(result, function(i){
    $("#cour").append("<option value='"+result[i].cournum+"'>"+result[i].courname+"</option>")
   });    
  },
   error: function (jqXHR, textStatus, errorThrown) {
   alert("오류가 발생하였습니다.");
  }                     
 });
}
</script>

<%@include file="../include/footer.jsp"%>
