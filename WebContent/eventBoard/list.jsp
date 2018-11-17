<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->

        <div class="col-md-12">
            <!-- general form elements -->

            <div class="box">
                <div class="box-header with-border">
                    <h2 class="box-title"> 이벤트 목록</h2>
                </div>
                <div class="box-wrap">
                    <div class="box-body">
                        <form name="form">
                            <div class='box-keyword'>
                                <div class="row">
                                    <div class="col-md-2 col-xs-4">
                                        <select name="searchType" class="form-control" id="searchType">
                                            <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}" />> 제목
                                            </option>
                                            <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}" />> 내용
                                            </option>
                                            <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}" />>
                                            제목 또는 내용
                                            </option>
                                        </select>
                                    </div>
                                    <div class="col-md-5 col-xs-8">
                                        <input class="form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword}' placeholder="키워드를 입력하세요">
                                    </div>
                                </div>
                                <div class="row">
                                	<div  class="btn-group-custom">
	                                     <button id='searchBtn' type="submit" class="btn btn-default">
	                                         <i class="fa fa-search"></i>검색
	                                     </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class="table table-striped" style="text-align: center">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회수</th>
                        </tr>
                        <c:forEach items="${list}" var="EventBoardVO" varStatus="status">

                            <tr>
                                <td style="text-align: center;">${(pageMaker.totalCount - status.index) - (pageMaker.cri.page-1)
                                    * pageMaker.listCount(pageMaker.cri.page)}
                                </td>
                                <%--                            <td style="text-align: center;">${EventBoardVO.num}</td> --%>
                                    <td><a href='modify${pageMaker.makeSearch(pageMaker.cri.page)}&num=${EventBoardVO.num}'>
                                            ${EventBoardVO.title} </a></td>
                                    <td style="text-align: center;">${EventBoardVO.adminId}</td>
                                    <td style="text-align: center;">
                                        <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${EventBoardVO.regdate}" />
                                    </td>
                                    <td style="text-align: center;">${EventBoardVO.viewcnt}</td>
                            </tr>

                        </c:forEach>

                    </table>
                </div>
                <!-- /.box-body -->


                <div class="box-footer">

                    <div class="text-center">
                        <ul class="pagination">

                            <c:if test="${pageMaker.prev}">
                                <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                            </c:if>

                            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" />>
                                <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div> <!-- .text-center END -->
                    <div class="btn-group-custom">
                        <a type="button" href="/admin/eventBoard/register${pageMaker.makeSearch(pageMaker.cri.page)}" class="btn btn-default">신규
                            등록</a>
                    </div>
                </div> <!-- .box-footer END -->
            </div> <!-- .box-wrap END -->
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

<%@include file="../include/footer.jsp"%>