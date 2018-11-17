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
					<h2 class="box-title">공지사항 목록</h2>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<div class="row">
								<div class="col-md-2 col-xs-4">
									<select class="form-control" name="listType" id="listType">
										<option value="0"
											<c:out value="${cri.listType eq null?'selected':''}"/>>글머리</option>
										<option value="1"
											<c:out value="${cri.listType eq 1?'selected':''}"/>>필독</option>
										<option value="2"
											<c:out value="${cri.listType eq 2?'selected':''}"/>>공지</option>
										<option value="3"
											<c:out value="${cri.listType eq 3?'selected':''}"/>>일반</option>
									</select>
								</div>
								<div class="col-md-2 col-xs-4">
									<select class="form-control" name="searchType" id="searchType">
										<option value="n"
											<c:out value="${cri.searchType eq null?'selected':''}"/>>검색방법</option>
										<option value="t"
											<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
										<option value="x"
											<c:out value="${cri.searchType eq 'x'?'selected':''}"/>>내용</option>
										<option value="a"
											<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>글쓴이</option>
										<option value="tx"
											<c:out value="${cri.searchType eq 'tx'?'selected':''}"/>>제목
											OR 내용</option>
									</select>
								</div>
								<div class="col-md-4 col-xs-8">
									<input type="text" name='keyword' id="keywordInput"
										value='${cri.keyword}' class="form-control"
										placeholder="키워드를 입력하세요">
								</div>
							</div>
							<div class="row">
								<div class="btn-group-custom">
									<button type="submit" class="btn btn-default" id="searchBtn">
										<i class="fa fa-search"></i> 검색
									</button>
								</div>
							</div>
						</div>
						<table class="table table-striped">
							<tr>
								<th>번호</th>
								<th>글머리</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>

							<%-- <c:forEach items="${topList}" var="noticeVO" varStatus="status">
									<tr>
									<td style="text-align: center;">
										</td>
										<td style="text-align: center;">
											<c:if test="${noticeVO.noKeyword eq 1 }">필독</c:if>
											<c:if test="${noticeVO.noKeyword eq 2 }">공지</c:if>
											<c:if test="${noticeVO.noKeyword eq 3 }"></c:if>
										</td>
										<td><a
											href='/admin/notice/modify${pageMaker.makeSearch(pageMaker.cri.page) }&noNum=${noticeVO.noNum}'>
												${noticeVO.noTitle} </a></td>
										<td style="text-align: center;">${noticeVO.adminId}</td>
										<td style="text-align: center;"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${noticeVO.noRegDate}" /></td>
										<td style="text-align: center;">${noticeVO.noViewCnt}</td>
									</tr>
							</c:forEach> --%>
							
							<c:forEach items="${list}" var="noticeVO" varStatus="status">
									<tr>
										<td style="text-align: center;">
										${(pageMaker.totalCount - status.index) - pageMaker.listCount(pageMaker.cri.page)}
										</td>
										<td style="text-align: center;">
											<c:if test="${noticeVO.noKeyword eq 1 }">필독</c:if>
											<c:if test="${noticeVO.noKeyword eq 2 }">공지</c:if>
											<c:if test="${noticeVO.noKeyword eq 3 }"></c:if>
										</td>
										<td><a
											href='/admin/notice/modify${pageMaker.makeSearch(pageMaker.cri.page) }&noNum=${noticeVO.noNum}'>
												${noticeVO.noTitle} </a></td>
										<td style="text-align: center;">${noticeVO.adminId}</td>
										<td style="text-align: center;"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${noticeVO.noRegDate}" /></td>
										<td style="text-align: center;">${noticeVO.noViewCnt}</td>
									</tr>
							</c:forEach>

						</table>
					</div>
					<!-- /.box-body -->


					<div class="box-footer">

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
						<!-- .text-center END -->
						<div class="btn-group-custom">
							<a type="button" id="newBtn" class="btn btn-default">신규 등록</a>
						</div>
					</div>
					<!-- .box-footer END -->
				</div>
				<!-- .box-wrap END -->
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

<script>
	$(document).ready(function() {
		
		$("#listType").on("change", function(evnet){
			location.href="/admin/notice/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType="+this.value;
		});
		
		$('#searchBtn').on(
				"click",
				function(event) {
					
					if (document.getElementById("keywordInput").value != "" && document.getElementById("searchType").value == "n") {
						alert("검색항목을 선택해주세요")
						//document.searchType.option.focus();
						return false;

					} else if (document.getElementById("searchType").value != "n" && document.getElementById("keywordInput").value == "") {
						alert("검색단어를 입력해주세요");
						return false;

					} else {
						self.location = "list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("#searchType option:selected").val()
								+ "&keyword="
								+ $('#keywordInput').val()
								+ "&listType="
								+ $("#listType").val();
					}
				});
						
						$('#newBtn').on("click", function(evt) {

							self.location = "register";

						});
	});
					
</script>

<%@include file="../include/footer.jsp"%>
