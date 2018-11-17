<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>
<style>
#center {
text-align:center
}

</style>
<!-- Main content -->
<section class="content">
   <div class="row">
      <!-- left column -->
      <div class="col-md-12">
         <!-- general form elements -->

         <div class="box">
            <div class="box-header with-border">
               <h3 class="box-title">보도자료 목록</h3>
            </div>

            <div class='box-wrap'>
               <div class="box-body">
                  <div class="box-keyword">
                     <div class="row">
                        <div class="col-md-2 col-xs-4">
                           <select name="searchType" class="form-control">
                              <option value="t"
                                 <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                                 제목</option>
                              <option value="c"
                                 <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
                                 내용</option>
                              <option value="tc"
                                 <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
                                 제목 + 내용</option>
                           </select>
                        </div>
                        <div class="col-md-4 col-xs-8">
                           <input type="text" class="form-control" name='keyword' id="keywordInput" value='${cri.keyword }'>
                        </div>
                        <div class="btn-group-custom">
                           <button id='searchBtn' class="btn btn-default"><i class="fa fa-search"></i> 검색</button>
                        </div>
                     </div>
                  </div>
                  <!-- 검색기능 -->
                  <table class="table table-striped" id="center">
                     <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회수</th>
                     </tr>
   
                     <c:forEach items="${list}" var="newsVO" varStatus="status">
                        <%-- 기존의 번호 표현 : ${NewsVO.newsNum} --%>
                        <!-- status.index를 쓰려면 위에 varStatus="status"를 써줘야 한다. -->
                        <tr>
                           <td>${(pageMaker.totalCount - status.index) - pageMaker.listCount(pageMaker.cri.page)}</td>
                           <td><a
                              href='/admin/news/modify${pageMaker.makeSearch(pageMaker.cri.page) }&newsNum=${newsVO.newsNum}'>${newsVO.newsTitle}</a></td>
                           <td>${newsVO.adminId}</td>
                           <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                 value="${newsVO.newsRegDate}" /></td>
                           <td>${newsVO.newsViewCnt}</td>
                        </tr>
   
                     </c:forEach>
   
                  </table>
                  
                  
               </div>

               

               <div class='box-footer'>
                  <!-- 등록 버튼 -->
                  <div class="btn-group-custom">
                     <button id='newBtn' class="btn btn-default">신규 등록</button>
                  </div>
                  
                  <div class="text-center">
                     <ul class="pagination">
   
                        <c:if test="${pageMaker.prev}">
                           <li><a
                              href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                        </c:if>
   
                        <c:forEach begin="${pageMaker.startPage }"
                           end="${pageMaker.endPage }" var="idx">
                           <li
                              <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                              <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
                           </li>
                        </c:forEach>
   
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                           <li><a
                              href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
                        </c:if>
   
                     </ul>
                  </div>
               </div>
            </div>
            
            <!-- 페이징 부분 -->
            <!-- /.box-footer-->
         </div>
      </div>
      <!--/.col (left) -->

   </div>
   <!-- /.row -->
</section>
<!-- /.content -->

<script>
   var result = '${msg}';

   if (result == 'SUCCESS') {
      alert("처리가 완료되었습니다.");
   }
</script>
<!-- 스크립트 메세지 -->

<!-- 페이지이동 스트립트 -->

<script>
   $(document).ready(
         function() {

            $('#searchBtn').on(
                  "click",
                  function(event) {

                     self.location = "/admin/news/list"
                           + '${pageMaker.makeQuery(1)}'
                           + "&searchType="
                           + $("select option:selected").val()
                           + "&keyword=" + $('#keywordInput').val();

                  });

            $('#newBtn').on("click", function(evt) {

               self.location = "/admin/news/register";

            });

         });
</script>
<!-- 검색버튼, 등록버튼 스크립트 -->

<form id="jobForm">
   <input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
   <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>






<%@include file="../include/footer.jsp"%>