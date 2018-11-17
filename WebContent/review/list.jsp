<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<style>
#center {
	text-align: center
}
</style>

<script>
	$(document).ready(
			function() {

				// 검색 버튼
				 $('#searchBtn').on(
                  "click",
                  function(event) {
                     
                     self.location = "list"
                        
                        + '${pageMaker.makeQuery(1)}'
                        + "&searchType="
                        + $("#searchType option:selected").val()
                        
                        + "&searchCour="
                        + $("#cour option:selected").val()
                        
                        + "&searchComp="
                        + $("#company option:selected").val()
                        + "&keyword=" + $('#keyword').val();

               });

				// 등록 버튼
				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">수강후기 목록</h2>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<div class="row mb">
								<div class="col-md-2 col-xs-5">
									<select id="company" name="companyNum"
										onchange="compSelect(this.value)" class="form-control">
										<option value="0">센터선택</option>
										<c:forEach items="${compSelect}" var="companyVO"
											varStatus="status">
											<!-- 게시물을 등록할 때 선택한 센터와
										          검색을 위해 선택한 센터정보가 같은 것을 불러오기 위함 -->
											<c:choose>
												<c:when test="${companyVO.compnum eq cri.searchComp}">
													<option value="${companyVO.compnum} " selected="selected">${companyVO.compname }</option>
												</c:when>
												<c:otherwise>
													<option value="${companyVO.compnum} ">${companyVO.compname }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2 col-xs-5">
									<select id="cour" name="cour" class="form-control">
										<option value="0">강좌선택</option>
										<c:forEach items="${courList}" var="cour" varStatus="status">
											<!-- 게시물을 등록할 때 선택한 강좌와
										          검색을 위해 선택한 강좌정보가 같은 것을 불러오기 위함 -->
											<c:choose>
												<c:when test="${cour.cournum eq cri.searchCour}">
													<option value="${cour.cournum} " selected="selected">${cour.courname }</option>
												</c:when>
												<c:otherwise>
													<option value="${cour.cournum} ">${cour.courname }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								</div>
								<div class="row">
									<div class="col-md-2 col-xs-4">
										<select id="searchType" name="searchType" class="form-control">
											<option value="n"
												<c:out value="${cri.searchType == null?'selected':''}"/>>
												---</option>
											<option value="t"
												<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
												제목</option>
											<option value="c"
												<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
												내용</option>
										</select>
									</div>
									<div class="col-md-4 col-xs-8">
										<input type="text" class="form-control" name="keyword"
											id="keyword" value="${cri.keyword }" placeholder="키워드를 입력하세요">
									</div>
								</div>
								<div class="row">
									<div class="btn-group-custom">
										<button id='searchBtn' type="submit" class="btn btn-default">
											<i class="fa fa-search"></i> 검색
										</button>
									</div>
								</div>
							
							<!-- 							<div class="row"> -->

							<!-- 							</div> -->
						</div>
						<table class="table table-striped" id="center">
							<tr>
								<th>번호</th>
								<th>기관명</th>
								<th>과목명</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<c:forEach items="${list}" var="reviewVO" varStatus="status">

								<tr>
									<td>${(pageMaker.totalCount-status.index) - pageMaker.listCount(pageMaker.cri.page)}</td>
									<td>${reviewVO.compName}</td>
									<td>${reviewVO.courName}</td>
									<td><a
										href='../review/modify${pageMaker.makeSearch(pageMaker.cri.page)}&reviewNum=${reviewVO.reviewNum}
										      &searchComp=${cri.searchComp}&searchCour=${cri.searchCour}'>
											${reviewVO.reviewTitle} </a></td>
									<td>${reviewVO.adminId}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${reviewVO.reRegDate}" /></td>
									<td>${reviewVO.reviewCnt}</td>
								</tr>
							</c:forEach>

						</table>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<div class="btn-group-custom">
							<a type="button" id='newBtn' href="/admin/review/register"
								class="btn btn-default">신규 등록</a>
						</div>
						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						<!-- .text-center END -->

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
</script>

<script type="text/javascript">
	//AJAX select box
	function compSelect(company) {

		$.ajax({
			type : "POST",
			url : "/admin/review/list.do",
			dataType : "json",
			data : {
				param : company
			},
			success : function(result) {

				//SELECT BOX 초기화           
				$("#cour").find("option").remove().end().append(
						"<option value='0'>강좌선택</option>");

				//배열 개수 만큼 option 추가
				$.each(result, function(i) {
					$("#cour").append(
							"<option value='"+result[i].cournum+"'>"
									+ result[i].courname + "</option>")
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류가 발생하였습니다.");
			}
		});
	}
</script>

<%@include file="../include/footer.jsp"%>
