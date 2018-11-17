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
					<h2 class="box-title">과목 목록</h2>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<div class="row">
								<div class="col-md-2 col-xs-4">
									<select name="searchType" class="form-control">
										<option value="c"
											<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
											과목명</option>
										<option value="t"
											<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
											담당 선생님명</option>
										<option value="ct"
											<c:out value="${cri.searchType eq 'ct'?'selected':''}"/>>
											과목명, 담당 선생님명</option>
									</select>
								</div>
								<div class="col-md-4 col-xs-8">
									<input type="text" class="form-control"
										placeholder="키워드를 입력하세요" id="keywordInput">
								</div>
							</div>
							<div class="row">
								<div class="btn-group-custom">
									<button type="submit" id ="btn-default" class="btn btn-default">
										<i class="fa fa-search"></i> 검색
									</button>
								</div>
							</div>
						</div>
						<table class="table table-striped">
							<tr>
								<th>번호</th>
								<th>과목 번호</th>
								<th>과목명</th>
								<th>담당 선생님</th>
							</tr>
							<!-- 나중에 지워주세요 -->
							<!-- 나중에 지워주세요 END -->
							<c:forEach items="${list}" var="courseVO" varStatus="status">

								<%-- <td>${(pageMaker.totalCount - status.index) - (pageMaker.cri.page-1) * pageMaker.cri.displayPageNum} </td>  --%>

								<tr>
									<td style="text-align: center;">${(pageMaker.totalCount - status.index) - (pageMaker.cri.page-1) * pageMaker.listCount(pageMaker.cri.page)}
									</td>
									<td style="text-align: center;">${courseVO.cournum}</td>
									<td style="text-align: center;"><a
										href='/admin/course/modify${pageMaker.makeAppSearch(pageMaker.cri.page) }&cournum=${courseVO.cournum}'>
											${courseVO.courname} </a></td>
									<td style="text-align: center;">${courseVO.empname}</td>
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
						</div>
						<!-- .text-center END -->
						<div class="btn-group-custom">
							<a type="button" href="/admin/course/register"
								class="btn btn-default">신규 등록</a>
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

<script type="text/javascript">
	// 가격 포매팅
	// ex) 99,000
	// 진재환이 추가함
	function addCommaOnPrice() {
		for (var idx = 0; idx < document.getElementsByClassName("price").length; idx++) {
			// 페이지 내에 있는 가격을 불러옴
			var num = document.getElementsByClassName("price")[idx].textContent;

			// 숫자 길이
			var len;

			// 3자리 마다 콤마를 넣는 지점
			var point;

			// 숫자값을 넣을 문자열
			var str = "￦";

			// num을 일단 문자열로 바꿈
			num = num + "";

			// 3자리 지점
			point = num.length % 3;

			// len 변수를 받은 숫자값 길이로 초기화함
			len = num.length;

			// str 변수를 num의 0번째 인덱스부터
			// 3자리 지점까지 잘라내서 초기화함
			// ex) 가격 12345678원의 길이 8
			// 길이 8을 3으로 나눈 나며지는 2
			// 인덱스 0부터 2까지 잘라내면
			// 12만 남고 나머지는 버려짐
			str += num.substring(0, point);

			// 3자리 지점이 num의 길이보다 작을동안에 루프실행
			while (point < len) {
				// str 변수가 비어있지 않으면 콤마 추가
				if (str != "")
					str += ",";
				// str 변수에 3자리 지점에 계속 3을 더해서
				// 콤말를 추가함
				str += num.substring(point, point + 3);
				point += 3;
			}

			document.getElementsByClassName("price")[idx].textContent = str;
		}
	}

	// 현재 뷰를 요청하면 함수가 자동으로 실행됨
	/*************************************/
	//addCommaOnPrice();
	/*************************************/
</script>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	if (result == 'FAIL') {
		alert("수강 신청된 과목은 삭제할 수 없습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#btn-default').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

			});
</script>

<%@include file="../include/footer.jsp"%>
