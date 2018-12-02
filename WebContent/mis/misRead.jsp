<!-- mis 상세 조회 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="/include/header.jsp"%>

<!-- Main content -->
<section class="content">
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
					<input type="hidden" name ="stuId" value="${stuId}">
					<table class="table table-bordered">
						<c:forEach items="${misListReadScoreSum}" var="MisVO">
							<tr>
							<th>학번</th>
							<th>${MisVO.stuId}</th>
							<th>이름</th>
							<th>${MisVO.stuName}</th>
							<th>총점</th>
							<th>${MisVO.scoreSum}</th>
						</tr>
						</c:forEach>
						
					</table>
	
					<p>
					
					<table class="table table-bordered">
					
					<tr>
					<td><input type ="checkbox" name="scoreIdAll" /></td>
					<td>일자</td>
					<td>점수</td>
					</tr>			
						<c:forEach items="${misListRead}" var="MisVO">
							<tr>
								<td><input type ="checkbox" name="scoreId" value="${MisVO.scoreId}"></td>
								<td>${MisVO.scoreDate}</td>
								<td>${MisVO.subScore}</td>
							</tr>
						</c:forEach>
					</table>
						 <button type="button" class="btn btn-danger" id="submitbutton">삭제</button>
						 
					</form>
							 
				

				</div>
				<!-- /.box-body -->
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- /.content-wrapper -->

<script>

//전체 체크박스 클릭시 전체 checked
$("input[name=scoreIdAll]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='scoreId']").prop("checked", true);
	} else{
		$("input[name='scoreId']").prop("checked", false);
	}
});

//scoreId Null 값일 경우 알람창이 뜨는 스크립트
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
$(".btn-danger").on("click", function(){
		formObj.attr("action", "mis?command=mis_delete");
		formObj.attr("method", "post");	
		
		var isChk = false;
		
        var arrEss = document.getElementsByName("scoreId");
        
        for(var i=0;i<arrEss.length;i++){
            if(arrEss[i].checked == true) {
                isChk = true;
                break;
            }
        }
    
        if(!isChk){
            alert("삭제 내용이 없습니다.");
        } else{
        	if (confirm("정말 삭제하시겠습니까??") == true){   
				formObj.submit();
        	}else{  
        	    return;
        	}
		}
	})
	
});


</script>

<%@include file="../include/footer.jsp"%>
