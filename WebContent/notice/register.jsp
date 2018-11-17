<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<style>
.imgFileDrop {
	width: 80%;
	height: 80px;
	border: 3px dotted #98d6e4;
	background-color: #cee3ec;
	margin: auto;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	color: #5a5a5a;
}

.imgFileDrop:hover {
	background-color: #71adc8;
}

.imgFileDrop label {
	cursor: pointer;
	font-size: 15px;
	display: inline-block;
	padding: 0 2px;
	border-bottom: 2px dashed #e4f0f5; 
}

#imgFileUpload {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">공지사항 등록</h3>
				</div>
				<!-- /.box-header -->

				<form name="notice" role="form" method="post" class="form-horizontal"
					id="registerForm">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' name='listType' value="${cri.listType}">
					<input type="hidden" name="noNum" value="${noticeVO.noNum}">
						<input type="hidden" name="adminId" value="${login.adminId}">
					<div class="box-body box-form-custom">
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제목 <span class="red">*</span></label>
							<div class="col-sm-10">
								<input type="text" name='noTitle' class="form-control"
									placeholder="제목 작성" onkeyup="checkLength(this,90)">
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">글머리</label>
							<div class="col-sm-2">
								<select name="noKeyword" class="form-control">
									<option value="3">--</option>
									<option value="1">필독</option>
									<option value="2">공지</option>
								</select>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea rows="10" name="noText" class="form-control"
									placeholder="내용 작성" onKeyUp="javascript:fnChkByte(this,'4000')"></textarea>
									<span id="byteInfo">0</span>/4000Byte
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">첨부파일</label>
							<div class="col-sm-6 form-upload-custom">
								<div class="fileDrop">
									<span>파일을 끌어 넣거나</span><br />
									<label for="fileUpload">여기</label>를 클릭해주세요
								</div>
								<input type="file" id="fileUpload" class="fileDrop">
							</div>
						</div>
						<hr>
						<div class="form-group input">
						<label for="exampleInputEmail1" class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
						<ul class="mailbox-attachments clearfix uploadedList"></ul>
						</div>
						</div>
						<hr>
						<div class="form-group input-long">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">이미지로 링크 걸기</label>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">이미지</label>
							<div class="col-sm-10 form-upload-custom">
								<div class="imgFileDrop">
									<span>이미지 파일(jpg, png)을 끌어 넣거나</span><br />
									<label for="imgFileUpload">여기</label>를 클릭해주세요
								</div>
								<input type="file" id="imgFileUpload" class="imgFileDrop">
								<input type="hidden" id="uploadCount">
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">URL</label>
							<div class="col-sm-8">
								<input type="text" name="imgUri" class="form-control"
									placeholder="링크주소 입력">
							</div>
							<!-- <div class="col-sm-2">
								<input type="button" onclick="" value="행추가" class="add_div">
								<input type="button" onclick="" value="행삭제" class="delete_div">
							</div> -->
						</div>
						<!-- <div id="imgLink"></div> -->
						
						<div class="form-group input">
							<label for="exampleInputEmail1" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
							<ul class="mailbox-attachments clearfix imgUploadedList"></ul>
						</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
					<div>
						<hr>
					</div>
						<button type="button" class="btn btn-cancel" id="btn-cancle">취소</button>
						<button type="submit" class="btn btn-primary" onclick="return checkNotice()">등록</button>
					</div>
				</form>
				<script>
					$(document)
							.ready(
									function() {
										
										var listsearchType;
										if ('${cri.listType}' == 0){
											listsearchType = 0;
											} else if('${cri.listType}' == 1){
												listsearchType = 1;
											} else if('${cri.listType}' == 2){
												listsearchType = 2;
											}

										var formObj = $("form[role='form']");

										console.log(formObj);

										$(".btn-cancel")
												.on(
														"click",
														function() {
															self.location = "/admin/notice/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
																	+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=${cri.listType}";
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
</div>
<!-- /.content-wrapper -->
<script type="text/javascript" src="/resources/admin/validity/notice.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/admin/validity/upload.js"></script>
<script id="attachment" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img" href="{{fullName}}"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a class="btn btn-default btn-xs pull-right delbtn" data-src="{{fullName}}"><i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>
<script id="imgOnlyAttachment" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img" href="{{fullName}}"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info"><input type="hidden" name="imgFileName" value="{{fullName}}"
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a class="btn btn-default btn-xs pull-right delbtn" data-src="{{fullName}}"><i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>
<script>
	var nomalTemplate = Handlebars.compile($("#attachment").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop input", function(event) {
		event.preventDefault();
		
		var files;
		
		if (event.type == 'drop') {
	        files = event.originalEvent.dataTransfer.files;
	    } else{
			files = event.target.files;
		}
		var file = files[0];
		var formData = new FormData();

		formData.append("file", file);
		
		$.ajax({
			url : '/noticeUp/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = nomalTemplate(fileInfo);

				$(".uploadedList").append(html);
			},
			error : function (jqXHR, textStatus, errorThrown) {
				   alert("오류가 발생하였습니다.");
			  } 
		});
	});
	
	var imgTemplate = Handlebars.compile($("#imgOnlyAttachment").html());
	$(".imgFileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".imgFileDrop").on("drop input", function(event) {
		event.preventDefault();
		var uploaded = $("#uploadCount").val();
		
		if (uploaded >= 1) {
			alert('이미지는 하나만 업로드할 수 있습니다.');
			return;
		}
		
		var files;
		if (event.type == 'drop') {
	        files = event.originalEvent.dataTransfer.files;
	    } else{
			files = event.target.files;
		}
		var file = files[0];
		if(checkImageType(file.name)){
		var formData = new FormData();

		formData.append("file", file);
		
		$.ajax({
			url : '/noticeUp/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = imgTemplate(fileInfo);

				$(".imgUploadedList").append(html);
				
				uploaded += 1;
				$("#uploadCount").attr("value", uploaded);
			},
			error : function (jqXHR, textStatus, errorThrown) {
				   alert("오류가 발생하였습니다.");
			  } 
		});
		} else{
			alert("이미지 파일만 입력해 주세요.");
			return false;
		}
	});

	/* $(".add_div")
			.on(
					"click",
					function(event) {
						var $div = $('<div class="form-group input-long"><label for="exampleInputEmail1" class="col-sm-2 control-label">이미지</label><div class="col-sm-10"><input type="file" class="imgFileDrop"></div></div><div class="form-group input-long"><label for="exampleInputEmail1" class="col-sm-2 control-label">URL</label><div class="col-sm-8"><input type="text" name="imgUri" class="form-control" placeholder="링크주소 입력"></div></div>');
						var div = document.createElement('div');

						$('#imgLink').append($div);
						$div.appendTo($('#imgLink'));
						document.getElementById('imgLink').appendChild(div);
					});

	$(".delete_div").on(
			"click",
			function(event) {
				var $imgLink = $('#imgLink').detach();
				document.getElementById('imgLink').parentNode
						.removeChild(document.getElementById('imgLink'));
			}); */

	$(".uploadedList").on("click", ".delbtn", function(event) {
		var that = $(this);
		$.ajax({
			url : "/noticeUp/deleteFile",
			type : "post",
			data : {fileName:$(this).attr("data-src")},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.parents("li").remove();
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				   alert("오류가 발생하였습니다.");
				  }  
		});
	});
	
	$(".btn-cancle").on("click", function(event){
		var arr = [];

		$(".uploadedList li").each(function(index) {
			arr.push($(this).attr("data-src"));
		});
		$(".imgUploadedList li").each(function(index){
			arr.push($(this).attr("data-src"));
		});

		if (arr.length > 0) {
			$.post("/noticeUp/deleteAllFiles", {
				files : arr
			}, function() {

			});
		}

		formObj.attr("action", "/admin/notice/remove");
		formObj.submit();
	});
	
	$(".imgUploadedList").on("click", ".delbtn", function(event) {
		var that = $(this);
		$.ajax({
			url : "/noticeUp/deleteFile",
			type : "post",
			data : {fileName:$(this).attr("data-src")},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.parents("li").remove();
					uploaded -= 1;
					$("#uploadCount").attr("value", uploaded);
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				   alert("오류가 발생하였습니다.");
				  }  
		});
	});

	$("#registerForm").submit(
			function(event) {
				event.preventDefault();
				var that = $(this);

				var str = "";
				var indexVal =0;
				$(".uploadedList .has-img").each(
						function(index) {
							str += "<input type='hidden' name='files[" + indexVal
									+ "]' value='" + $(this).attr("href")
									+ "'>";
									
									indexVal++;
						});
				
				$(".imgUploadedList .has-img").each(
						
						function(index){
							
							str += "<input type='hidden' name='files[" + indexVal
							+ "]' value='" + $(this).attr("href")
							+ "'>";
							
							indexVal++;
						});
				that.append(str);

				that.get(0).submit();
			});
</script>
<%@include file="../include/footer.jsp"%>
