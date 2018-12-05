<!--Mis 전체 수정 화면 !-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="/include/header.jsp"%>

<script>

	$(document).ready(function(){
		
	    $(".scoreDate").datepicker();
	});

</script>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">MIS 출결 수정 화면</h2>
				</div>	
				<div class="box-wrap">
					<div class="box-body">
						<form method="post" action="/mis?command=mis_modify_select_from">
										<h5 class="box-title">날짜
										<input type="text" class="scoreDate" name="fromDate" value="${fromDate}"> &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
										<input type="text" class="scoreDate" name="toDate" value="${toDate}">
										<input type="submit" class="btn btn-default" value="조회">
										</h5>
							 </form>	
						<form role="form" method="post">
								<div class="row">
									<div class="col-md-2 col-xs-4">
										<select class="form-control" name="searchType">
											<option>이름</option>
											<!-- <option>학번</option> -->
										</select>
									</div>
									<div class="col-md-4 col-xs-8">
										<input type="text" class="form-control" placeholder="입력하시오" id="keyword" onkeydown="return enter(event)">
									</div>
									<div class="row">
										<table class="table table-bordered" id="user-table">
											<thead>
											<tr>
												<th style="text-align: center;"><input type ="checkbox" name="scoreIdAll" /></th>
												<th style="text-align: center;">학번</th>
												<th style="text-align: center;">이름</th>
												<th style="text-align: center;">날짜</th>
												<th style="text-align: center;">수정날짜</th>
											</tr>
											</thead>
										<c:choose>
											<c:when test="${not empty misModifyList}">
											<c:forEach items="${misModifyList}" var="MisVO">
												<tbody>
												<tr>
													<td style="text-align: center;"><input type="checkbox" name="scoreId"
														value="${MisVO.scoreId}"></td>
													<td style="text-align: center;">${MisVO.stuId}</td>
													<td style="text-align: center;">${MisVO.stuName}</td>
													<td style="text-align: center;">${MisVO.scoreDate}</td>
													<td style="text-align: center;"><input type="date"
														name="scoreDate_${MisVO.scoreId}"
														value="${MisVO.scoreDate}"></td>
												</tr>
												</tbody>
											</c:forEach>
											</c:when>
												<c:otherwise>
												<tr>
													<td colspan="7" class="txt_center" align="center"><b>수정할
													데이터가 없습니다.</b></td>
												</tr>
												</c:otherwise>
									</c:choose>
										</table>
								<div class="box-footer btn-group-center">
									<button type="button" class="btn btn-primary">수정</button>-
									<a href="/mis?command=mis_list_form" type="button" class="btn btn-default">취소</a>
								</div>
									</div>
								</div>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%-- <section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">MIS 전체 수정 화면</h3>
				</div>
				
					<div class="box-body">
						<div class="box-keyword">
							<form method="post" action="/mis?command=mis_modify_select_from">
										<input type="date" name="fromDate" value="${fromDate}"> &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
										<input type="date" name="toDate" value="${toDate}">
										<input type="submit" class="btn btn-default" value="검색">
										
							 </form>						
							<form role="form" method="post">
								<div class="row">
									<div class="col-md-2 col-xs-4">
										<select class="form-control" name="searchType">
											<option>이름</option>
											<!-- <option>학번</option> -->
										</select>
									</div>
									<div class="col-md-4 col-xs-8">
										<input type="text" class="form-control" placeholder="입력하시오" id="keyword" onkeydown="return enter(event)">
									</div>
									<div class="row">
										<table class="table table-bordered" id="user-table">
											<thead>
											<tr>
												<th style="text-align: center;">no</th>
												<th style="text-align: center;">학번</th>
												<th style="text-align: center;">이름</th>
												<th style="text-align: center;">날짜</th>
												<th style="text-align: center;">수정날짜</th>
											</tr>
											</thead>
											
											<c:forEach items="${misModifyList}" var="MisVO">
												<tbody>
												<tr>
													<td style="text-align: center;"><input type="checkbox" name="scoreId"
														value="${MisVO.scoreId}"></td>
													<td style="text-align: center;">${MisVO.stuId}</td>
													<td style="text-align: center;">${MisVO.stuName}</td>
													<td style="text-align: center;">${MisVO.scoreDate}</td>
													<td style="text-align: center;"><input type="date"
														name="scoreDate_${MisVO.scoreId}"
														value="${MisVO.scoreDate}"></td>
												</tr>
												</tbody>
											</c:forEach>
										</table>
								<div class="box-footer btn-group-center">
								<a href="/mis?command=mis_list_form" type="button" class="btn btn-default" style = "float : right">취소</a>
								<button type="button" class="btn btn-primary" style = "float : right">수정</button>
								</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.col (left) -->

	<!-- /.row -->
</section> --%>


<script>

//전체 체크박스 클릭시 전체 checked
$("input[name=scoreIdAll]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='scoreId']").prop("checked", true);
	} else{
		$("input[name='scoreId']").prop("checked", false);
	}
	
	//jquery 달력
	 $(".scoreDate").datepicker();
});

//이름 검색기능
$(document).ready(function() {
	$("#keyword").keyup(function(){
		var k = $(this).val();
		$("#user-table > tbody > tr").hide();
		var temp = $("#user-table > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
		
		$(temp).parent().show();
	})
})

//엔터막기	
function enter(e){
	if(window.event){
		key = window.event.keyCode;
	}else if(e){
		key = e.which;
	}
	if(key==13){
		return false    
	}
}

//알람창
$(document).ready(function() {

	var formMis = $("form[role='form']");

	console.log(formMis);
	
	$(".btn-primary").on("click", function() {
		formMis.attr("action", "/mis?command=mis_modify");
		formMis.attr("method", "post");
		
		var isChk = false; //scoreid 배열 check하는 변수 isChk 
		
        var scoreIdArrEss = document.getElementsByName("scoreId");
        
        //학번 배열이 체크되었을 때 isChk true
        for(var i=0;i<scoreIdArrEss.length;i++){
            if(scoreIdArrEss[i].checked == true) {
                isChk = true;
                break;
            }
        }
        
        if(!isChk){
            alert("수정할 대상을 체크하시오");
            return;
        }
        
        else{
        	if (confirm("정말 수정하시겠습니까?") == true){   
			formMis.submit();
        	}else{  
        	    return;
        	}
		}
		

	}); 


}); 


</script>

<%@include file="../include/footer.jsp"%>
