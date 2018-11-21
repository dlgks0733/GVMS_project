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
					<h3 class="box-title">수정</h3>
							
					
				</div>
				<!-- /.box-header -->

<form role="form" method="post" action ="/subject?command=subModify">
	<input type="hidden" name="subId" value="${subId}">
	<div class="box-body">
<c:forEach items="${sublist}" var="SubjectVO">
		<div class="form-group">
			<label >필수</label> 
			<input type= "radio" name = "major" value = "필수" >
			<label >선택</label> 
			<input type= "radio" name = "major" value = "선택" >
			
		</div>
		
		<div class="form-group">
			<label >중분류</label>
			<select name = "middle">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </select>
	       
		</div>
<%-- 		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> 
			<input type="text" name="writer" 
			  class="form-control" value='${login.usid }' readonly>
		</div>	 --%>	
 		<div class="form-group">
 		
			<label >항목명</label> 
			<input type="text" name="subName" value = "${SubjectVO.subName}" placeholder="ex) 정보화영역">
		</div> 
		 		<div class="form-group">
			<label >점수</label> 
			<input type="text" name="subScore" value = "${SubjectVO.subScore}" placeholder="ex) 600">
		</div> 
	</c:forEach>
	</div>

	
	<!-- /.box-body -->

	<div class="box-footer">

	</div>
<div class="box-footer">
	<button type="submit" class="btn btn-primary">수정</button>
	<button type="submit" class="btn btn-warning">취소</button>
</div>
</form>




<script>
	/*$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			self.location = "";
		});

		$(".btn-primary").on("click", function() {
			formObj.submit();
		});

	}); */
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

<%@include file="../include/footer.jsp"%>
