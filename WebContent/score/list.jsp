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
					<h2 class="box-title">졸업점수 조회</h2>
				</div>	
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<form method="get">
							<div class="row">
								<div class="col-md-2 col-xs-4">
									<select class="form-control" name="searchType">
										<option>--</option>
										<option value="s"
											<c:out value="${cri.searchType eq 's'?'selected':''}"/>>
											이름
										</option>
										<option value="c"
											<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
											학번
										</option>
										<%-- <option value="sc"
											<c:out value="${cri.searchType eq 'sc'?'selected':''}"/>>
											총점
										</option> --%>
									</select>
								</div>
								<div  class="col-md-4 col-xs-8">
									<input type="text" class="form-control" placeholder="키워드를 입력하세요"
										name="keyword" value="${cri.keyword}">
								</div>
							</div>
							<div class="row">
								<div  class="btn-group-custom">
									<button type="submit" class="btn btn-default"><i class="fa fa-search"></i> 검색</button>
								</div>
							</div>
							</form>
						</div>
						
						<table class="table table-striped">
							<tr>
								<th>학번</th>
								<th>이름</th>
								<th>총점</th>
								<!-- <th>전화번호</th> -->
							</tr>
							<c:forEach items="${list}" var="StudentVO" varStatus="listStat">
									<%-- <input type="hidden" name="stu_id" value="${StudentVO.stu_id}">
									<input type="hidden" name="stu_name" value="${StudentVO.stu_name}"> --%>
								<!-- <form name ="frm" method ="post" action="score?command=readForm">
								<input type="hidden" name="stuId">
								<input type="hidden" name="stuName"> -->
										
								<tr>
									<td style="text-align: center;">${StudentVO.stuId}</td>
									<td style="text-align: center;"><a href="score?command=readForm&stuId=${StudentVO.stuId}&stuName=${StudentVO.stuName}">${StudentVO.stuName}</a></td>
									<td style="text-align: center;">${StudentVO.scoreTotal}</td>
									<%-- <td style="text-align: center;">${studentVO.stuphone}</td> --%>
								</tr>
								
							    </form>
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
						<!-- <div class="btn-group-custom">
							<a type="button" href="/admin/student/register" class="btn btn-default">신규 등록</a>
						</div> -->
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
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
	
/* function submitID(stuId, stuName)
{
	alert("ssss");
	var stuID = stuId;
	var stuName = stuName;
	/* var stu_name = document.getElementById("stu_name")[index].innerHTML; */
	document.getElementsByName("stuId")[0].value = stuID;
	document.getElementsByName("stuName")[0].value = stuName;
	document.getElementById("frm").submit();
} */
	

	
</script>

<%@include file="../include/footer.jsp"%>
