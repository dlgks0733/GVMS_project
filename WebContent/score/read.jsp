<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">점수내역</h3>
					<h4>학번:${stuId} 이름:${stuName}</h4>
				</div>
				<!-- /.box-header -->

<form role="form" method="post">
	
	<input type='hidden' name="stuId" value="${stuId}">
	<input type='hidden' name="stuName" value="${stuName}">

</form>

<div class="box-body">
	<%-- <div class="form-group">
		<label for="exampleInputEmail1">Title</label> <input type="text"
			name='title' class="form-control" value="${boardVO.title}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> <input type="text"
			name="writer" class="form-control" value="${boardVO.writer}"
			readonly="readonly">
	</div> --%>
	
			<table class="table table-bordered">
			
			<tr>
				<th style="text-align: center;" colspan="5">필수영역</th>
			</tr>
			
			<tr>
				<th style="width : 10px"> </th>
				<th style="text-align: center;">영역</th>
				<th style="text-align: center;">항목 명</th>
				<th style="text-align: center;">점수</th>
				<th style="text-align: center;">취득 일자</th>
			</tr>
				
			<c:forEach items="${essList}" var="ScoreVO">	
			<tr>
				<td style="width : 10px"><input type="checkbox" value="${ScoreVO.scoreId}"></td>
				<td style="text-align: center;">${ScoreVO.middle}</td>
				<td style="text-align: center;">${ScoreVO.subName}</td>
				<td style="text-align: center;">${ScoreVO.acqScore}</td>
				<td style="text-align: center;">${ScoreVO.scoreDate}</td>
			</tr>
			</c:forEach>
		</table>
	
	 <br/>
	 <br/>
	 
	
		<table class="table table-bordered">
			<tr>
				<th style="text-align: center;" colspan="5">선택영역</th>
			</tr>
			
			<tr>
				<th style="width : 10px"> </th>
				<th style="text-align: center;">영역</th>
				<th style="text-align: center;">항목 명</th>
				<th style="text-align: center;">점수</th>
				<th style="text-align: center;">취득 일자</th>
			</tr>
			
			<c:forEach items="${optList}" var="ScoreVO">
			<tr>
				<td style="width : 10px"><input type="checkbox" value="${ScoreVO.scoreId}"></td>
				<td style="text-align: center;">${ScoreVO.middle}</td>
				<td style="text-align: center;">${ScoreVO.subName}</td>
				<td style="text-align: center;">${ScoreVO.subScore}</td>
				<td style="text-align: center;">${ScoreVO.scoreDate}</td>
			</tr>
			</c:forEach>	
		</table>
</div>
<!-- /.box-body -->

<div class="box-footer">
	<button type="submit" class="btn btn-primary" style = "float : right">목록</button>
	<button type="submit" class="btn btn-danger" style = "float : right">삭제</button>
	<button type="submit" class="btn btn-warning" style = "float : right">수정</button>
</div>


<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "score?command=scoreModifyForm");
		formObj.attr("method", "post");		
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location = "score?command=scoreListForm";
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
