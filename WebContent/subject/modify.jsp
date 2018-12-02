<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>		
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Main content -->

<style>
.layer { display: none; }
.layer2 { display: none; }

</style>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수정</h3>
							
					
				</div>
				<!-- /.box-header -->

<form role="form" onsubmit="return validateEmptyVal()">
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
		
		<div class="form-group" id = "essmiddle" >
		   <label >중분류</label>
		   <select name = "middle" >
		   <c:if test = "${essmiddle_num == 0}">
	       <option selected>영역선택</option>
	       <option >외국어영역</option>
	       <option >학생활동영역</option>
	       </c:if>
	       	   
		   <c:if test = "${essmiddle_num == 1}">
	       <option >영역선택</option>
	       <option selected>외국어영역</option>
	       <option >학생활동영역</option>
	       </c:if>
	              
		   <c:if test = "${essmiddle_num == 2}">
	       <option >영역선택</option>
	       <option >외국어영역</option>
	       <option selected>학생활동영역</option>
	       </c:if>
	       </select>
	       </div>
	       
	       <div class="form-group" id = "optmiddle" style="display:none">
	       <label >중분류</label>
	       <select name = "middle">
	       
	       <c:if test = "${optmiddle_num == 0}">
	       <option selected>영역선택</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${optmiddle_num == 3}">
	       <option >영역선택</option>
	       <option selected>정보화영역</option>
	       <option >금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${optmiddle_num == 4}">
	       <option >영역선택</option>
	       <option >정보화영역</option>
	       <option selected>금융/회계영역</option>
	       <option >공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${optmiddle_num == 5}">
	       <option >영역선택</option>
	       <option >정보화영역</option>
	       <option >금융/회계영역</option>
	       <option selected>공모전영역</option>
	       <option >기타</option>
	       </c:if>
	       
		   <c:if test = "${optmiddle_num == 6}">
	       <option >영역선택</option>
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
		 
		 <div class="layer">
			<label >점수</label> 
			<input type="text"
				name="subScore1" class="form-control"  placeholder="ex) 외국어영역은 점수 입력이 불가합니다." disabled>
		</div> 
		 	
		 	<div class="layer2">
			<label >점수</label> 
			<input type="text" name="subScore" class = "form-control" value = "${SubjectVO.subScore}" placeholder="ex) 600">
		</div> 
	</c:forEach>
	</div>

	
	<!-- /.box-body -->

	<div class="box-footer">

	</div>
<div class="box-footer">
	<button type="button" class="btn btn-warning">수정</button>
	<button type="reset" class="btn btn-danger" Onclick = "javascript:history.back(-1)">취소</button>
</div>
</form>




<script languge = "javascript" >
		$(document).ready(function() {

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

	}); 
		
			function validateEmptyVal()
		{
			if (document.getElementsByName("major")[0].value == "")
			{
				alert("필수/선택 중 하나를 선택해주세요.");
				document.getElementsByName("major")[0].focus();
				return false;
			}
			if (document.getElementsByName("middle")[0].value == "")
			{
				alert("영역을 선택해주세요.");
				document.getElementsByName("middle")[0].focus();
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
			
			return true;
		} 
		//항목 숨기고 보여주기	
			jQuery('#essmiddle').change(function() {
				var state = jQuery('#essmiddle option:selected').val();
				if(state == '외국어영역') {
					jQuery('.layer').show();
					jQuery('.layer2').hide();
				}else{
					jQuery('.layer').hide();
					jQuery('.layer2').show();
				}
				
				
			});
		
			jQuery('#optmiddle').change(function() {
				var state = jQuery('#optmiddle option:selected').val();
				if(state == '선택영역선택') {
					jQuery('.layer').hide();
					jQuery('.layer2').show();
				}else{
					jQuery('.layer').hide();
					jQuery('.layer2').show();
				}
			});
		
			$(document).ready(function() {
				if("major" == "필수"){
				$('input:radio[name="major"][value="필수"]').prop('checked', true);
				}
				$("input[name='major']:radio").change(function () {
			        //라디오 버튼 값을 가져온다.
			        var major = this.value;
				
			    if(major == "필수"){//필수인 경우
			        $( "#essmiddle" ).show();
			    	$( "#optmiddle") .hide();
			    }else if(major == "선택"){//선택인 경우	
			        $( "#optmiddle" ).show();
			        $( "#essmiddle" ).hide();
			    }
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
