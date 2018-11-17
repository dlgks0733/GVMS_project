<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->

            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">SD 갤러리 목록</h3>
                </div>


                <div class="box-wrap">
                    <div class="box-body">
                        <div class='box-keyword'>
                            <div class="row" align="right">
                                <div class="col-md-2 col-xs-12">
                                    <select name="searchType" class="form-control" id="searchType">
                                        <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}" />> 제목
                                        </option>
                                        <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}" />> 내용
                                        </option>
                                        <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}" />> 제목
                                        또는 내용
                                        </option>
                                    </select>
                                </div>
                                <div class="col-md-5 col-xs-12">
                                    <input class="form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword }' placeholder="키워드를 입력하세요">
                                </div>
                                <div class="row">
									<div  class="btn-group-custom">
										<button id="searchBtn" type="submit" class="btn btn-default"><i class="fa fa-search"></i>검색</button>
									</div>
								</div>
                            </div>
                        </div>


                        <table class="table table-striped" style="text-align: center">
                            <tr align="center">
                                <th align="center">번호</th>
                                <th align="center">제목</th>
                                <th align="center">작성자</th>
                                <th align="center">작성일자</th>
                                <th align="center">조회수</th>
                            </tr>

                            <c:forEach items="${list}" var="GalleryBoardVO" varStatus="status">
                                <tr>
                                    <td>${(pageMaker.totalCount - status.index) - (pageMaker.cri.page-1) * pageMaker.listCount(pageMaker.cri.page)}</td>
                                    <td><a href='/admin/imgGallery/modify${pageMaker.makeSearch(pageMaker.cri.page) }&galnum=${GalleryBoardVO.galnum}'>
                                            ${GalleryBoardVO.title}</a></td>
                                    <td>${GalleryBoardVO.adminId}</td>
                                    <td>
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${GalleryBoardVO.regdate}" />
                                        <td>${GalleryBoardVO.viewcnt}</td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>

                    <!-- /.box-body -->

                    <div class="box-footer">

                        <div class="text-center">
                            <ul class="pagination theme-colored xs-pull-center mb-xs-40">
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
                        </div>

                    </div>
                    <!-- /.box-footer-->

                    <div class="box-footer" align="right">
                        <!-- <a type="button" href="/admin/imgBoard/register"
                      class="btn btn-default">신규 등록</a> -->
                        <a type="button" href="/admin/imgGallery/register${pageMaker.makeSearch(pageMaker.cri.page)}" class="btn btn-default">신규
                            등록</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col (left) -->
</section>
<!-- /.content -->


<script>
    $(document).ready(
        function () {

            $('#searchBtn').on(
                "click",
                function (event) {

                    self.location = "list"
                        + '${pageMaker.makeQuery(1)}'
                        + "&searchType="
                        + $("select option:selected").val()
                        + "&keyword=" + $('#keywordInput').val();

                });
        });
</script>

<footer>
   <%@ include file="../include/footer.jsp"%>
</footer>