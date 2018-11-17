<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="/resources/css/css-plugin-collections.css" rel="stylesheet" type="text/css">

<%@include file="../include/header.jsp"%>
<script type="text/javascript">
	//AJAX select box
	function compSelect(compname) {
		$.ajax({
			type : "POST",
			url : "testSelect",
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data : {
				param : compname
			},
			success : function(result) {

				//SELECT BOX 초기화           
 				$("#cournum").find("option").remove().end().append(
						"<option value=''>선택</option>"); 

				//배열 개수 만큼 option 추가
				$.each(result, function(i) {
					$("#cournum").append(
							"<option value='"+result[i].cournum +"'>" + result[i].courname
									+ "</option>")
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류가 발생하였습니다.");
			}
		});
	}
</script>

<!-- include input widgets; this is independent of Datepair.js -->
<script type="text/javascript">
	$(function() {
		
		$('#datetimepicker6').datetimepicker();
		$('#datetimepicker7').datetimepicker({
			useCurrent : true
		//Important! See issue #1075
		});
		
		
		$("#datetimepicker6").on("dp.change", function(e) {
			$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
		});
		$("#datetimepicker7").on("dp.change", function(e) {
			$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
		});
	});
	
</script>

<script type="text/javascript">

//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
	
     var num01;
     var num02;
     num01 = obj.value;
     num02 = num01.replace(rgx1,"");
     num01 = setComma(num02);
     obj.value =  num01;

}

function setComma(inNum){
     
     var outNum;
     outNum = inNum; 
     while (rgx2.test(outNum)) {
          outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
      }
     return outNum;

}

</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수강 수정</h3>
				</div>
				<!-- /.box-header -->

				<form name="frm" role="form" onsubmit="return validateEmptyVal()" method="post" action="modify"  class="form-horizontal">
					<div class="box-body box-form-custom">
						 <input type='hidden' name="appnum" value="${applyDTO.appnum}">
						 	<div class="form-group input-with-button">
							<label for="exampleInputEmail1" class="col-sm-2 control-label pull-left">학원생<span class="must-mark">*</span></label>
							      <input name="stuid"   class="form-control" type="hidden">
							      <div class="col-md-3 col-xs-4 left-input">
							      	<input name="stuname" class="form-control" type="text" value ="${applyDTO.stuname }" readonly="readonly">
								  </div>
								  <div class="col-md-7 col-xs-5 right-button">
									  <button type = "button" onClick = "stuNameCheck()" id = "idCheck">
										<i class="fa fa-search" aria-hidden="true"></i>
									  </button>
								  </div>
							</div>
						<div class="form-group input-double">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								수강 과목<span class="must-mark">*</span></label>
							<div class="col-sm-4">

								<select name="compno" class="form-control" onchange="compSelect(this.value)">
									<c:forEach var="list" items="${list}">
										<c:if test="${list.compnum eq applyDTO.compnum }">
											<option value="${list.compname}" selected="selected">${list.compname}</option>
										</c:if>
										<c:if test="${list.compnum ne applyDTO.compnum }">
											<option value="${list.compname}">${list.compname}</option>
										</c:if>
									</c:forEach>
								</select>

							</div>


							<div class="col-sm-6">
								<select id="cournum" name="cournum" class="form-control">
								<c:forEach var="list" items="${courList}">
										<c:if test="${list.compname eq applyDTO.compname }">
											<option value="${list.cournum }" selected="selected">${list.courname }</option>
										</c:if>
										<c:if test="${list.compname ne applyDTO.compname }">
											<option value="${list.cournum }">${list.courname }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>


						<div class="form-group input-double">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								수강 기간<span class="must-mark">*</span></label>


							<div class="col-sm-4">
								<div class='input-group date' id='datetimepicker6'>
									<span class="input-group-addon"> 
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
									<input type='text' class="form-control" name="sdate" value="${sdate }" />
								</div>
							</div>
							<div class="col-sm-2 wave-mark">
							~
							</div>
							<div class="col-sm-4">
								<div class='input-group date' id='datetimepicker7'>
									<span class="input-group-addon"> 
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
									<input type='text' class="form-control" name="edate" value="${edate }" /> 
								</div>
							</div>




						</div>
						
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">수강횟수<span class="must-mark">*</span></label>
							<div class="col-sm-10">
							      <input name="dayinfo" class="form-control" type="text" 
							      value ="${applyVO.dayinfo }" >
							</div>
						</div>

						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">수강료<span class="must-mark">*</span></label>
							<div class="col-sm-10">
								 <input name="price" class="form-control" type="text" 
							      onchange="getNumber(this);" onkeyup="getNumber(this);" 
							      placeholder="수강료을 입력하세요." style="text-align:right;" value="${applyVO.price }"> 

							<%-- 	<input name="price" class="form-control" type="number"
									placeholder="수강료을 입력하세요." style="text-align: right;"  value="${applyVO.price }" > --%>
							</div>
						</div>

						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
							결제링크 </label>
							<div class="col-sm-10">
								<input name="link" class="form-control" type="text"
									value="${applyVO.link }">
							</div>
						</div>

						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								수강설명<span class="must-mark">*</span></label>
							<div class="col-sm-10">
								<textarea rows="5" name="spec" class="form-control">${applyVO.spec }</textarea>
							</div>
						</div>


					</div>
					<!-- /.box-body -->

				</form>
				<div class="box-footer btn-group-center">
					<button type="button" class="btn btn-danger">삭제</button>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="submit" class="btn btn-cancel">취소</button>
				</div>


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

<script>
	$(document)
			.ready(
					function() {

						var formObj = $("form[role='form']");

						console.log(formObj);

						$(".btn-danger").on("click", function() {
							formObj.attr("action", "/admin/apply/remove");
							formObj.submit();
						});

						$(".btn-cancel")
								.on(
										"click",
										function() {
											self.location = "/admin/apply/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
										});

						$(".btn-primary").on("click", function() {
							formObj.submit();
						});
					});
	
	//유효성 검사
	function validateEmptyVal()
	{
		if (document.getElementsByName("cournum")[0].value == "")
		{
			alert("과목을 선택해주세요");
			document.getElementsByName("cournum")[0].focus();
			return false;
		}
		if (document.getElementsByName("sdate")[0].value == "")
		{
			alert("수강 시작일자를 선택해주세요");
			document.getElementsByName("sdate")[0].focus();
			return false;
		}
		if (document.getElementsByName("edate")[0].value == "")
		{
			alert("수강 종료일자를 선택해주세요");
			document.getElementsByName("edate")[0].focus();
			return false;
		}
		if (document.getElementsByName("dayinfo")[0].value == "")
		{
			alert("수강 횟수를 입력해주세요");
			document.getElementsByName("dayinfo")[0].focus();
			return false;
		}
		if (document.getElementsByName("price")[0].value == "")
		{
			alert("수강료를 입력해주세요");
			document.getElementsByName("price")[0].focus();
			return false;
		}
		if (document.getElementsByName("spec")[0].value == "")
		{
			alert("수강설명을 입력해주세요");
			document.getElementsByName("spec")[0].focus();
			return false;
		}


		return true;
	}
	
	function stuNameCheck() {
		var url = "/admin/apply/search"
				window.open(url, "_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
	}
	
</script>
<%@include file="../include/footer.jsp"%>
