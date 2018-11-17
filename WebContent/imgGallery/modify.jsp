<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<script type="text/javascript" 
src="/resources/admin/validity/content.js">
</script>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
                <div class="box-header">
                   	<h3 class="box-title">이미지 갤러리 등록</h3>
                	</div>
                    <form name="imgboard" id='registerForm' role="form" method="post" class="form-horizontal">
                        <input type='hidden' name='page' value="${cri.page}">
                        <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                        <input type='hidden' name='searchType' value="${cri.searchType}">
                        <input type='hidden' name='keyword' value="${cri.keyword}">

                        <div class="box-body box-form-custom">

                            <div class="form-group  input-long">
                                <label for="exampleInputEmail1" class="col-sm-2 control-label">제목<span class="must-mark">*</span></label>

                                <div class="col-sm-10">
                                    <input type="text" name='title' id="title" class="form-control" placeholder="제목을 입력하세요" required="required" value="${galleryBoardVO.title}">
                                </div>
                            </div>

                            <div class="form-group  input-long">
                                <label for="exampleInputEmail1" class="col-sm-2 control-label">기관 선택<span class="must-mark">*</span>
                                </label>
                                <div class="col-sm-10">
								<select class="form-control" name="compnum">
									<c:forEach items="${compList}" var="comp" varStatus="status">
										<c:choose>
											<c:when test="${comp.compnum eq galleryBoard.compnum}">
												<option value="${comp.compnum}" selected>${comp.compname}</option>
											</c:when>
											<c:otherwise>
												<option value="${comp.compnum}">${comp.compname}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
                            </div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">이미지<span class="must-mark">*</span></label> 
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
						<div class="form-group input-short">
                                <label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label>
                                <div class="col-sm-10">
                                    <textarea rows="20" name='content' id="content"
                              class="form-control" placeholder="내용을 입력하세요" onKeyUp="javascript:fnChkByte(this,'3000')">${galleryBoardVO.content}</textarea>
                           <span id="byteInfo">0</span>/3000Byte
                                </div>
                            </div>
					</div>
					<div class="form-group">
                    	<input type="hidden" name="adminId" value="${login.adminId}">
                    </div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-danger btn-remove">삭제</button>
						<button type="submit" class="btn btn-primary btn-modify">수정</button>
						<button type="button" class="btn btn-cancel">취소</button>
					</div>
				</form>



<script type="text/javascript" src="/resources/js/upload.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img">
	<img src="/admin/imgGallery{{imgsrc}}" alt="Attachment">
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
	
	$(".btn-remove").on("click", function(){
		  self.location = "/admin/imgGallery/remove?galnum=${galleryBoardVO.galnum}";
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

// 드래그 앤 드롭으로 파일 업로드할 때 호출되는 함수
$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var uploaded = $("#uploadCount").val();
	
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
				  
				  uploaded++;
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
	
	if (uploaded >= 3) {
		alert('이미지는 3개 까지 업로드할 수 있습니다.');
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
				  
				  uploaded++;
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
				   uploaded--;
				   $("#uploadCount").attr("value", uploaded);
			   }
		   }
	   });
});


var galnum = ${galleryBoardVO.galnum};
var template = Handlebars.compile($("#template").html());

$.getJSON("/admin/imgGallery/getAttach/"+galnum, function(list){
	$(list).each(function(){
		
		var fileInfo = getFileInfo(this);
		
		var html = template(fileInfo);
		
		var uploaded = $("#uploadCount").val();
		
		$(".uploadedList").append(html);
		 
		uploaded++;
		$("#uploadCount").attr("value", uploaded);
		
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
