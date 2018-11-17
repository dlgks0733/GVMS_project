<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript" 
src="/resources/admin/validity/content.js">
</script>

<style>
    .where {
        display: block;
        margin: 25px 15px;
        font-size: 11px;
        color: #000;
        text-decoration: none;
        font-family: verdana;
        font-style: italic;
    }

    .filebox input[type="file"],
    .attachFilebox input[type="file"] {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        border: 0;
    }

    .filebox label,
    .attachFilebox label {
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
    .filebox .upload-name,
    .attachFilebox .attach-upload-name {
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
        -webkit-appearance: none;
        /* 네이티브 외형 감추기 */
        -moz-appearance: none;
        appearance: none;
    }

    /* imaged preview */
    .filebox .upload-display {
        margin-bottom: 5px;
    }

    @media(min-width: 768px) {
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

<script>
    function imgFileCheck() {

        var fileType = $("#imgValue").val();
        var typeCheck = fileType.slice(fileType.lastIndexOf(".") + 1).toLowerCase();
        var t = $("#title").val();

        if (t != "") {
            if ((typeCheck == "gif" || typeCheck == "png" || typeCheck == "jpg" || typeCheck == "jpeg" || typeCheck == "파일선택")) {
                fileForm.submit();
            } else {
                alert("이미지파일이 아닙니다!");
            }
        } else {
            alert("제목을 입력하세요!");
        }
    }

    $(document).ready(function () {
        var fileTarget = $('.filebox .upload-hidden');

        fileTarget.on('change', function () {
            if (window.FileReader) {
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

        imgTarget.on('change', function () {
            var parent = $(this).parent();
            parent.children('.upload-display').remove();

            if (window.FileReader) {
                //image 파일만
                if (!$(this)[0].files[0].type.match(/image\//)) return;

                var reader = new FileReader();
                reader.onload = function (e) {
                    var src = e.target.result;
                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
                }
                reader.readAsDataURL($(this)[0].files[0]);
            }

            else {
                $(this)[0].select();
                $(this)[0].blur();
                var imgSrc = document.selection.createRange().text;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

                var img = $(this).siblings('.upload-display').find('img');
                img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
            }
        });

        $("#deleteImg").on("click", function () {
            var parent = $(this).parent();
            parent.children('.upload-display').remove();
            $(".upload-name").val("파일선택");
        });
    });

    $(document).ready(function () {
        var fileTarget = $('.attachFilebox .attach-upload-hidden');

        fileTarget.on('change', function () {
            if (window.FileReader) {
                // 파일명 추출
                var filename = $(this)[0].files[0].name;
            } else {
                // Old IE 파일명 추출
                var filename = $(this).val().split('/').pop().split('\\').pop();
            };

            $(this).siblings('.attach-upload-name').val(filename);
        });

        $("#deleteFile").on("click", function () {
            var parent = $(this).parent();
            $(".attach-upload-name").val("파일선택");
        });
    });

</script>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">이벤트 등록</h3>
                </div>
                <!-- /.box-header -->

                <form role="form" name="fileForm" method="post" class="form-horizontal" enctype="multipart/form-data">
                    <input type='hidden' name='page' value="${cri.page}">
                    <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                    <input type='hidden' name='searchType' value="${cri.searchType}">
                    <input type='hidden' name='keyword' value="${cri.keyword}">

                    <div class="box-body box-form-custom">
                        <div class="form-group input-long">
                            <label for="title" class="col-sm-2 control-label">제목</label>
                            <div class="col-sm-10">
                                <input type="text" name='title' class="form-control" placeholder="제목..." id="title">
                            </div>
                        </div>
                        <div class="form-group input-long">
                            <label for="" class="col-sm-2 control-label">내용</label>
                            <div class="col-sm-10">
                                <textarea rows="5" name="content" class="form-control" placeholder="내용..."></textarea>
                            </div>
                        </div>
                        <div class="form-group input-long">
                            <label for="applylink" class="col-sm-2 control-label">신청 링크</label>
                            <div class="col-sm-10">
                                <input type="text" name='applylink' class="form-control" placeholder="신청링크...">
                            </div>
                        </div>
                        <div class="form-group input-long">
                            <label for="paylink" class="col-sm-2 control-label">결제 링크</label>
                            <div class="col-sm-10">
                                <input type="text" name='paylink' class="form-control" placeholder="결제링크...">
                            </div>
                        </div>
                        <div class="form-group input-long">
                            <label for="name" class="col-sm-2 control-label">이미지</label>
                            <div class="filebox preview-image">
                                <div class="col-sm-10">

                                    <!-- 사진 사이즈는 1MB ~ 5MB까지 -->
                                    <input type="text" class="upload-name" value="파일선택" readonly="readonly" name="imgName" id="imgValue">
                                    <label for="input-file">불러오기</label>
                                    <input type="file" id="input-file" class="upload-hidden" name="imgFile">
                                    <label for="deleteImg">삭제</label>
                                    <button type="button" id="deleteImg" style="display: none">삭제</button>

                                </div>
                            </div>
                        </div>

                        <div class="form-group input-long">
                            <label for="name" class="col-sm-2 control-label">첨부 파일</label>
                            <div class="attachFilebox">
                                <div class="col-sm-10">

                                    <!-- 사진 사이즈는 1MB ~ 5MB까지 -->
                                    <input type="text" class="attach-upload-name" value="파일선택" readonly="readonly" name="attachName">
                                    <label for="attach-input-file">불러오기</label>
                                    <input type="file" id="attach-input-file" class="attach-upload-hidden" name="attachFile">
                                    <label for="deleteFile">삭제</label>
                                    <button type="button" id="deleteFile" style="display: none">삭제</button>

                                </div>
                            </div>
                        </div>

                        <!-- adminId를 강제로 hbc로 넘겨줌 -->
                        <input type="hidden" name="adminId" value="${login.adminId}">

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer btn-group-center">
                        <button type="button" class="btn btn-cancel">취소</button>
                        <button type="button" class="btn btn-primary" onclick="imgFileCheck()">등록</button>
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

<script>
    $(document).ready(
        function () {
            $(".btn-cancel")
                .on("click", function () {
                    self.location = "/admin/eventBoard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
                        + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
                });
        });
</script>

<%@include file="../include/footer.jsp"%>