<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<script type="text/javascript" src="/resources/admin/validity/board.js?ver=3"></script>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->

                        <div class="col-md-12">
                            <!-- general form elements -->

                            <div class="box">
                                <div class="box-header with-border">
                                    <h2 class="box-title">동영상 목록</h2>
                                </div>
                                <div class="box-wrap">
	                                <div class="box-body">
	                                    <div class="box-keyword">
	                                    <div class="row">
	                                            <div class="col-md-3 mb col-xs-12">
	                                                <select name="numType" id="numType" class="form-control" onchange="if(this.value) location.href=(this.value);">
	                                                    <option value="/admin/videoBoard/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&numType=${clist.compnum}">정렬 기준
	                                                    </option>
	                                                    <c:forEach var="clist" items="${lists}">
	                                                        <option <c:out value="${cri.numType eq clist.compnum ?'selected':''}" /> value="/admin/videoBoard/list?page=1&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&numType=${clist.compnum}">${clist.compname}
	                                                        </option>
	
	                                                    </c:forEach>
	                                                </select>
	                                            </div>
	
	                                            <div class="col-md-3 col-xs-4">
	                                                <select name="searchType" id="sl" class="form-control">
	                                                    <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}" />> 제목
	                                                    </option>
	                                                    <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}" />> 내용
	                                                    </option>
	                                                    <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}" />> 제목 or 내용</option>
	                                                </select>
	                                            </div>
	                                            <div class="col-md-4 col-xs-8">
	                                                <input class="form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword}' placeholder="키워드를 입력하세요">
	                                            </div>
	                                            <div class="col-md-2 col-xs-2 btn-group-custom">
	                                                <button id='searchBtn' type="submit" class="btn btn-default">
	                                                    <i class="fa fa-search"></i> 검색
	                                                </button>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    </div>

                                    <table class="table table-striped">
                                        <tr>
                                            <th>번호</th>
                                            <th>기관명</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                            <th>조회수</th>
                                        </tr>
                                        <c:forEach items="${list}" var="videoBoardVO" varStatus="status">

                                            <tr>
                                                <!-- 넘버링 역순출력 -->
                                                <td style="text-align: center;">${(pageMaker.totalCount - status.index) - pageMaker.listCount(pageMaker.cri.page)*2}</td>
                                                <td style="text-align: center;">${videoBoardVO.compname}</td>
                                                <td style="text-align: center;">
                                                    <a href='modify${pageMaker.makeSearch(pageMaker.cri.page) }&num=${videoBoardVO.num}'>
                                                        ${videoBoardVO.title} </a>
                                                </td>
                                                <td style="text-align: center;">${videoBoardVO.adminid}</td>
                                                <td style="text-align: center;">
                                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${videoBoardVO.regdate}" />
                                                </td>
                                                <%-- <td><span class="badge bg-red">${videoBoardVO.viewcnt }</span></td> --%>
                                                    <td style="text-align: center;">
                                                        <span class="">${videoBoardVO.viewcnt }</span>
                                                    </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    </div>
                                    
                                    <div class="box-footer">

                                        <div class="text-center">
                                            <ul class="pagination">

                                                <c:if test="${pageMaker.prev}">
                                                    <li>
                                                        <a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&numType=${cri.numType}">&laquo;</a>
                                                    </li>
                                                </c:if>

                                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                                    <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" />>
                                                    <a href="list${pageMaker.makeSearch(idx)}&numType=${cri.numType}">${idx}</a>
                                                    </li>
                                                </c:forEach>

                                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                                    <li>
                                                        <a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&numType=${cri.numType}">&raquo;</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                        <!-- .text-center END -->
                                        <div class="btn-group-custom">
                                            <button id="newBtn" class="btn btn-default" type="submit">
                                                신규등록
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <!-- .box-footer END -->
                        </div>
                        <!-- .box-wrap END -->
                    <!-- /.row -->
                </section>
                <!-- /.content -->


                <script>
                    var result = '${msg}';

                    if (result == 'SUCCESS') {
                        alert("처리가 완료되었습니다.");
                    }
                </script>

                <script>
                    $(document).ready(

                        function () {
                            $('#searchBtn').on("click", function (video) {
                                if (document.getElementById("sl").value == "n") {
                                    alert("검색항목을 선택해주세요")
                                    //document.searchType.option.focus();
                                    return false;

                                } else if (document.getElementById("keywordInput").value == "") {
                                    alert("검색단어를 입력해주세요");
                                    return false;

                                } else {
                                    self.location = "list"
                                        + '${pageMaker.makeQuery(1)}'
                                        + "&searchType="
                                        + $("#sl option:selected").val()
                                        + "&keyword="
                                        + $('#keywordInput').val();
                                }
                            });


                            $('#newBtn').on("click", function () {
                                self.location = "register${pageMaker.makeSearch(pageMaker.cri.page) }";
                            });
                        });

                </script>

                <%@include file="../include/footer.jsp"%>