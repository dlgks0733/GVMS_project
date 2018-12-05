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
				<div class="box-header">
					<h3 class="box-title">수정</h3>
							
					
				</div>
				<!-- /.box-header -->

<form role="form" method = "post" action = "/subject?command=subModify" onsubmit="return validateEmptyVal()">
	<input type="hidden" name="subId" value="${subId}">
	<div class="box-body">
<c:forEach items="${sublist}" var="SubjectVO">
		<div class="form-group">
			<c:if test = "${major_num == 1}">
			<label >필수</label>
			<input type= "radio" name = "major" value = "필수" checked >
			<label >선택</label> 
			<input type= "radio" name = "major" value = "선택" >
			</c:if>
			<c:if test = "${major_num == 0}">
			<label >필수</label>
			<input type= "radio" name = "major" value = "필수" >
			<label >선택</label> 
			<input type= "radio" name = "major" value = "선택" checked>
			</c:if>
			
		</div>
		
		<div class="form-group">
		   <label >중분류</label>
		   <select name = "middle" id = "middle">
		   <c:if test = "${middle_num == 0}">
	       <option selected>영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
		   
		   <c:if test = "${middle_num == 1}">
	       <option >영역선택</option>
	       <option selected>외국어영역</option>
	       <option >학생활동영역</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	              
		   <c:if test = "${middle_num == 2}">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option selected>학생활동영역</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${middle_num == 3}">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       <option selected>정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${middle_num == 4}">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       <option >정보화영역</option>
	       <option selected>금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${middle_num == 5}">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option selected>공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${middle_num == 6}">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option selected>기타</option>
	       </c:if>
	       
	       </select>
	       
		</div>
<%-- 		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> 
			<input type="text" name="writer" 
			  class="form-control" value='${login.usid }' readonly>
		</div>	 --%>	
 		<div class="form-group">
 		
			<label >항목명</label> 
			<input type="text" name="subName" value = "${SubjectVO.subName}" placeholder="ex) 정보화영역">
		</div> 
		 		<div class="form-group">
			<label >점수</label> 
			<input type="text" name="subScore" id = "subScore"  value = "${SubjectVO.subScore}" placeholder="ex) 600">
		</div> 
	</c:forEach>
	</div>

	
	<!-- /.box-body -->

	<div class="box-footer">

	</div>
<div class="box-footer">
	<a type="button" href ="/subject?command=subList" class="btn btn-danger" style = "float : right">취소</a>
	<button type="submit" class="btn btn-primary" style = "float : right">수정</button>
	
</div>
</form>




<script>
/* 		$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "subject?command=subModify");
			formObj.attr("method", "post");
			formObj.submit();
			alert("수정이 완료되었습니다.");
		});
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "subject?command=subList");
			formObj.attr("method", "post");
		});
	});  */
		
 	function validateEmptyVal()
	{ 
		var major = false
		var majorArrEss = document.getElementsByName("major");
        
		for(var i=0;i<majorArrEss.length;i++){
        	if(majorArrEss[i].checked == true) {
                major = true;
                break;
                
        	}
            
        }
        if(!major){
            alert("필수/선택중 하나를 선택해주세요.");
            return false;
       
        }
        
        if($("[name=middle] > option:selected").val() == '영역선택'){
        	alert("영역을 선택해주세요.")
        	 return false;
        }

         if(document.getElementsByName("middle")[0].value == "외국어영역")
			{	
				document.getElementsByName("subScore")[0].focus();
				return true;
				
			}
         if (document.getElementsByName("subName")[0].value == "")
			{
				alert("항목명을 입력해주세요.");
				document.getElementsByName("subName")[0].focus();
				return false;
			}
         if (document.getElementsByName("subScore")[0].value == "")
			{
				alert("점수를 입력해주세요.");
				document.getElementsByName("subScore")[0].focus();
				return false;
			}
        	alert("수정되었습니다.");
        	return true;
        	
		} 
	
	$('#middle').ready(function(){
	
		if($("#middle option:selected").val() == '외국어영역'){
			$("#subScore").val('외국어영역은 점수입력이 불가능합니다.');
			$("#subScore").attr("disabled",true);
		}
		
		$('#middle').change(function(){
		$("#middle option:selected").each(function(){
			
			if($(this).val() == '외국어영역'){
				$("#subScore").val('외국어영역은 점수입력이 불가능합니다.');
				$("#subScore").attr("disabled",true);
			}else if($(this).val() != '외국어영역'){
				$("#subScore").val(''); // 텍스트박스 초기화
				$("#subScore").attr("disabled",false);
			}
			
		});
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

<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
