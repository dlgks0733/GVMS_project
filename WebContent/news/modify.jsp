<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<style>
.red{
color:red;
}
.where {
   display: block;
   margin: 25px 15px;
   font-size: 11px;
   color: #000;
   text-decoration: none;
   font-family: verdana;
   font-style: italic;
}

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #999;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
   display: inline-block;
   padding: .5em .75em;
   font-size: inherit;
   font-family: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #f5f5f5;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
}

/* imaged preview */
.filebox .upload-display {
   margin-bottom: 5px;
}

@media ( min-width : 768px) {
   .filebox .upload-display {
      display: inline-block;
      margin-right: 5px;
      margin-bottom: 0;
   }
}

.filebox .upload-thumb-wrap {
   display: inline-block;
   width: 54px;
   padding: 2px;
   vertical-align: middle;
   border: 1px solid #ddd;
   border-radius: 5px;
   background-color: #fff;
}

.filebox .upload-display img {
   display: block;
   max-width: 100%;
   width: 100% \9;
   height: auto;
}

.filebox.bs3-primary label {
   color: #fff;
   background-color: #337ab7;
   border-color: #2e6da4;
}
</style>
<script type="text/javascript" src="/resources/admin/validity/news.js"></script>
<!-- Main content -->
<section class="content">
   <div class="row">
      <!-- left column -->
      <div class="col-md-12">
         <!-- general form elements -->
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">보도자료 수정</h3>
            </div>
            <!-- /.box-header -->

            <form name="news" role="form" action="modify" method="post" enctype="multipart/form-data" class="form-horizontal">

               <input type='hidden' name='page' value="${cri.page}" >
               <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
               <input type='hidden' name='searchType' value="${cri.searchType}">
               <input type='hidden' name='keyword' value="${cri.keyword}">
               

               <div class="box-body box-form-custom">

                  <div class="form-group input-long">
                     <div class="col-sm-10">
                        <input type="hidden" name='newsNum' class="form-control"
                           value="${newsVO.newsNum}" readonly="readonly">
                     </div>
                  </div>

                  <div class="form-group input-long">
                     <label for="exampleInputEmail1" class="col-sm-2 control-label">제목<span class="red">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" name='newsTitle' class="form-control"
                           value="${newsVO.newsTitle}">
                     </div>
                  </div>

                  <div class="form-group input-short">
                     <label for="name" class="col-sm-2 control-label">첨부파일</label>
                     <!-- 사진 사이즈는 1MB ~ 5MB까지 -->

                     <div class="filebox preview-image">
                        <div class="col-sm-10">
                           <input type="text" class="upload-name" value="${newsVO.fileName}" readonly="readonly" name="attachName">
                           <label for="input-file">불러오기</label>
                           <input type="file" id="input-file" class="upload-hidden" name="file">
                           <label for="deleteFile">삭제</label>
                           <button type="button" id="deleteFile" style="display: none">삭제</button>
                     <a href="downloadFile.do?fileName=${newsVO.fileName}">${newsVO.fileName}</a>
                        </div>
                     </div>
                  </div>

                  <div class="form-group input-short">
                     <label for="exampleInputEmail1" class="col-sm-2 control-label">내용<span class="red">*</span></label>
                     <div class="col-sm-10">
                        <textarea class="form-control" name="newsText" rows="15" onKeyUp="javascript:fnChkByte(this,'4000')">${newsVO.newsText}</textarea>
                        <span id="byteInfo"></span>/4000Byte
                     </div>
                  </div>
                  
                  <div class="form-group input-long">
                     <label for="exampleInputEmail1" class="col-sm-2 control-label">뉴스링크</label>
                     <div class="col-sm-10">
                        <input type="text" name='newsLink' class="form-control"
                           value="${newsVO.newsLink}">
                     </div>
                  </div>
                  </div>
                  <!-- /.box-body -->
                  <div class="box-footer btn-group-center">
				
				  <!--  button  -->
                     <button type="submit" class="btn btn-danger">삭제</button>
                     <button type="submit" class="btn btn-primary" onclick="return checkNews()">수정</button>
                     <button type="button" class="btn btn-cancel">취소</button>

                  </div>
            </form>

				 <!-- button script -->
            <script>
               $(document)
                     .ready(
                           function() {

                              var formObj = $("form[role='form']");

                              console.log(formObj);
                              
                              $(".btn-danger").on("click", function(){
                                 formObj.attr("action", "/admin/news/remove");
                                 formObj.submit();
                                 console.log('${cri.keyword}');
                              });
									
                              $(".btn-cancel").on("click",function() {
                                 self.location = "/admin/news/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
                              });

                            
                           });
            </script>


