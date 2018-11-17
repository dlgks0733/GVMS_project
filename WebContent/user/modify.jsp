<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">관리자 수정</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" class="form-horizontal">
					<input type="hidden" name="validation">
					<div class="box-body box-form-custom">
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								아이디
							</label>
							<div class="col-sm-10">
								<input type="text" name='adminId' class="form-control"
									placeholder="아이디를 입력해주세요" disabled="disabled" value="${admin.adminId}">
								<span id="validateIdMessage"></span>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								이름
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input type="text" name='adminName' class="form-control"
									placeholder="이름을 입력해주세요" value="${admin.adminName}">
								<span id="validatePwEmailMessage"></span>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								소속기관
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<select name="compNum" class="form-control">
									<c:forEach var="comps" items="${compList}">
										<c:choose>
											<c:when test="${amdin.compNum == comps.compNum}">
												<option value="${comps.compNum}"
													selected="selected">${comps.compName}></option>										
											</c:when>
											<c:otherwise>
												<option value="${comps.compNum}">${comps.compName}</option>																					
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<span id="validateCompanyMessage"></span>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								전화번호
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input id="cellPhone" type="text" name='adminPhone' value="${admin.adminPhone }" maxlength="13" class="form-control" placeholder="ex) 01011112222">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								이메일
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input type="text" name='adminEmail' class="form-control"
									placeholder="이메일 주소를 입력해주세요" value="${admin.adminEmail}">
								<span id="validateEmailMessage"></span>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								비밀번호변경
							</label> 
							<div class="col-sm-10">
								<label for="pwModOk">
									<input type="checkbox" id="pwModOk" value="${admin.adminEmail}" hidden="true" />
									<i id="pwModOkIcon" class="fa fa-toggle-off" aria-hidden="true"></i>
								</label>
								<span id="validateEmailMessage"></span>
							</div>
						</div>
						<div id="pwModDiv"  hidden="true">
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								변경할 비밀번호
							</label> 
							<div class="col-sm-10">
								<input type="password" id="adminPw" name='adminPw' class="form-control"
									placeholder="비밀번호를 입력해주세요">
									<span id="validatePwMessage"></span>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								비밀번호 확인
							</label> 
							<div class="col-sm-10">
								<input type="password" id="adminPwConfirm" name='adminPwConfirm' class="form-control"
									placeholder="비밀번호 확인을 위해 한번 더 입력해주세요">
								<span id="validatePw2Message"></span>
							</div>
						</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-danger" onclick="remove()">삭제</button>
						<button type="submit" class="btn btn-primary" id="submitbutton" onclick="return validateEmptyVal()">수정</button>
						<button type="button" class="btn btn-cancel">취소</button>
					</div>
				</form>

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

<script>

