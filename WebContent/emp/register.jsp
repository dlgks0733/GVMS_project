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
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">직원 등록</h3>
				</div>
				<!-- /.box-header -->

				<form id='registerForm' role="form" onsubmit="return validateEmptyVal()" method="post" class="form-horizontal">
					<div class="box-body box-form-custom">
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								직원이름
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input type="text" name='empname' class="form-control" placeholder="ex) 홍길동">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								직책
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input type="text" name='position' class="form-control" placeholder="ex) 강사">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								이메일
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input type="text" name='empemail' class="form-control" placeholder="ex) sample01@samp.le">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								휴대전화번호
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<input id="cellPhone" type="text" name='empphone' 
								maxlength="13" class="form-control" placeholder="ex) 01011112222">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">
								소속기관
								<span class="must-mark">*</span>
							</label> 
							<div class="col-sm-10">
								<select class="form-control" name="compnum">
									<c:forEach items="${compList}" var="comp" varStatus="status">
										<option value="${comp.compNum}">${comp.compName}</option>
									</c:forEach>
								</select>
							</div>							
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">페이스북 ID</label> 
							<div class="col-sm-10">
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon1">
										<i class="fa fa-facebook-square" aria-hidden="true"></i>
									</span>
									<input type="text" name='snslink1' class="form-control" aria-describedby="basic-addon1" placeholder="ex) johnDoe">
								</div>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">인스타그램 ID</label> 
							<div class="col-sm-10">
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon1">
										<i class="fa fa-instagram" aria-hidden="true"></i>
									</span>
									<input type="text" name='snslink2' class="form-control" aria-describedby="basic-addon1" placeholder="ex) johnDoe">
								</div>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">트위터 ID</label> 
							<div class="col-sm-10">
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon1">
										<i class="fa fa-twitter-square" aria-hidden="true"></i>
									</span>
									<input type="text" name='snslink3' class="form-control" aria-describedby="basic-addon1" placeholder="ex) johnDoe">
								</div>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">직원 설명</label> 
							<div class="col-sm-10">
								<textarea rows="5" name='empdesc' class="form-control" placeholder="긴 내용 입력용"></textarea>
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">직원 사진</label> 
							<div class="col-sm-10 form-upload-custom">
								<div class="fileDrop">
									<span>이미지를 업로드하려면 여기에 </span><br />
									<span>이미지 파일을(jpg, png)을 끌어 넣거나</span><br />
									<label for="fileUpload">여기</label>를 클릭해주세요
								</div>
								<input type="file" id="fileUpload">
								<input type="hidden" id="uploadCount">
								<hr />
								<div>
									<ul class="mailbox-attachments clearfix uploadedList">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<a href="/admin/emp/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" 
						   type="button" class="btn btn-cancel">취소</a>
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
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img">
	<img src="/admin/emp/{{imgsrc}}" alt="Attachment">
  </span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                       
</script>    

<script>

$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	formObj.submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		console.log(str);
		
		that.get(0).submit();
	});
	
	$(".btn-cancel").on("click", function(){
		  self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
		  + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});

var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var uploaded = $("#uploadCount").val();
	
	if (uploaded >= 1) {
		alert('이미지는 하나만 업로드할 수 있습니다.');
		return;
	}
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		  url: 'uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  var html = template(fileInfo);
			  
			  var str ="";
			  
			  if (checkImageType(data)){
				  $(".uploadedList").append(html);
				  
				  uploaded += 1;
				  $("#uploadCount").attr("value", uploaded);
			  } else {
				  alert('이미지 파일이 아닙니다.\n(jpg, png 확장자만 가능)');
			  }
			  
			  $(".uploadedList").append(str);
		  }
		});	
});


//클릭으로 파일 업로드할 때 호출되는 함수
$("#fileUpload").on("change", function (event) {
  event.preventDefault();
  
	var uploaded = $("#uploadCount").val();
	
	if (uploaded >= 1) {
		alert('이미지는 하나만 업로드할 수 있습니다.');
		return;
	}
	
  // 파일업로드 인풋에서 파일을 받음
  var file = document.getElementById("fileUpload").files[0];

  // 새로운 폼데이터를 생성
  var formData = new FormData();

  // 폼데이터에 파일을 붙임
  formData.append("file", file);

  // AJAX로 uploadAjax 메소드를 호출해서 파일을 업로드함
	$.ajax({
		  url: 'uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  var html = template(fileInfo);
			  
			  var str ="";
			  
			  if (checkImageType(data)){
				  $(".uploadedList").append(html);
				  
				  uploaded += 1;
				  $("#uploadCount").attr("value", uploaded);
			  } else {
				  alert('이미지 파일이 아닙니다.\n(jpg, png 확장자만 가능)');
			  }
			  
			  $(".uploadedList").append(str);
		  }
	});	
});


$(".uploadedList").on("click", ".delbtn", function(event){
		
	 var that = $(this); 
	 var uploaded = $("#uploadCount").val();
	 
	 
  $.ajax({
	   url:"deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
			   uploaded -= 1;
			   $("#uploadCount").attr("value", uploaded);
		   }
	   }
  });
});

$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
	
	var fileLink = $(this).attr("href");
	
	if(checkImageType(fileLink)){
		
		event.preventDefault();
				
		var imgTag = $("#popup_img");
		imgTag.attr("src", fileLink);
		
// 		console.log(imgTag.attr("src"));
				
		$(".popup").show('slow');
		imgTag.addClass("show");		
	}	
});

$("#popup_img").on("click", function(){
	
	$(".popup").hide('slow');
	
});	

// $("#registerForm").submit(function(event){
// 	event.preventDefault();
	
// 	var that = $(this);
	
// 	var str ="";
// 	$(".uploadedList .delbtn").each(function(index){
// 		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
// 	});
	
// 	that.append(str);

// 	that.get(0).submit();
// });

function getOriginalName(fileName){	

	if(checkImageType(fileName)){
		return;
	}
	
	var idx = fileName.indexOf("_") + 1 ;
	return fileName.substr(idx);
	
}


function getImageLink(fileName){
	
	if(!checkImageType(fileName)){
		return;
	}
	var front = fileName.substr(0,12);
	var end = fileName.substr(14);
	
	return front + end;
	
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

// 유효성 체크 
function validateEmptyVal()
{
	if (document.getElementsByName("empname")[0].value == "")
	{
		alert("직원 이름을 입력해주세요");
		document.getElementsByName("empname")[0].focus();
		return false;
	}
	if (document.getElementsByName("position")[0].value == "")
	{
		alert("직책을 입력해주세요");
		document.getElementsByName("position")[0].focus();
		return false;
	}
	if (document.getElementsByName("empemail")[0].value == "")
	{
		alert("이메일주소를 입력해주세요");
		document.getElementsByName("empemail")[0].focus();
		return false;
	}
	if (document.getElementsByName("empphone")[0].value == "")
	{
		alert("전화번호를 입력해주세요");
		document.getElementsByName("empphone")[0].focus();
		return false;
	}
	
	return true;
}


</script>


<%@include file="../include/footer.jsp"%>
