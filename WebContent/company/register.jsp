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
					<h3 class="box-title">기관 등록</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" onsubmit="return validateEmptyVal()" class="form-horizontal" enctype="multipart/form-data">
					<div class="box-body box-form-custom">
						
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">기관명<span class="must-mark">*</span></label> 
							<div class="col-sm-10">
								<input type="text" name='compname' class="form-control"
									placeholder="기관 이름을 입력해주세요">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">구분<span class="must-mark">*</span></label> 
							<div class="col-sm-10">
								<select name="division" class="form-control">
									<option value="1">연구소</option>
									<option value="2">교육센터</option>
								</select>
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">분야</label> 
							<div class="col-sm-10">
								<input name='compfield' class="form-control"
									placeholder="기관 분야를 입력해주세요">
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">대상</label> 
							<div class="col-sm-10">
								<input name='target' class="form-control"
									placeholder="기관의 교육 또는 연구 대상을 입력해주세요">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">전화번호<span class="must-mark">*</span></label> 
							<div class="col-sm-10">
								<input name='phone' class="form-control" maxlength = '13'
									placeholder="전화번호를 입력해주세요">
							</div>
						</div>
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">우편번호 <span class="must-mark">*</span></label> 
							<div class="row col-md-10">
								<div class="col-md-3 col-xs-4">
									<input name='zipcode' class="form-control" placeholder="우편번호" readonly>
								</div>
								<div class="col-md-7 col-xs-6">
									<button type="button" onclick="findRoadAddr()"
										class="btn btn-default"><i class="fa fa-search"></i> 주소 찾기</button>
								</div>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">주소<span class="must-mark">*</span></label> 
							<div class="col-sm-10">
								<input name='frontaddr' class="form-control" placeholder="주소" readonly>
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">상세주소<span class="must-mark">*</span></label> 
							<div class="col-sm-10">
								<input name='rearaddr' class="form-control" placeholder="상세주소" >
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">기관설명<span class="must-mark">*</span></label> 
							<div class="col-sm-10">
								<textarea rows="5" name='compdesc' class="form-control"
									placeholder="기관에 대한 상세한 설명을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="form-group input-short">
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
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-primary"
							onclick="return submitViewData()">등록</button>
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
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js">
</script>
<script charset="UTF-8" type="text/javascript"
	src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js">
</script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>    
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img">
	<img src="/admin/emp/{{imgsrc}}" alt="Attachment">
	<input name="imglink" type="hidden" value="{{fullName}}">
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

$(document).ready( function() {
	
	$(".btn-cancel").on("click", function(){
		  self.location = "list?page=${cri.page}&perPageNum=${cri.perPageNum}"
		  + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});

//페이지가 로드될 때 기관의 저장된 이미지를 불러옴
//initImg();

//다음 API 주소찾기 팝업창을 띄우는 메소드
function findRoadAddr() {
    new daum.Postcode
        (
        {
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementsByName('zipcode')[0].value = data.zonecode; //5자리 새우편번호 사용
                document.getElementsByName('frontaddr')[0].value = fullRoadAddr;
            }
        }).open();
}

// 전화번호를 입력하면 자동으로 - 표시를 해줌
function autoHypenPhone(str) {
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if (str.length < 4) {
        return str;
    } else if (str.length < 7) {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    } else if (str.length < 11) {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    } else {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

// 전화번호 입력칸에 키가 눌렸다 떼지면 전화번호에
// - 표시를 자동으로 넣어주는 함수
var cellPhone = document.getElementsByName('phone')[0];
cellPhone.onkeyup = function (event) {
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val);
}


// 뷰가 로드될 때 실행하는 함수
function initImg() {
	// 기관의 이미지 링크를 변수에 저장함
    var imgsrc = "${company.imglink}";
    // 이미지 태그를 생성함
    var str = "<img src='displayFile?fileName=" + imgsrc + "'/>";
    // imgHolder 디비전 태그 안에 이미지를 삽입해줌
    document.getElementById("imgHolder").innerHTML = str;
}

// 파일이름을 파라미터로 전달하면
// 이미지의 언더바가 제거된 이미지 이름을 반환함
function getOriginalName(fileName) {

    if (checkImageType(fileName)) {
        return;
    }

    var idx = fileName.indexOf("_") + 1;
    return fileName.substr(idx);

}

// 
function getImageLink(fileName) {

    if (!checkImageType(fileName)) {
        return;
    }
    var front = fileName.substr(0, 12);
    var end = fileName.substr(14);

    return front + end;

}

// 이미지타입인지 검사하는 함수
function checkImageType(fileName) {

    var pattern = /jpg|gif|png|jpeg/i;

    return fileName.match(pattern);

}

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

// 유효성 검사
function validateEmptyVal()
{
	if (document.getElementsByName("compname")[0].value == "")
	{
		alert("기관명을 입력해주세요");
		document.getElementsByName("compname")[0].focus();
		return false;
	}
	if (document.getElementsByName("phone")[0].value == "")
	{
		alert("전화번호를 입력해주세요");
		document.getElementsByName("phone")[0].focus();
		return false;
	}
	if (document.getElementsByName("zipcode")[0].value == "")
	{
		alert("주소를 선택해주세요");
		return false;
	}
	if (document.getElementsByName("rearaddr")[0].value == "")
	{
		alert("상세주소를 입력해주세요");
		document.getElementsByName("rearaddr")[0].focus();
		return false;
	}
	if (document.getElementsByName("compdesc")[0].value == "")
	{
		alert("기관설명을 입력해주세요");
		document.getElementsByName("compdesc")[0].focus();
		return false;
	}
	if (document.getElementById("uploadCount").value <= 0)
	{
		alert("기관 이미지을 선택해주세요");
		return false;
	}
	
	return true;
}

</script>

