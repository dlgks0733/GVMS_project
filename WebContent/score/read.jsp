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
	
			<form role="frm" method="post">		
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
				
			<c:forEach items="${essList}" var="ScoreVO" varStatus="essListStat">	
				
				
				<tr>
				
					<td style="width : 10px"><input type="checkbox" name="scoreId" value="${ScoreVO.scoreId}"></td>
					<td style="text-align: center;">${ScoreVO.middle}</td>
					<td style="text-align: center;"><input type="text" name="subName" readonly="readonly" value="${ScoreVO.subName}"><a href="#" onclick="openModSearchSubject()">
											<input type="button" value="검색" class="btn btn-default"></a></td>
					<td style="text-align: center;"><input type="text" name="acqScore" value="${ScoreVO.acqScore}"onkeydown='return onlyNumber(event)' 
												onkeyup='removeChar(event)'></td>
					<td style="text-align: center;"><input type="text" name="scoreDate" readonly="readonly" value="${ScoreVO.scoreDate}">
					<input type="hidden" name="optSubId">
					<input type="hidden" name="scoreId" value="${ScoreVO.scoreId}">
					</td>
					
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
				
				<c:forEach items="${optList}" var="ScoreVO" varStatus="optListStat">
					
				<tr>
					<td style="width : 10px"><input type="checkbox" name = "scoreId" value="${ScoreVO.scoreId}"></td>
					<td style="text-align: center;">${ScoreVO.middle}</td>
					<td style="text-align: center;">
					<input type="text" name="subName" readonly="readonly" value="${ScoreVO.subName}"><a href="#" onclick="openModSearchSubject()">
											<input type="button" value="검색" class="btn btn-default"></a></td>
					<td style="text-align: center;"><input type="text" name="subScore" onkeydown='return onlyNumber(event)' 
												onkeyup='removeChar(event)' value="${ScoreVO.subScore}" readonly="readonly"></td>
					<td style="text-align: center;"><input type="text" name="scoreDate" readonly="readonly" value="${ScoreVO.scoreDate}">
					<input type="hidden" name="subId">
					<input type="hidden" name="scoreId" value="${ScoreVO.scoreId}">
				</tr>
				</c:forEach>	
			</table>
						
		</form>
	
</div>
<!-- /.box-body -->

<div class="box-footer">
						<button type="submit" class="btn btn-danger" style = "float : right">삭제</button>
						<button type="submit" class="btn btn-warning" style = "float : right">수정</button>
						<button type="submit" class="btn btn-primary" style = "float : right">목록</button>
</div> 

<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "score?command=scoreModify");
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
	window.open("score?command=scoreModifySearchForm",'_blank','width=500, height=400');
	
	return false;
}

/* function getChildData(subject)
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

	} */
	
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
	
    var essId = document.getElementsByName("essListIndex");
	var essIdLeng = essId.length;
	var essChecked = 0;
	var optId = document.getElementsByName("optListIndex");
	var optIdLeng = optId.length;
	var optChecked = 0;
	
	if(major == "필수"){
	
	for(i=0; i<essIdLeng; i++){
		if(essId[i].checked == true){
			essChecked += 1;
			alert(essId[i].value);
		}
			document.getElementsByName(essId[i].value+"subId")[0].value = subId;
			document.getElementsByName(essId[i].value+"subName")[0].value = name;
	}
		
		if(essChecked == 0){
		alert("선택된 정보가 없습니다");
		return;
		}

	}
	
	else if(major == "선택"){
	
	for(i=0; i<optIdLeng; i++){
		if(optId[i].checked == true){
			optChecked += 1;
			alert(optId[i].value);
		}
			document.getElementsByName(optId[i].value+"subId")[0].value = subId;
			document.getElementsByName(optId[i].value+"subName")[0].value = name;
			document.getElementsByName(optId[i].value+"subScore")[0].value = score;
	}
	
	if(optChecked == 0){
		alert("선택된 정보가 없습니다");
		return;
		}
		

	}
	
	
	
	
	
	 /* if(major == "선택"){
		document.getElementsByName("optSubId").value = subId;
		document.getElementsByName("optSubName").value = name;
		document.getElementsByName("optSubScore").value = score;
		
	} else {
		document.getElementsByName("essSubId").value = subId;
		document.getElementsByName("essSubName").value = name;
	} */ 
	
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
