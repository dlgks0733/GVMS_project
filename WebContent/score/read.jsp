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
	
			<table class="table table-striped">
			
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
				<input type="hidden" name="EssSubId" value="">
				<td style="width : 10px"><input type="checkbox" value="${ScoreVO.scoreId}"></td>
				<td style="text-align: center;">${ScoreVO.middle}</td>
				<td style="text-align: center;"><input type="text" name="EssSubName" readonly="readonly" placeholder="${ScoreVO.subName}"><a href="#" onclick="openModSearchSubject()">
										<input type="button" value="검색" class="btn btn-default"></a></td>
				<td style="text-align: center;"><input type="text" name="score" placeholder="${ScoreVO.acqScore}"onkeydown='return onlyNumber(event)' 
											onkeyup='removeChar(event)'></td>
				<td style="text-align: center;"><input type="date" name="scoreDate" placeholder="${ScoreVO.scoreDate}"></td>
			</tr>
			</c:forEach>
		</table>
	
	 <br/>
	 <br/>
	 
	
		<table class="table table-striped">
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
				<td style="text-align: center;">
				<input type="text" name="optSubName" readonly="readonly" placeholder="${ScoreVO.subName}"><a href="#" onclick="openModSearchSubject()">
										<input type="button" value="검색" class="btn btn-default"></a></td>
				<td style="text-align: center;"><input type="text" name="optSubScore" onkeydown='return onlyNumber(event)' 
											onkeyup='removeChar(event)' placeholder="${ScoreVO.subScore}" readonly="readonly"></td>
				<td style="text-align: center;"><input type="date" name="scoreDate" placeholder="${ScoreVO.scoreDate}"></td>
				<input type="hidden" name="OptSubId" value="">
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


function openModSearchSubject()
{
	window.open("score?command=modifySearchForm",'_blank','width=500, height=400');
	
	return false;
}

function getChildData(subject)
{
	if (subject == null)
		return false;
	if (subject.subID == 0 || subject.subID == null)
		return false;
	
	var subID = document.getElementsByName("subID")[0];
	subID.value = subject.subID;
	var score = document.getElementsByName("score")[0];
	
	
	
	score.value = subject.score;
	
	document.getElementsByName("subName")[0].value = subject.subName;
	
	
	if (score.value <= 0)
	{
		score.readOnly = false;
		score.setAttribute("name", "acqScore");
		var parentElem = score.parentElement;
		parentElem.innerHTML = parentElem.innerHTML
			+ "<input type=\"hidden\" name=\"score\" value=\"0\">";
		
	}

	}
	
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

function validateEmptyVal()
{
	if (document.getElementsByName("subName")[0].value == "")
	{
		alert("항목 명을 입력해주세요");
		document.getElementsByName("subName")[0].focus();
		return false;
	}
	if (document.getElementsByName("score")[0].value == "")
	{
		alert("점수를 입력해주세요");
		document.getElementsByName("score")[0].focus();
		return false;
	}
	if (document.getElementsByName("acqScore")[0].value == "")
	{
		alert("점수를 입력해주세요");
		document.getElementsByName("acqScore")[0].focus();
		return false;
	}
	
	return true;
}

function setChildValue(subId, major, name, score){
	
	if(major == "선택"){
		document.getElementsByName("optSubId")[0].value = subId;
		document.getElementsByName("optSubName")[0].value = name;
		document.getElementsByName("optSubScore")[0].value = score;
		
	} else {
		document.getElementsByName("EssSubId")[0].value = subId;
		document.getElementsByName("EssSubName")[0].value = name;
	}
	
}




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
