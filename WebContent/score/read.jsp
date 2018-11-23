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
	
			<form name="frm" method="post" role="form">		
			<table class="table table-striped">
			
			<tr>
				<th style="text-align: center;" colspan="5">필수영역</th>
			</tr>
			
			<tr>
				<th style="width : 10px"><input type="checkbox" name="essAllCheck" onclick="essCheckAll()"></th>
				<th style="text-align: center;">영역</th>
				<th style="text-align: center;">항목 명</th>
				<th style="text-align: center;">점수</th>
				<th style="text-align: center;">취득 일자</th>
			</tr>
				
			<c:forEach items="${essList}" var="ScoreVO" varStatus="essListStat">	
				
				
				<tr>
					
					<td style="width : 10px"><input type="checkbox" name="essCheck" value="${essListStat.index}"></td>
					<td style="text-align: center;">${ScoreVO.middle}</td>
					<td style="text-align: center;"><input type="text" name="${essListStat.index}essSubName" readonly="readonly" value="${ScoreVO.subName}"><a href="#" onclick="openModEssSearchSubject(${essListStat.index})">
											<input type="button" value="검색" class="btn btn-default"></a></td>
					<td style="text-align: center;"><input type="text" name="${essListStat.index}essAcqScore" value="${ScoreVO.acqScore}"onkeydown='return onlyNumber(event)' 
												onkeyup='removeChar(event)'></td>
					<td style="text-align: center;"><input type="text" name="${essListStat.index}essScoreDate" readonly="readonly" value="${ScoreVO.scoreDate}">
					<input type="hidden" name="${essListStat.index}essSubId">
					<input type="hidden" name="${essListStat.index}essScoreId" value="${ScoreVO.scoreId}">
					<input type="hidden" name="essIndex" value="${essListStat.index}">
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
					<th style="width : 10px"><input type="checkbox" name="optAllCheck"></th>
					<th style="text-align: center;">영역</th>
					<th style="text-align: center;">항목 명</th>
					<th style="text-align: center;">점수</th>
					<th style="text-align: center;">취득 일자</th>
				</tr>
				
				<c:forEach items="${optList}" var="ScoreVO" varStatus="optListStat">
					
				<tr>
					
					<td style="width : 10px"><input type="checkbox" name = "optCheck" value="${optListStat.index}"></td>
					<td style="text-align: center;">${ScoreVO.middle}</td>
					<td style="text-align: center;">
					<input type="text" name="${optListStat.index}optSubName" readonly="readonly" value="${ScoreVO.subName}"><a href="#" onclick="openModOptSearchSubject(${optListStat.index})">
											<input type="button" value="검색" class="btn btn-default"></a></td>
					<td style="text-align: center;"><input type="text" name="${optListStat.index}optSubScore" onkeydown='return onlyNumber(event)' 
												onkeyup='removeChar(event)' value="${ScoreVO.subScore}" readonly="readonly"></td>
					<td style="text-align: center;"><input type="text" name="${optListStat.index}optScoreDate" readonly="readonly" value="${ScoreVO.scoreDate}">
					<input type="hidden" name="${optListStat.index}optSubId">
					<input type="hidden" name="${optListStat.index}optScoreId" value="${ScoreVO.scoreId}">
					<input type="hidden" name="optIndex" value="${optListStat.index}">
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
		formObj.attr("action", "score?command=scoreDelete");
		formObj.attr("method", "post");	
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		formObj.attr("action","score?command=scoreListForm");
		formObj.attr("method","post");
		formObj.submit();
	});
	
});




function openModEssSearchSubject(index)
{				
		alert(index)	;	
	var url = "score?command=scoreModEssSearchForm&index=" + encodeURIComponent(index);		
	
	window.open(url,'_blank','width=500, height=400');
	
	return false;
}

function openModOptSearchSubject(index)
{				
		alert(index)	;	
	var url = "score?command=scoreModOptSearchForm&index=" + encodeURIComponent(index);		
	
	window.open(url,'_blank','width=500, height=400');
	
	return false;
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

function setOptSubInfo(index , subId, name, score){
	document.getElementsByName(index+"optSubId")[0].value = subId;
	document.getElementsByName(index+"optSubName")[0].value = name;
	document.getElementsByName(index+"optSubScore")[0].value = score;
}

function setEssSubInfo(index , subId, name){
	document.getElementsByName(index+"essSubId")[0].value = subId;
	document.getElementsByName(index+"essSubName")[0].value = name;
}


function essCheckAll(){
	for(i=0; i<frm.essCheck.length; i++){
		frm.essCheck[i].checked = true;
	}
}

function essUnCheckAll(){
	for(i=0; i<frm.essCheck.length; i++){
		frm.essCheck[i].checked = false;
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