<script>
$(document).ready(function(){
      var fileTarget = $('.filebox .upload-hidden');

       fileTarget.on('change', function(){
           if(window.FileReader){
               // 파일명 추출
               var filename = $(this)[0].files[0].name;
           } 

           else {
               // Old IE 파일명 추출
               var filename = $(this).val().split('/').pop().split('\\').pop();
           };

           $(this).siblings('.upload-name').val(filename);
       });

       //preview image 
       var imgTarget = $('.preview-image .upload-hidden');

       imgTarget.on('change', function(){
           var parent = $(this).parent();
           parent.children('.upload-display').remove();

           if(window.FileReader){
               //image 파일만
               if (!$(this)[0].files[0].type.match(/image\//)) return;
               
               var reader = new FileReader();
               reader.onload = function(e){
                   var src = e.target.result;
                   parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
               }
               reader.readAsDataURL($(this)[0].files[0]);
           }

           else {
               $(this)[0].select();
               $(this)[0].blur();
               var imgSrc = document.selection.createRange().text;
               parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

               var img = $(this).siblings('.upload-display').find('img');
               img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
           }
       });
       
       
       //파일 링크 삭제 버튼 클릭 시
         $("#deleteFile").on("click", function(){
            var parent = $(this).parent();
           parent.children('.upload-display').remove();
           $(".upload-name").val("파일선택");
         });
   });
   
//내용 문자열 제한
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		if(escape(one_char).length > 4){
			rbyte += 3;                                         // 한글2Byte
		}else{
			rbyte++;                                            // 영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
			rlen = i+1;                                          // return할 문자열
																// 갯수
		}
	}

	if(rbyte > maxByte){
	    alert("한글 "+(maxByte/3)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	    str2 = str.substr(0,rlen);                                  // 문자열 자르기
	    obj.value = str2;
	    fnChkByte(obj, maxByte);
	}else{
	    document.getElementById('byteInfo').innerText = rbyte;
		}
	}

// 제목 문자열 제한 
function checkLength(objname, maxlength) {
	  var objstr = objname.value; // 입력된 문자열을 담을 변수 
	  var objstrlen = objstr.length; // 전체길이

	  // 변수초기화 
	  var maxlen = maxlength; // 제한할 글자수 최대크기 
	  var i = 0; // for문에 사용 
	  var bytesize = 0; // 바이트크기 
	  var strlen = 0; // 입력된 문자열의 크기
	  var onechar = ""; // char단위로 추출시 필요한 변수 
	  var objstr2 = ""; // 허용된 글자수까지만 포함한 최종문자열

	  // 입력된 문자열의 총바이트수 구하기
	  for (i = 0; i < objstrlen; i++) {
	   // 한글자추출 
	   onechar = objstr.charAt(i);

	   if (escape(onechar).length > 4) {
	    bytesize += 2; // 한글이면 2를 더한다. 
	   } else {
	    bytesize++; // 그밗의 경우는 1을 더한다.
	   }

	   if (bytesize <= maxlen) { // 전체 크기가 maxlen를 넘지않으면 
	    strlen = i + 1; // 1씩 증가
	   }
	  }

	  // 총바이트수가 허용된 문자열의 최대값을 초과하면 
	  if (bytesize > maxlen) {
	   alert("허용된 글자수를 초과했습니다. \n초과된 내용은 자동으로 삭제 됩니다.");  // match를 이용해서 영어로된 name을 한글로 변환해서 출력한다. 
	   objstr2 = objstr.substr(0, strlen);
	   objname.value = objstr2;
	  }
	  objname.focus();
	 }
   
</script>

<!-- 유효성검사 함수 가져오기 -->


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