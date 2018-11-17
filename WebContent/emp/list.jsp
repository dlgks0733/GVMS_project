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
					<h2 class="box-title"> 직원 목록</h2>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<div class="row">
								<div class="col-md-2 col-xs-4">
									<select name="searchType" class="form-control">
										<option value="n"
											<c:out value="${cri.searchType == null?'selected':''}"/>>
											---
										</option>
										<option value="n"
											<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>
											이름</option>
										<option value="p"
											<c:out value="${cri.searchType eq 'p'?'selected':''}"/>>
											직책</option>
										<option value="np"
											<c:out value="${cri.searchType eq 'np'?'selected':''}"/>>
											이름+직책</option>
									</select>			
								</div>
								<div  class="col-md-4 col-xs-8">
									<input type="text" id="keywordInput" class="form-control" placeholder="키워드를 입력하세요">
								</div>
							</div>
							<div class="row">
								<div  class="btn-group-custom">
									<button id="searchBtn" type="submit" class="btn btn-default"><i class="fa fa-search"></i> 검색</button>
								</div>
							</div>
						</div>
						<table class="table table-striped">
							<tr>
								<th>직원번호</th>
								<th>이름</th>
								<th>직책</th>
								<th>소속기관</th>
							</tr>
							<c:forEach items="${list}" var="employeeVO" varStatus="status">
	
								<%-- <td>${(pageMaker.totalCount - status.index) - (pageMaker.cri.page-1) * pageMaker.cri.displayPageNum} </td>  --%>
	
								<tr>
<%-- 									<td style="text-align: center;">${(pageMaker.totalCount - status.index) - (pageMaker.cri.page-1) * pageMaker.listCount(pageMaker.cri.page)} --%>
<!-- 									</td> -->
									<td style="text-align: center;">${employeeVO.empnum}</td>
									<td style="text-align: center;"><a
										href='modify${pageMaker.makeAppSearch(pageMaker.cri.page) }&empnum=${employeeVO.empnum}'>
											${employeeVO.empname} </a></td>
									<td style="text-align: center;">${employeeVO.position}</td>
									<td style="text-align: center;">${employeeVO.compname}</td>
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
										href="list${pageMaker.makeAppSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>
	
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeAppSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
	
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeAppSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div> <!-- .text-center END -->
						<div class="btn-group-custom">
							<a type="button" href="/admin/emp/register" id="newBtn" class="btn btn-default">신규 등록</a>
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

<script>
$(document).ready(function() {

			$('#searchBtn').on("click", function(event) {

					self.location = "list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();

			});

			$('#newBtn').on("click", function(event) {
				
				self.location = "register"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
			});


});
</script>

<%@include file="../include/footer.jsp"%>
