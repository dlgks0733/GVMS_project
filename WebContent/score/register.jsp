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

			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">졸업인증 점수 등록</h2>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<h4>학번 : ${stuId } 이름 : ${stuName }</h4>
						<input type="button" id = "delete" onclick="deleteRow()" value="항목삭제" class="btn btn-default" style ="float : right ">
						<input type="button" id = "add" onclick="addRow()" value="항목추가" class="btn btn-default" style ="float : right ">
						
						
						<form id="form" method ="post" action="score?command=scoreRegist" onsubmit="return validateEmptyVal()">
							<input type="hidden" name="stuId" value="${stuId}">
							<input type="hidden" name="subId_1"> <!--각 선택된 과목별 히든  -->
							<input type="hidden" name="row_cnt" value= "1">
						 <div id="registTable">	
							<table class="table table-striped">
							  <thead>	
									<tr>
										<th style="text-align: center;">항목명</th>
										<th style="text-align: center;">점수</th>
										<th style="text-align: center;">취득 일자</th>
									<!-- <th>소속기관</th> -->
									</tr>
							  </thead>
							  <tbody id="subject_tbody" align="center">	
									<tr>
										<td><input type="text" name="subName_1" readonly="readonly" value=""><a href="#" onclick="openRegSearchSubject(1)">
										<input type="button" value="검색" class="btn btn-default"></a></td>
										<td><input type="text" name="score_1" value="" readonly="readonly" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' placeholder="숫자만 입력해주세요"></td>
										<td><input type="date" name="scoreDate_1"></td>
									</tr>
							  </tbody>
							</table>
						  </div>
						  	<a href="score?command=scoreListRegForm"><button type="button" id="newBtn" class="btn btn-default" style ="float : right ">취소</button></a>
							<button type="submit" id="newBtn" class="btn btn-primary" style ="float : right ">신규 등록</button>
							</form>
							
					</div>
					<!-- /.box-body -->
	
	
					<div class="box-footer">
	
						<%-- <div class="text-center">
							<ul class="pagination">
	
								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeAppSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>
	
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeAppSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
	
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeAppSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div> <!-- .text-center END --> --%>
						<!-- <div class="btn-group-custom">
							<a type="submit" onsubmit="return validateEmptyVal()" id="newBtn" class="btn btn-default">신규 등록</a>
						</div> -->
					</div> <!-- .box-footer END -->
				</div> <!-- .box-wrap END -->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
/* $(document).ready(function() {

			$('#searchBtn').on("click", function(event) {

					self.location = "list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();

			});

			$('#newBtn').on("click", function(event) {
				
				self.location = "register"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
			});


}); */






/*자바스크립트, 제이슨  */

function openRegSearchSubject(index)
{
	window.open("score?command=scoreRegistSearchForm&index="+index ,'_blank','width=500, height=400');
	
	return false;
}

function getChildData(subject)
{
	
	
	
	if (subject == null)
		return false;
	if (subject.subID == 0 || subject.subID == null)
		return false;
	
	
	var subID = document.getElementsByName("subId_"+subject.parent_index)[0];
	subID.value = subject.subID;
	
	var score = document.getElementsByName("score_"+subject.parent_index)[0];
	var acqScore = document.getElementsByName("acqScore_"+subject.parent_index)[0];
	document.getElementsByName("subName_"+subject.parent_index)[0].value = subject.subName;
	
	
	if(subject.score <= 0){
		score.setAttribute("name", "acqScore_"+subject.parent_index);
		score.value = "";
		score.readOnly = false;
		/* var parentElem = score.parentElement;
		parentElem.innerHTML = parentElem.innerHTML
			+ "<input type=\"hidden\" name=\"score\" value=\"0\">"; */
	}
	if(subject.score > 0 && acqScore != null){
		acqScore.setAttribute("name", "score_"+subject.parent_index);
		acqScore.value = subject.score;
		acqScore.setAttribute("readOnly", "readOnly");
		
	}
	if(subject.score > 0 && acqScore == null){
		score.value = subject.score;
		
	}
	
	}


function addRow()
{
	
	
	var subject_tbody = document.getElementById('subject_tbody');
	var row = subject_tbody.insertRow(subject_tbody.rows.length);
	var row_cnt=subject_tbody.rows.length;   //파라미터값 전달  
	document.getElementsByName("row_cnt")[0]. value = row_cnt;
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	
	
	cell1.innerHTML = "<input type=\"hidden\" name=\"subId_"  +row_cnt + "\"> <td>" + "<input type=\"text\" name=\"subName_"  +row_cnt + "\" readonly=\"readonly\">"
						+ "<a href=\"#\" onclick=\"openRegSearchSubject("  +row_cnt + ")\">" + "<input type=\"button\" value=\"검색\" class=\"btn btn-default\"></a></td>";
						
	cell2.innerHTML = "<td>" + "<input type=\"text\" name=\"score_"  +row_cnt + "\" readonly=\"readonly\" onkeydown=\"return onlyNumber(event)\" onkeyup=\"removeChar(event)\" placeholder=\"숫자만 입력해주세요\"></td>";
	
	cell3.innerHTML = "<td><input type=\"date\" name=\"scoreDate_"  +row_cnt + "\"></td>";
	
	//<input type=\"hidden\" name=\"row_cnt\" value="  +row_cnt + ">

}

function deleteRow(){
	var subject_tbody = document.getElementById('subject_tbody');
	var row_cnt=subject_tbody.rows.length;
	

	
	if(subject_tbody.rows.length > 1 && row_cnt > 0){
		subject_tbody.deleteRow(subject_tbody.rows.length-1);
		document.getElementsByName("row_cnt")[0]. value = row_cnt-1;
	} else {
		alert("항목삭제 할 수 없습니다.");
	}
	
	
}





/* function submitForm(){

	document.getElementById("form").submit();
	
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
	
	var row_cnt= document.getElementsByName("row_cnt")[0].value;
	
	alert(row_cnt);
	

	for(var i = 1; i<row_cnt+1; i++){
		
		/* if (document.getElementsByName("subId_" + i)[0].value == ""){
			alert("항목 명을 입력해주세요.");
			return false;
		} */
		
		if (document.getElementsByName("subName_" + i)[0].value == "")
		{
			alert("항목 명을 입력해주세요");
			document.getElementsByName("subName_" + i)[0].focus();
			return false;
		}
		if (document.getElementsByName("acqScore_" + i)[0].value == "")
		{
			alert("취득점수를 입력해주세요");
			document.getElementsByName("acqScore_" + i)[0].focus();
			return false;
		}
	
	}
		 alert("등록되었습니다.");
	
}




</script>



<%@include file="../include/footer.jsp"%>
