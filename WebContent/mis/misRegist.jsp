<!-- mis 등록 화면 -->

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
					<h3 class="box-title">MIS 출결 등록</h3>
				</div>
				<div class="box-body">
				<form role="form" method="post" onsubmit="return validateEmptyVal()">
					*날짜 <input type="date" name="scoreDate" >
					<div style="overflow-y: scroll; height:400px;">	
					<table class="table table-bordered">
						<tr>
							<th><input type ="checkbox" name="stuIdAll" /></th>
							<th>학번</th>
							<th>이름</th>
						</tr>

						<c:forEach items="${misListRegist}" var="MisVO">
							<tr>
								<td><input type ="checkbox" name="stuId" value="${MisVO.stuId}"/></td>
								<td>${MisVO.stuId}</td>
								<td>${MisVO.stuName}</td>
							</tr>
						</c:forEach>
					</table>
					</div>
						 <button type="button" class="btn btn-primary">등록</button>
					</form>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">Footer</div>
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
		
        var scoreDateEss = document.getElementsByName("scoreDate");
        var stuIdAssEss = document.getElementsByName("stuId");
        
        //학번 배열이 체크되었을 때 isChk true
        for(var i=0;i<stuIdAssEss.length;i++){
            if(stuIdAssEss[i].checked == true) {
                isChk = true;
                break;
            }
        }
    
        if(!isChk){
            alert("학번을 선택하시오.");
        }
        else{
        	if (confirm("정말 삭제하시겠습니까??") == true){   
				formObj.submit();
        	}else{  
        	    return;
        	}
		}
		
		formMis.submit();

	});
	

}); 

function validateEmptyVal()
{
	if (document.getElementsByName("scoreDate")[0].value == "")
	{
		alert("날짜를 선택하시오.");
		document.getElementsByName("scoreDate")[0].focus();
		return false;
	}
		return true;
} 

</script>

<%@include file="../include/footer.jsp"%>