$(document).ready(function() {
	
	// 전화번호 입력 폼에 맞게 자동으로 해주는 함수
	$('#cellPhone').focus();
	$('#cellPhone').blur();
	
	// 취소버튼 누르면 Criteria 유지한 채로 목록으로 돌아가게 하는 함수
	$(".btn-cancel").on("click", function(){
		  self.location = "/admin/user/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
		  + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
	// 비밀번호 변경 화면을 켜고 끄는 기능
	$("#pwModOk").on("change", function() {
		var checkbox = $(this);
		var pwInputDiv = $("#pwModDiv")
		
		if (checkbox.prop("checked")) {
			$("#pwModOkIcon").attr("class", "fa fa-toggle-on");
			checkbox.prop("checked");
			
			pwInputDiv.prop("hidden", false);
		} else {
			$("#pwModOkIcon").attr("class", "fa fa-toggle-off");
			!checkbox.prop("checked");
			
			$("#pwModDiv .form-control").val("");
			pwInputDiv.prop("hidden", true);
		}
	});
});



/**
 * 삭제 요청하는 함수
 */
function remove()
{
	var newForm	= document.createElement("form");
	newForm.setAttribute('method',"post");
	newForm.setAttribute('action',"/admin/user/remove");
	
	var adminId = document.createElement("input"); //input element, text
	adminId.setAttribute('type',"hidden");
	adminId.setAttribute('name',"adminId");
	adminId.setAttribute('value',
			document.getElementsByName("adminId")[0].value);
	
	newForm.appendChild(adminId);
	document.getElementsByTagName('body')[0].appendChild(newForm);
	
	newForm.submit();
}


/**
 * 아이디, 이메일, 전화번호 중복검사와
 * 빈 값이 있는지 검사를 해서 유효성에 따라
 * submit 버튼을 활성화, 비활성화시키는 함수
 */
window.setInterval(function(){

 	// 인풋에 있는 모든 값들을 합쳐서
 	// 어드민 객체를 생성함
 	var adminId = document.getElementsByName("adminId")[0].value;
 	var adminPw = document.getElementsByName("adminPw")[0].value;
 	var adminName = document.getElementsByName("adminName")[0].value;
 	var adminPhone = document.getElementsByName("adminPhone")[0].value;
 	var adminEmail = document.getElementsByName("adminEmail")[0].value;
 	var compNum = document.getElementsByName("compNum")[0].value;
	
 	// 완성된 JSON 어드민 객체
 	var admin = {
 			adminId : adminId,
 			adminPw : adminPw,
 			adminName : adminName,
 			adminPhone : adminPhone,
 			adminEmail : adminEmail,
 			compNum : compNum
 	};

 	// 백엔드에서 유효성 검사를 거친 뒤
 	// 메시지를 받음
 	$.ajax({
         url : 'validate',
         type : 'POST',
         dataType : 'JSON',
         contentType : 'application/json',
         data: JSON.stringify(admin),
         success : function (msg) {
        	
        	// 유효성 검사값을 저장하는 변수
             var invalid = false;
        	 
         	// 백엔드와의 통신이 성공하면 유효성 검사 결과를 받고
         	// 이메일, 전화번호 각각의 유효성 검사 결과 메시지를
         	// 인풋 밑에 표시해줌
 			if (msg.emailMsg == "emailFailed")
 			{
 				if ("${admin.adminEmail}" != admin.adminEmail)
 				{
 					document.getElementById("validateEmailMessage")
 					.textContent = "이메일이 중복되었습니다";
 					invalid = true;
 				}
 				else
 				{
 					document.getElementById("validateEmailMessage")
 					.textContent = "";
 					invalid = false;
 				}
 			}
 			if (msg.emailMsg == "emailOk")
 			{
 				document.getElementById("validateEmailMessage")
 				.textContent = "";
 			}
 			if (msg.phoneMsg == "phoneFailed")
 			{
 				if ("${admin.adminPhone}" != admin.adminPhone)
 				{
 					document.getElementById("validatePhoneMessage")
 					.textContent = "전화번호가 중복되었습니다";
 					invalid = true;
 				}
 				else
 				{
 					document.getElementById("validatePhoneMessage")
 					.textContent = "";
 					invalid = false;
 				}
 			}
 			if (msg.phoneMsg == "phoneOk")
 			{
 				document.getElementById("validatePhoneMessage")
 				.textContent = "";
 			}
 			
 			document.getElementById("submitbutton").disabled = invalid;
         }
     });
	
 }, 500);

//submit 버튼을 누를 때 빈 값을 찾아서
//사용자에게 입력을 유도하는 함수
function validateEmptyVal()
{
	if (document.getElementsByName("adminId")[0].value == "")
	{
		alert("아이디를 입력해주세요");
		document.getElementsByName("adminId")[0].focus();
		return false;
	}
	// 패스워드 변경 모드가 체크 상태이면 실행하는 유효성검사
	if (document.getElementById("pwModOk").checked == true)
	{
		if (document.getElementsByName("adminPw")[0].value == "")
		{
			alert("비밀번호를 입력해주세요");
			document.getElementsByName("adminPw")[0].focus();
			return false;
		}
		if (document.getElementsByName("adminPwConfirm")[0].value == "")
		{
			alert("비밀번호를 한번 더 입력해주세요");
			document.getElementsByName("adminPwConfirm")[0].focus();
			return false;
		}
		if (document.getElementsByName("adminPw")[0].value
				!= document.getElementsByName("adminPwConfirm")[0].value)
		{
			alert("비밀번호가 일치하지 않습니다");
			document.getElementsByName("adminPwConfirm")[0].focus();
			return false;
		}
	}
	if (document.getElementsByName("adminName")[0].value == "")
	{
		alert("이름을 입력해주세요");
		document.getElementsByName("adminName")[0].focus();
		return false;
	}
	if (document.getElementsByName("adminPhone")[0].value == "")
	{
		alert("전화번호를 입력해주세요");
		document.getElementsByName("adminPhone")[0].focus();
		return false;
	}
	if (document.getElementsByName("adminEmail")[0].value == "")
	{
		alert("이메일주소를 입력해주세요");
		document.getElementsByName("adminEmail")[0].focus();
		return false;
	}
	
	return true;
}

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var cellPhone = document.getElementById('cellPhone');

cellPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}

cellPhone.onfocusin = function(event){
	event = event || window.event;
	var _val = this.value.trim();
	this.value = autoHypenPhone(_val) ;
}

</script>