 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="css/popup.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/cent.js?ver=4"></script>





<title>정비소 조회</title>
</head>
<body>
   <div class="popup_header">
      <p>
         <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;아이디
         중복 검사
      </p>
   </div>
   <div class="popup_body">

      <form name="frm" method="post" action="cent.do?command=cent_write_check_form&popup=yes">학번 &nbsp; 
      <input type="text" name="stuId" value="${stuId}">
         <button type="submit">조회</button>
         <input type="hidden" name="stuIdOk" value="1">

         <c:if test="${result==-1}">
            <div class="popup_box">

               <p>
                  '${stuId}'은 등록가능합니다.
                  <button type="button" onclick="useStuId()">사용</button>
               </p>

            </div>
         </c:if>

         <c:if test="${result==1}">

            <div class="popup_box">
               <p class="search-result_label">'${stuId}'은 중복입니다.</p>
            </div>
         </c:if>
      </form>



   </div>
<script>

   function useStuId() {

      opener.frm.stuId.value = document.frm.stuId.value;
      opener.frm.action = "student?command=stud_register";
      self.close();
   }

</script>

</body>
</html> 