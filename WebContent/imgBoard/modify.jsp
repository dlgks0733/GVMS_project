<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/admin/validity/imgboard.js">
</script> 
<%@ include file="../include/header.jsp"%>

<!-- 파일 드롭하는 박스 스타일 -->
<style>
    .mainfileDrop {
        width: 100%;
        height: 150px;
        border: 1px dotted gray;
        background-color: #F6F6F6;
        margin: auto;
    }

    .subfileDrop {
        width: 80%;
        height: 100px;
        border: 3px dotted #98d6e4;
        background-color: #cee3ec;
        margin: auto;
        text-align: center;
        display: table-cell;
        vertical-align: middle;
        color: #5a5a5a;
    }

    span#drophere {
        color: green;
        text-align: center;

    }
</style>


<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">프로그램 이미지 수정</h3>
                    <br>
                </div>
                    <form name="imgboard" id='registerForm' role="form" method="post" class="form-horizontal">

                        <%-- <input type='hidden' name='page' value="${cri.page}">
                            <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                            <input type='hidden' name='searchType' value="${cri.searchType}">
                            <input type='hidden' name='keyword' value="${cri.keyword}"> --%>
                            <input type='hidden' name='imgnum' value="${imgBoardVO.imgnum}">

                            <div class="box-body box-form-custom">

                                <div class="form-group  input-long">
                                    <label for="exampleInputEmail1" class="col-sm-2 control-label">제목</label>

                                    <div class="col-sm-10">
                                        <input type="text" name='title' id="title" class="form-control" placeholder="제목을 입력하세요" value="${imgBoardVO.title}">
                                    </div>
                                </div>

                                <div class="form-group  input-long">
                                    <label for="exampleInputEmail1" class="col-sm-2 control-label">기관 선택
                                    </label>

                                    <div class="col-sm-10">
                                        <select name="compname" id="compname" class="form-control" onchange="compSelect(this.value)">
                                            <c:forEach var="list" items="${compList}" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${list.compnum eq imgBoardVO.compnum} ">
                                                        <option value="${list.compname}" selected="selected">${list.compname}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${list.compname}">${list.compname}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group  input-long">
                                    <label for="exampleInputEmail1" class="col-sm-2 control-label">프로그램 선택
                                    </label>
                                    <div class="col-sm-10">
                                        <select name="intronum" id="intronum" class="form-control">
                                            <c:forEach var="list" items="${progList}" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${list.intronum eq imgBoardVO.intronum} ">
                                                        <option value="${list.intronum}" selected="selected">${list.title}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${list.intronum}">${list.title}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <!-- 								<div class="col-sm-10">
                                        <select name="intronum" id="intronum" class="form-control">
                                            <option value="">선택</option>
                                        </select>
                                    </div> -->
                                </div>

                                <!-- 메인이미지 -->
                                <div class="form-group" style="display:none">
                                    <label for="exampleInputEmail1" class="col-sm-2 control-label">메인이미지</label>
                                    <div class="col-sm-10">

                                        <div class="mainfileDrop" id="main">
                                            <span class="drophere">이 곳에 대표이미지(jpg, png) 한 장을 끌어 넣어주세요</span>
                                        </div>
                                        <input type="hidden" id="uploadCount" name="mainimgfile">
                                    </div>
                                </div>

                                <div class="box-footer btn-group-center"  style="display:none">
                                    <ul class="mailbox-attachments clearfix mainuploadedList"></ul>
                                </div>

                                <div class="form-group input-short">
                                    <label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label>
                                    <div class="col-sm-10">
                                        <textarea rows="20" name='content' id="content" class="form-control" placeholder="내용을 입력하세요">${imgBoardVO.content}</textarea>
                                    </div>
                                </div>

                                <!-- 이미지 게시판을 등록하기 위해 adminid에 임시로 hbc 아이디 지정 -->
                                <div class="form-group">
                                    <input type="hidden" name="adminId" value="${login.adminId}">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="col-sm-2 control-label">이미지
                                    </label>
                                    <div class="col-sm-10">

                                        
                                        <div class="fileDrop subfileDrop" id="sub">
										<span>이미지를 업로드하려면 여기에 </span><br />
										<span>이미지 파일을(jpg, png)을 끌어 넣거나</span><br />
									<label for="fileUpload">여기</label>를 클릭해주세요
									</div>
									<input type="file" id="fileUpload">
									<input type="hidden" id="uploadCount">
									<hr />
                               		 <ul class="mailbox-attachments clearfix subuploadedList"></ul>
                                    </div>
                                </div>
                            </div>

                            <!-- /.box-body -->

                            <div class="box-footer btn-group-center">


                                <button type="button" class="btn btn-danger" id="removeBtn">삭제</button>
                                <button type="submit" class="btn btn-primary" onclick="return registVal()">수정</button>
                                <button type="button" class="btn btn-cancel">취소</button>
                            </div>
                    </form>
            </div>
            <!-- /.col (left) -->
        </div>
        <!-- /.row -->
    </div>
