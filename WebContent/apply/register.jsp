<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="../include/header.jsp"%>

<link href="/resources/css/css-plugin-collections.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">


<!-- include input widgets; this is independent of Datepair.js -->
<script type="text/javascript">
	$(function() {
		$('#datetimepicker6').datetimepicker();
		$('#datetimepicker7').datetimepicker({
			useCurrent : false
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


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수강 등록</h3>
				</div>
				<!-- /.box-header -->

				<form name="frm" role="form" onsubmit="return validateEmptyVal()" method="post" class="form-horizontal">
					<div class="box-body box-form-custom">
						<div class="form-group input-with-button">
							<label for="exampleInputEmail1" class="col-sm-2 control-label pull-left">학원생<span class="must-mark">*</span></label>
						      <input name="stuid"   class="form-control" type="hidden">
						      <div class="col-md-3 col-xs-4 left-input">
						      	<input name="stuname" class="form-control" type="text" readonly="readonly">
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
									<option value="">기관 선택</option>
									<c:forEach var="list" items="${list}">
										<option value="${list.compname}">${list.compname}</option>
									</c:forEach>
								</select>

							</div>
							
							<div class="col-sm-6">
								<select id="cournum" name="cournum" class="form-control">
									<option value="">과목 선택</option>
								</select>
							</div>
						</div>
						
						
						<div class="form-group input-double">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								수강 기간<span class="must-mark">*</span></label>


							<div class="col-sm-4">
									<div class='input-group date' id='datetimepicker6'>
										<span class="input-group-addon" id="sdate-addon"> 
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
										<input type='text' aria-describedby="sdate-addon" class="form-control" name="sdate" placeholder="수강 시작 날짜을 입력하세요."/> 
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
										<input type='text' class="form-control" name="edate" placeholder="수강 종료 날짜을 입력하세요."/> 
									</div>
							</div>
							
							


						</div>
						
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">수강횟수<span class="must-mark">*</span></label>
							<div class="col-sm-10">
							      <input name="dayinfo" class="form-control" type="text" 
							      placeholder="예시) 매주 화,목" >
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">수강료<span class="must-mark">*</span></label>
							<div class="col-sm-10">
							     <input name="price" class="form-control" type="text" 
							      onchange="getNumber(this);" onkeyup="getNumber(this);" 
							      placeholder="수강료를 입력하세요." style="text-align:right;"> 
							       <!-- <input name="price" class="form-control" type="number" 
							      placeholder="수강료을 입력하세요." style="text-align:right;"> --> 
							</div>
						</div>

						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">결제 링크</label>
							<div class="col-sm-10">
							      <input name="link" class="form-control" type="text" placeholder="결제 링크를 입력하세요.">
							</div>
						</div>

						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">수강 설명<span class="must-mark">*</span></label>
							<div class="col-sm-10">
							      <textarea rows="5" name="spec" class="form-control" placeholder="수강에 대한 설명을 입력하세요."></textarea>
							</div>
						</div>


					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-primary">등록</button>
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

<script>

$(document).ready(function() {
	
	// 취소버튼 누르면 Criteria 유지한 채로 목록으로 돌아가게 하는 함수
	$(".btn-cancel").on("click", function(){
		  self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
		  + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
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
