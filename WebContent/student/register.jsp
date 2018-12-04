<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
               <h3 class="box-title">학생 등록</h3>
            </div>
            <!-- /.box-header -->

            <form role="form" name="frm" method="post" class="form-horizontal">
               <!-- 
               onsubmit="return validateEmptyVal()" -->
               <input type="hidden" name="validation">
               <div class="box-body box-form-custom">


                  <div class="form-group input-with-button">
                     <label for="exampleInputEmail1"
                        class="col-sm-2 control-label pull-left">학번<span
                        class="must-mark">*</span></label>
                     <div class="col-md-3 col-xs-4 left-input">
                        <input name="stuId" class="form-control" type="text"  readonly="readonly"> <input
                           name="stuIdOk" class="form-control" type="hidden">
                     </div>
                     <div class="col-md-7 col-xs-5 right-button">
                        <button type="button" onClick="stuIdCheck()" id="idCheck">
                           <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                     </div>
                  </div>

                  <div class="form-group input-short">
                     <label for="exampleInputEmail1" class="col-sm-2 control-label">이름<span
                        class="must-mark">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" name='stuName' class="form-control"
                           placeholder="이름을 입력해주세요"> <span
                           id="validatePwEmailMessage"></span>
                     </div>
                  </div>

                  <div class="form-group input-short">
                     <label for="exampleInputEmail1" class="col-sm-2 control-label">재학
                        상태<span class="must-mark">*</span>
                     </label>
                     <div class="col-sm-10">
                        <select id='stuStat' name='stuStat'>
                           <option value='' selected>--선택--</option>
                           <option value='재학'>재학</option>
                           <option value='휴학'>휴학</option>
                        </select>
                     </div>
                  </div>

               </div>



               <!-- /.box-body -->

               <div class="box-footer btn-group-center">
                  <button id="ins_btn" class="btn btn-primary" type="submit"
                     onclick="return stuWriteCheck()">등록</button>
                  <a type="button" href="/student?command=studentListForm"
                     class="btn btn-default">취소</a>

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

<!-- </div> -->
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>



 <script>
   function stuWriteCheck() {
      if (document.frm.stuId.value == "") {
         alert("학번을 입력하세요");
         document.frm.stuId.focus();
         return false;
      } else if (document.frm.stuIdOk.value == "0") {
         alert("학번을 중복체크를 해주세요");
         document.frm.stuId.focus();
         return false;
      } else if (document.frm.stuName.value == "") {
         alert("학생 이름을 입력하세요");
         document.frm.stuName.focus();
         return false;
      } else if (document.frm.stuStat.value == "") {
         alert("재학 여부를 선택하세요");
         document.frm.stuStat.focus();
         return false;
      } else {
         var name = document.frm.stuName.value;
         var isCorrect = confirm(name + " 학생을 등록하시겠습니까?");
         if (isCorrect == true) {
            return true;
         } else {
            return false;
         }
      }
   }



   

   function stuIdCheck() {
      var url = "student?popup=no&command=stuIdCheck&stuId="
            + encodeURIComponent(document.frm.stuId.value);
      window
            .open(url, "_blank_1",
                  "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
   }
</script> 