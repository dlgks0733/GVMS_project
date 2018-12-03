<!-- mis 등록 화면 -->

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
					<h3 class="box-title"><span class="must-mark">*</span>
					날짜 <input type="date" name="scoreDate" ></h3>					
					<table class="table table-bordered">
						<tr>
							<th style="text-align: center;"><input type ="checkbox" name="stuIdAll" /></th>
							<th style="text-align: center;">학번</th>
							<th style="text-align: center;">이름</th>
						</tr>

						<c:forEach items="${misListRegist}" var="MisVO">
							<tr>
								<td style="text-align: center;"><input type ="checkbox" name="stuId" value="${MisVO.stuId}"/></td>
								<td style="text-align: center;">${MisVO.stuId}</td>
								<td style="text-align: center;">${MisVO.stuName}</td>
							</tr>
						</c:forEach>
					</table>	
					<div class="box-footer btn-group-center">				
						 <button type="button" class="btn btn-primary">등록</button>
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
					<h3 class="box-title">MIS 출결 등록</h3>
				</div>
				<div class="box-body">
				<form role="form" method="post">
					<b><span class="must-mark">*</span>
					날짜 </b><input type="date" name="scoreDate" >					
					<table class="table table-bordered">
						<tr>
							<th style="text-align: center;"><input type ="checkbox" name="stuIdAll" /></th>
							<th style="text-align: center;">학번</th>
							<th style="text-align: center;">이름</th>
						</tr>

						<c:forEach items="${misListRegist}" var="MisVO">
							<tr>
								<td style="text-align: center;"><input type ="checkbox" name="stuId" value="${MisVO.stuId}"/></td>
								<td style="text-align: center;">${MisVO.stuId}</td>
								<td style="text-align: center;">${MisVO.stuName}</td>
							</tr>
						</c:forEach>
					</table>	
					<div class="box-footer btn-group-center">				
						 <button type="button" class="btn btn-primary">등록</button>
						 <a href="/mis?command=mis_list_form" type="button" class="btn btn-default" >취소</a>
					</div>
					</form>

				</div>
				<!-- /.box-body -->
				
		</div>
		<!--/.col (left) -->

	</div>
	</div>
	<!-- /.row -->
</section> --%>


<script>
//전체 체크박스 클릭시 전체 checked
$("input[name=stuIdAll]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='stuId']").prop("checked", true);
	} else{
		$("input[name='stuId']").prop("checked", false);
	}
});

//알람창
$(document).ready(function() {

	var formMis = $("form[role='form']");

	console.log(formMis);
	
	$(".btn-primary").on("click", function() {
		formMis.attr("action", "/mis?command=mis_regist");
		formMis.attr("method", "post");
		
		var isChk = false; //stuid 배열 check하는 변수 isChk 
		
        var stuIdArrEss = document.getElementsByName("stuId");
        
        //학번 배열이 체크되었을 때 isChk true
        for(var i=0;i<stuIdArrEss.length;i++){
            if(stuIdArrEss[i].checked == true) {
                isChk = true;
                break;
            }
        }
            
        if (document.getElementsByName("scoreDate")[0].value == "")
    	{
    		alert("날짜를 선택하시오.");
    		document.getElementsByName("scoreDate")[0].focus();
    		return;
    	}
        
        if(!isChk){
            alert("학번을 선택하시오.");
            return;
        }
        
        else{
        	if (confirm("정말 등록하시겠습니까??") == true){   
			formMis.submit();
        	}else{  
        	    return;
        	}
		}
		

	});
	
	//jquery 달력
	 $(".scoreDate").datepicker();

}); 


</script>

<%@include file="../include/footer.jsp"%>