</section>
<!-- /.content -->

<script type="text/javascript" src="/resources/admin/imgBoard/upload.js?id=1234"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
    <li>
    <div class="mailbox-attachment-info">
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        {{fileName}}
        <div class="small btn-default btn-xs pull-right delbtn" data-src="{{fullName}}">
        <i class="fa fa-fw fa-remove"></i>
        </div>
    </div>
    </li>
    </script>

<script>

    /**
     * 취소 버튼 클릭시 보던 목록으로 돌아가기
     */
    $(".btn-cancel").on("click", function () {
        self.location = "/admin/imgBoard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
            + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
    });

    /**
     * 게시글 삭제버튼
     */
    $(".btn-danger").on("click", function () {


        self.location = "/admin/imgBoard/remove?imgnum=${imgBoardVO.imgnum}&page=${cri.page}&perPageNum=${cri.perPageNum}"
            + "&searchType=${cri.searchType}&keyword=${cri.keyword}";

        /* 				var formObj = $("form[role='form']");
                        formObj.attr("method", "post");
                        formObj.attr("cri", '${cri}');
                        formObj.attr("action", "/admin/imgBoard/remove");
                        formObj.submit(); */

    });
    /**
     * 메인 이미지 불러오기
     */
    var imgnum = ${ imgBoardVO.imgnum };
    var template = Handlebars.compile($("#template").html());

    $.getJSON("/admin/imgBoard/getMainAttach/" + imgnum, function (list) {
        $(list).each(function () {

            var fileInfo = getFileInfo(this);

            var html = template(fileInfo);

            var uploaded = $("#uploadCount").val();

            $(".mainuploadedList").append(html);

            uploaded++;
            $("#uploadCount").attr("value", uploaded);

        });
    });

    /**
     * 추가 이미지 불러오기
     */
    $.getJSON("/admin/imgBoard/getAttach/" + imgnum, function (list) {
        $(list).each(function () {

            var fileInfo = getFileInfo(this);

            var html = template(fileInfo);

            var uploaded = $("#uploadCount").val();

            $(".subuploadedList").append(html);


            // 	      uploaded += 1;
            // 	      $("#uploadCount").attr("value", uploaded);

        });
    });


    var template = Handlebars.compile($("#template").html());

    $(".mainfileDrop").on("dragenter dragover", function (event) {

        event.preventDefault();
    });

    $(".mainfileDrop").on("drop", function (event) {

        event.preventDefault();

        var uploaded = $("#uploadCount").val();

        if (uploaded >= 5) {
            alert('이미지는 하나만 업로드할 수 있습니다.');
            return;
        }

        var files = event.originalEvent.dataTransfer.files;
        var file = files[0];
        var formData = new FormData();
        formData.append("file", file);

        $.ajax({
            url: '/uploadAjax',
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {

                var fileInfo = getFileInfo(data);
                var html = template(fileInfo);

                var str = "";

                if (checkImageType(data)) {
                    $(".mainuploadedList").append(html);

                    uploaded++;
                    $("#uploadCount").attr("value", uploaded);

                } else {
                    alert('이미지 파일이 아닙니다.\n(jpg, png 확장자만 가능)');
                }
                $(".mainuploadedList").append(str);
            }
        });

    });

    $(".mainuploadedList").on("click", ".small", function (event) {

        var that = $(this);


        var uploaded = $("#uploadCount").val();

        $.ajax({
            url: "/deleteFile",
            type: "POST",
            data: {
                fileName: $(this).attr("data-src")
            },
            dataType: "text",
            success: function (result) {
                if (result == 'deleted') {
                    that.closest('li').remove();

                    uploaded--;
                    $("#uploadCount").attr("value", uploaded);
                }
            }
        });

    });

    $(".uploadedList").on("click", ".mailbox-attachment-info a", function (event) {

        var fileLink = $(this).attr("href");

        if (checkImageType(fileLink)) {

            event.preventDefault();

            var imgTag = $("#popup_img");
            imgTag.attr("src", fileLink);

            //		       console.log(imgTag.attr("src"));

            $(".popup").show('slow');
            imgTag.addClass("show");
        }
    });



    $(".subfileDrop").on("dragenter dragover", function (event) {

        event.preventDefault();
    });

    $(".subfileDrop").on("drop", function (event) {

        event.preventDefault();

        var files = event.originalEvent.dataTransfer.files;

        var file = files[0];

        var formData = new FormData();

        formData.append("file", file);

        $.ajax({
            url: '/uploadAjax',
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {

                var fileInfo = getFileInfo(data);

                var html = template(fileInfo);

                var str = "";
                if (checkImageType(data)) {
                    $(".subuploadedList").append(html);

                    uploaded++;
                    $("#uploadCount").attr("value", uploaded);
                } else {
                    alert('이미지 파일이 아닙니다.\n(jpg, png 확장자만 가능)');
                }
                $(".uploadedList").append(str);
            }
        });

    });

    $(".subuploadedList").on("click", ".small", function (event) {

        var that = $(this);
        var uploaded = $("#uploadCount").val();

        $.ajax({
            url: "/deleteFile",
            type: "POST",
            data: {
                fileName: $(this).attr("data-src")
            },
            dataType: "text",
            success: function (result) {
                if (result == 'deleted') {
                    that.closest('li').remove();
                    uploaded--;
                }
            }
        });

    });



    //수정 버튼 클릭
    $("#registerForm").submit(
        function (event) {
            event.preventDefault();

            var that = $(this);
                       
            var strmain = "";

            var strsub = "";

            $(".mainuploadedList .delbtn")
                .each(
                    function (index) {
                        strmain += "<input type='hidden' name='mainfile' value='"
                            + $(this).attr("data-src")
                            + "'> ";
                    });

            $(".subuploadedList .delbtn")
                .each(
                    function (index) {
                        strsub += "<input type='hidden' name='files["
                            + index
                            + "]' value='"
                            + $(this).attr("data-src")
                            + "'> ";
                    });


            that.append(strmain);
            that.append(strsub);

            // 				alert(strmain);
            // 				alert(strsub);

            that.get(0).submit();


        });
</script>
<script type="text/javascript">
    //AJAX select box
    function compSelect(compname) {
        $.ajax({
            type: "POST",
            url: "testSelect",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {
                param: compname
            },
            success: function (result) {

                //SELECT BOX 초기화           
                $("#intronum").find("option").remove().end().append(
                    "<option value=''>선택</option>");

                //배열 개수 만큼 option 추가
                $.each(result, function (i) {
                    $("#intronum").append(
                        "<option value='" + result[i].intronum + "'>"
                        + result[i].title + "</option>")
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("오류가 발생하였습니다.");
            }
        });
    }
</script>

<footer>
	<%@ include file="../include/footer.jsp"%>
</footer>