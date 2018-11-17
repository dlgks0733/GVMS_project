<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

.show {
	position: relative;
	max-width: 100%;
	max-height: 100%;
	overflow: auto;
}

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
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">공지사항 수정</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" class="form-horizontal"
					id="registerForm">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' name='listType' value="${cri.listType}">
					<input type="hidden" name="noNum" value="${noticeVO.noNum}">

					<div class="box-body box-form-custom">
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name='noTitle' class="form-control"
									placeholder="제목 작성" value="${noticeVO.noTitle}" onkeyup="checkLength(this,90)">
							</div>
						</div>
						<div class="popup back" style="display: none;"></div>
						<div id="popup_front" class="popup front" style="display: none;">
							<img id="popup_img">
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">글머리</label>
							<div class="col-sm-2">
								<select name="noKeyword" class="form-control">
									<option value="3"
										<c:out value="${noticeVO.noKeyword == 3?'selected':''}"/>>
										--</option>
									<option value="1"
										<c:out value="${noticeVO.noKeyword == 1?'selected':''}"/>>
										필독</option>
									<option value="2"
										<c:out value="${noticeVO.noKeyword == 2?'selected':''}"/>>
										공지</option>
								</select>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea rows="10" name='noText' class="form-control"
									placeholder="내용 작성" onKeyUp="javascript:fnChkByte(this,'4000')">${noticeVO.noText}</textarea>
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
						<div class="form-group input">
						<label for="exampleInputEmail1" class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<ul class="mailbox-attachments clearfix showUploadedList"></ul>
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
									<span>이미지 파일을(jpg, png)을 끌어 넣거나</span><br />
									<label for="imgFileUpload">여기</label>를 클릭해주세요
								</div>
								<input type="file" id="imgFileUpload" class="imgFileDrop">
								<input type="hidden" id="uploadCount">
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">URL</label>
							<div class="col-sm-8">
								<input type="text" name="imgUri" class="form-control" id="imgUri"
									placeholder="링크주소 입력">
							</div>
							<!-- <div class="col-sm-2">
								<input type="button" onclick="" value="행추가" class="add_div">
								<input type="button" onclick="" value="행삭제" class="delete_div">
							</div> -->
						</div>
						<div class="form-group input">
							<label for="exampleInputEmail1" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<ul class="mailbox-attachments clearfix showImgUploadedList"></ul>
								<ul class="mailbox-attachments clearfix imgUploadedList"></ul>
						</div>
						</div>
					<!-- 	<div id="imgLink"></div> -->
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer btn-group-center">
						<div>
							<hr>
						</div>
						
						<button type="button" class="btn btn-danger" id="removeBtn">삭제</button>
						<button type="submit" class="btn btn-primary" onclick="return checkNotice()">수정</button>
						<button type="button" class="btn btn-cancel">취소</button>
					</div>
				</form>
				<script>

										$(".btn-cancel").on("click", function() {
															self.location = "/admin/notice/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
																	+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=${cri.listType}";
														});
										$(".btn-danger").on("click", function() {
															self.location = "/admin/notice/remove?noNum=${noticeVO.noNum}&page=${cri.page}&perPageNum=${cri.perPageNum}"
														            + "&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=${cri.listType}";
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

<!-- 업로드할 첨부파일 출력 -->
<script id="attachment" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img" href="{{fullName}}"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a class="btn btn-default btn-xs pull-right delbtn" data-src="{{fullName}}"><i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>
<!-- 업로드할 링크용 이미지만 출력 -->
<script id="imgOnlyAttachment" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img" href="{{fullName}}"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info"><input type="hidden" name="imgFileName" value="{{fullName}}">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a class="btn btn-default btn-xs pull-right delbtn" data-src="{{fullName}}"><i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>

<!-- 업로드된 첨부파일 출력 -->
<script id="templateAttach" type="text/x-handlebars-template">
	<li data-src="{{fullName}}">
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
			<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a class="btn btn-default btn-xs pull-right delbtn" data-src="{{fullName}}"><i class="fa fa-fw fa-remove"></i></a>
			</div>
	</li>
</script>

<!-- 업로드된 링크용 이미지 출력 -->
<script id="imgUploadedAttachment" type="text/x-handlebars-template">
	<li data-src="{{fullName}}"><a href="{{imgUri}}">
		<span class="mailbox-attachment-icon has-img" href="{{fullName}}"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info"><input type="hidden" name="imgFileName" value="{{fullName}}">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a class="btn btn-default btn-xs pull-right delbtn" data-src="{{fullName}}"><i class="fa fa-fw fa-remove"></i></a>
		</div>
		<a>
	</li>
</script>

<script>
// 일반 첨부파일을 출력할 템플릿
var nomalTemplate = Handlebars.compile($("#attachment").html());

// 파일을 드래그앤 드랍 했을 때 화면이 전환되지 않도록 설정
$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

// 일반파일을 드롭하거나 탐색창에서 선택하여 업로드
$(".fileDrop").on("drop input", function(event) {
	event.preventDefault();
	
	var files;
	if (event.type == 'drop') {
        files=event.originalEvent.dataTransfer.files;
    }
	else{
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

// 이미지로 링크를 연결할 파일을 출력할 템플릿
var imgTemplate = Handlebars.compile($("#imgOnlyAttachment").html());

//파일을 드래그앤 드랍 했을 때 화면이 전환되지 않도록 설정
$(".imgFileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

//이미지파일을 드롭하거나 탐색창에서 선택하여 업로드
$(".imgFileDrop").on("drop input", function(event) {
	event.preventDefault();
	var uploaded = $("#uploadCount").val();
	
	if (uploaded >= 1) {
		alert('이미지는 하나만 업로드할 수 있습니다.');
		return;
	}
	
	var files;
	if (event.type == 'drop') {
        files=event.originalEvent.dataTransfer.files;
    }
	else{
		files = event.target.files;
	}
	var file = files[0];
	
	// 업로드된 파일이 이미지 파일인지 확인
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
	// 업로드된 파일이 이미지 파일이 아닐 경우
	} else{
		alert("이미지 파일만 입력해 주세요.");
		return false;
	}
});
	
	// 현재 게시물 번호
	var noNum = ${noticeVO.noNum};
	
	// 업로드된 일반 첨부파일을 출력할 템플릿
	var Attachtemplate = Handlebars.compile($("#templateAttach").html());
	// 업로드된 링크용 이미지파일을 출력할 템플릿
	var imgUploadedAttachment = Handlebars.compile($("#imgUploadedAttachment").html());

	// 파일 경로를 불러와 화면에 출력
	$.getJSON("/admin/notice/getAttach/" + noNum, function(list) {
		$(list).each(function() {
			var fileInfo = getFileAndLinkInfo(this);
			var uploaded = $("#uploadCount").val();
			
			console.log(fileInfo);
			
			if(fileInfo.imgUri == "" || fileInfo.imgUri == null){
			var html = Attachtemplate(fileInfo);
			$(".showUploadedList").append(html);
			} else {
				var html = imgUploadedAttachment(fileInfo);
				$(".showImgUploadedList").append(html);
				uploaded += 1;
				$("#uploadCount").attr("value", uploaded);
				$("#imgUri").attr('disabled','disabled');
			}
		});
	});
	
	// 이미지 제목을 선택했을 때 큰화면으로 팝업
	$(".showUploadedList").on("click", ".mailbox-attachment-name a",
			function(event) {
				var fileLink = $(this).attr("href");

				if (checkImageType(fileLink)) {
					event.preventDefault();

					var imgTag = $("#popup_img");

					imgTag.attr("src", fileLink);

					console.log(imgTag.attr("src"));

					$(".popup").show('slow');
					imgTag.addClass("show");
				}
			});
	
	// 팝업 화면 닫기
	$("#popup_img").on("click", function() {
		$(".popup").hide('slow');
	});
	
	// 첨부파일 단일 삭제
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
	
	// 첨부 이미지링크 단일 삭제
	$(".imgUploadedList").on("click", ".delbtn", function(event) {
		var that = $(this);
		var uploaded = $("#uploadCount").val();
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
					$("#imgUri").removeAttr('disabled');
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				   alert("오류가 발생하였습니다.");
				  }  
		});
	});
	
	// 등록되었던 첨부파일 삭제
	$(".showUploadedList").on("click", ".delbtn", function(event) {
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
		
		// 데이터베이스에서 삭제
		$.ajax({
			url : "/admin/notice/removeAttach",
			type : "post",
			data : {fileName:$(this).attr("data-src")},
			dataType : "text",
			success : function(result){
				if(result == 'deleted'){
					alert("파일이 삭제되었습니다.");
				}},
				error: function (jqXHR, textStatus, errorThrown) {
					   alert("파일 삭제를 실패하였습니다.");
					  }
		});
	});
	
	// 등록되었던 이미지 링크 삭제
	$(".showImgUploadedList").on("click", ".delbtn", function(event) {
		var uploaded = $("#uploadCount").val();
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
					$("#imgUri").removeAttr('disabled');
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				   alert("오류가 발생하였습니다.");
				  }  
		});
		
		// 데이터베이스에서 삭제
		$.ajax({
			url : "/admin/notice/removeAttach",
			type : "post",
			data : {fileName:$(this).attr("data-src")},
			dataType : "text",
			success : function(result){
				if(result == 'deleted'){
					alert("파일이 삭제되었습니다.");
				}},
				error: function (jqXHR, textStatus, errorThrown) {
					   alert("파일 삭제를 실패하였습니다.");
					  }
		});
	});

	// 게시물 삭제버튼을 누르면 모든 첨부파일도 함께 삭제
	$("#removeBtn").on("click", function() {
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

	/* // 행 추가
	$(".add_div").on("click",
					function(event) {
						var $div = $('<div class="form-group input-long"><label for="exampleInputEmail1" class="col-sm-2 control-label">이미지</label><div class="col-sm-10"><input type="file" class="imgFileDrop"></div></div><div class="form-group input-long"><label for="exampleInputEmail1" class="col-sm-2 control-label">URL</label><div class="col-sm-8"><input type="text" name="imgUri" class="form-control" placeholder="링크주소 입력"></div></div>');
						var div = document.createElement('div');

						$('#imgLink').append($div);
						$div.appendTo($('#imgLink'));
						document.getElementById('imgLink').appendChild(div);
					});

	// 행 삭제
	$(".delete_div").on(
			"click",
			function(event) {
				var $imgLink = $('#imgLink').detach();
				$('#imgLink').remove();
				document.getElementById('imgLink').parentNode
						.removeChild(document.getElementById('imgLink'));
			}); */

	// 게시물 수정
	$("#registerForm").submit(
			function(event) {
				event.preventDefault();
				var that = $(this);

				var str = "";
				var indexVal =0;
				
				if($(".uploadedList .has-img").attr("href") != null){
				$(".uploadedList .has-img").each(function(index) {
							str += "<input type='hidden' name='files[" + indexVal
									+ "]' value='" + $(this).attr("href")
									+ "'>";
							indexVal++;
				});
				}
				
				if($(".imgUploadedList .has-img").attr("href") != null){
				$(".imgUploadedList .has-img").each(function(index){
					str += "<input type='hidden' name='files[" + indexVal
					+ "]' value='" + $(this).attr("href")
					+ "'>";
					indexVal++;
				});
				}
				
				if($(".showUploadedList li").attr("data-src") != null){
				$(".showUploadedList li").each(function(index){
					str += "<input type='hidden' name='files[" + indexVal
					+ "]' value='" + $(this).attr("data-src")
					+ "'>";
					indexVal++;
				});
				}
				
				if($(".showImgUploadedList li").attr("data-src") != null){
				$(".showImgUploadedList li").each(function(index){
					str += "<input type='hidden' name='files[" + indexVal
					+ "]' value='" + $(this).attr("data-src")
					+ "'>";
					indexVal++;
				});
				
				}
				
				if($(".showImgUploadedList li").attr("data-src") != null){
					$(".showImgUploadedList li > a:first-child").each(function(index){
					str +="<input type='hidden' name='imgUri' value='"+ $(this).attr("href")
					+"'>";
					
				});
				} 
				
				that.append(str);

				that.get(0).submit();
			});
</script>
<%@include file="../include/footer.jsp"%>
