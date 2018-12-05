<!-- mis 상세 조회 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="/include/header.jsp"%>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">MIS 출결 등록</h2>
				</div>	
				<div class="box-wrap">
					<div class="box-body">
						<form role="form" method="post">
						<input type="hidden" name="stuId" value="${stuId}">
						<table class="table table-bordered">
							<c:forEach items="${misListReadScoreSum}" var="MisVO">
								<tr>
									<th style="text-align: center;">학번</th>
									<th style="text-align: center;">${MisVO.stuId}</th>
									<th style="text-align: center;">이름</th>
									<th style="text-align: center;">${MisVO.stuName}</th>
									<th style="text-align: center;">총점</th>
									<th style="text-align: center;">${MisVO.scoreSum}</th>
								</tr>
							</c:forEach>
						</table>

						<table class="table table-bordered">
							<tr>
								<th style="text-align: center;"><input type="checkbox" name="scoreIdAll" /></th>
								<th style="text-align: center;">날짜</th>
								<!-- <th style="text-align: center;">수정날짜</th> -->
								<th style="text-align: center;">점수</th>
							</tr>
							<c:choose>
								<c:when test="${not empty misListRead}">
									<c:forEach items="${misListRead}" var="MisVO">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="scoreId"
												value="${MisVO.scoreId}"></td>
											<td style="text-align: center;">${MisVO.scoreDate}</td>
											<%-- <td style="text-align: center;"><input type="date"
														name="scoreDate_${MisVO.scoreId}"
														value="${MisVO.scoreDate}"></td> --%>
											<td style="text-align: center;">${MisVO.subScore}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" class="txt_center" align="center"><b>삭제할
												데이터가 없습니다.</b></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						
						<div class="box-footer btn-group-center">			
						<button type="button" class="btn btn-danger">삭제</button>	
						<a href="/mis?command=mis_list_form" type="button" class="btn btn-default" >취소</a>
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
					<h3 class="box-title">MIS 상세 조회</h3>
				</div>
				<div class="box-body">
					<form role="form" method="post">
						<input type="hidden" name="stuId" value="${stuId}">
						<table class="table table-bordered">
							<c:forEach items="${misListReadScoreSum}" var="MisVO">
								<tr>
									<th style="text-align: center;">학번</th>
									<th style="text-align: center;">${MisVO.stuId}</th>
									<th style="text-align: center;">이름</th>
									<th style="text-align: center;">${MisVO.stuName}</th>
									<th style="text-align: center;">총점</th>
									<th style="text-align: center;">${MisVO.scoreSum}</th>
								</tr>
							</c:forEach>

						</table>

						<table class="table table-bordered">
							<tr>
								<td style="text-align: center;"><input type="checkbox" name="scoreIdAll" /></td>
								<td style="text-align: center;">일자</td>
								<td style="text-align: center;">점수</td>
							</tr>
							<c:choose>
								<c:when test="${not empty misListRead}">
									<c:forEach items="${misListRead}" var="MisVO">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="scoreId"
												value="${MisVO.scoreId}"></td>
											<td style="text-align: center;">${MisVO.scoreDate}</td>
											<td style="text-align: center;">${MisVO.subScore}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" class="txt_center" align="center"><b>삭제할
												데이터가 없습니다.</b></td>
									</tr>
								</c:otherwise>

							</c:choose>
						</table>
						<div class="box-footer btn-group-center">			
						<button type="button" class="btn btn-danger" id="submitbutton">삭제</button>
						<a href="/mis?command=mis_list_form" type="button"
							class="btn btn-default">취소</a>
							</div>
					</form>
				</div> <!-- <div class="box-body"> -->
				
			</div> <!-- <div class="box"> -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section> --%>


<script>
	//전체 체크박스 클릭시 전체 checked
	$("input[name=scoreIdAll]").click(function() {
		var chk = $(this).is(":checked");

		if (chk) {
			$("input[name='scoreId']").prop("checked", true);
		} else {
			$("input[name='scoreId']").prop("checked", false);
		}
	});

	//scoreId Null 값일 경우 알람창이 뜨는 스크립트
	$(document).ready(function() {

		var formMis = $("form[role='form']");
		
		/* 
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
 */
		 $(".btn-danger").on("click", function() {
			formMis.attr("action", "mis?command=mis_delete");
			formMis.attr("method", "post");

			var isChk = false;

			var arrEss = document.getElementsByName("scoreId");

			for (var i = 0; i < arrEss.length; i++) {
				if (arrEss[i].checked == true) {
					isChk = true;
					break;
				}
			}

			if (!isChk) {
				alert("삭제 내용이 없습니다.");
			} else {
				if (confirm("정말 삭제하시겠습니까??") == true) {
					formMis.submit();
				} else {
					return;
				}
			}
		}); 

 		//jquery 달력
		 $(".scoreDate").datepicker();
 
	});
</script>

<%@include file="../include/footer.jsp"%>
