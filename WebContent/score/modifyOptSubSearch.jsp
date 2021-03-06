<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>인증항목 검색</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link	
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/admin/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/admin/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- 커스텀 스타일 -->
<link href="/resources/admin/custom.css" rel="stylesheet"
	type="text/css" />
<!-- CSS | Preloader Styles -->
<link href="/resources/css/preloader.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- jQuery 2.1.4 -->
<script src="/resources/admin/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>

<!-- JS | jquery plugin collection for this theme -->
<script src="/resources/js/jquery-plugin-collection.js"></script>
</head>

<body>
	<section class="content">
	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->
		
			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">인증항목 검색</h2>
					<p>
					<form method="post" action="score?command=scoreModOptSubSearch">
								<h5>항목 명 : <input type="text" name="subName">
								<input type = "hidden" name = "index"  value = "${index}">
								<input type="submit" class="btn btn-default" value="검색"></h5>
								</form>
								</p>
				</div>
				<!-- <div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
						<form method="post" action="main?command=subSearch">
								<input type="text" name="subName">
								<input type="submit" class="btn btn-default" value="검색">
								</form> -->
								<%-- <div class="row">
									<div class="col-md-2 col-xs-4">
										<select class="form-control" name="searchType">
											<option value="s"
												<c:out value="${cri.searchType eq 's'?'selected':''}"/>>
												항목 명</option>
										</select>
									</div>
									<div class="col-md-4 col-xs-8">
										<input type="text" class="form-control"
											placeholder="키워드를 입력하세요" name="subName" value="subName">
									</div>
								</div>
								<div class="row">
									<div class="btn-group-custom">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-search"></i> 검색
										</button>
									</div>
								</div> --%>
							<!-- </form> -->
						</div>
						<!-- <form name=frm method=post> -->
						<table class="table table-striped">
							<c:forEach items="${list}" var="ScoreVO" varStatus="listStat">
									<tr>
										<th colspan="4">선택 영역 검색된 항목</th>
									</tr>
									
									<tr>
										<th>대분류</th>
										<th>중분류</th>
										<th>항목 명</th>
										<th>항목 점수</th>
									</tr>
										
								<c:if test="${listEmp == 0}">
										<tr style="cursor : pointer;">
											<td style="text-align: center;">${ScoreVO.major}</td>
											<td style="text-align: center;">${ScoreVO.middle}</td>
											<td style="text-align: center;" onclick="sendOptSubInfo('${index}', '${ScoreVO.subId}','${ScoreVO.subName}','${ScoreVO.subScore}')">${ScoreVO.subName}</td>
											<td style="text-align: center;">${ScoreVO.subScore}</td>
										</tr>					
		               			</c:if>	
							</c:forEach>
							
							<c:if test="${listEmp == 1}">
							<tr>
								<th colspan="4">선택 영역 검색된 항목</th>
							</tr>
							<tr>
								<th>대분류</th>
								<th>중분류</th>
								<th>항목 명</th>
								<th>항목 점수</th>
							</tr>
								
								<tr style="cursor : pointer;">
									<td style="text-align: center;" colspan="4">검색된 항목이 없습니다.</td>
								</tr>
							</c:if>

						</table>
						
						<table class="table table-striped">
							<tr>
								<th colspan="4">선택 영역 전체 항목 목록</th>
							</tr>
							
							<tr>
								<th>대분류</th>
								<th>중분류</th>
								<th>항목 명</th>
								<th>항목 점수</th>
							</tr>
							<c:forEach items="${allOptList}" var="ScoreVO" varStatus="listStat">
								<tr style="cursor : pointer;">
									<td style="text-align: center;">${ScoreVO.major}</td>
									<td style="text-align: center;">${ScoreVO.middle}</td>
									<td style="text-align: center;" onclick="sendOptSubInfo('${index}', '${ScoreVO.subId}','${ScoreVO.subName}','${ScoreVO.subScore}')">${ScoreVO.subName}</td>
									<td style="text-align: center;">${ScoreVO.subScore}</td>
								</tr>		
							</c:forEach>
										<%-- <input type = "hidden" name = "subId"  value = "${ScoreVO.subId}">
										<input type = "hidden" name = "subName" value = "${ScoreVO.subName}">
										<input type = "hidden" name = "subScore" value = "${ScoreVO.subScore}"> --%>
							<%-- <input type = "hidden" name = "${studentVO.stuid}stuid" value  = "${studentVO.stuid}">
               				<input type = "hidden" name = "${studentVO.stuid}stuname" value  = "${studentVO.stuname}"> --%>

						</table>
						<!-- </form> -->
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
					</div>
					<!-- .box-footer END -->
				</div>
				<!-- .box-wrap END -->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row --> </section>
	<!-- /.content -->

	<script>
		/* var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		} */
	</script>
	
	<script>
		/* $(document).ready(
				function() {

					$('#searchBtn').on(
							"click",
							function(event) {

								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();

							});

					$('#newBtn').on("click", function(evt) {

						self.location = "register";

					});

				}); */
		
/* 		function stuSelect(name) {
		
			opener.frm.cent_name_ok.value = 1;

			
			opener.frm.stuid.value = document.getElementsByName(name + "stuid")[0].value;
			opener.frm.stuname.value = document.getElementsByName(name + "stuname")[0].value;
			
			
			opener.frm.cent_p_no.value = document.getElementsByName(name + "cent_p_no")[0].value;
			opener.frm.cent_addr.value = document.getElementsByName(name + "cent_addr")[0].value;
			opener.frm.cent_addr_dtl.value = document.getElementsByName(name + "cent_addr_dtl")[0].value;
			opener.document.getElementById("mod_btn").removeAttribute('disabled');
			opener.document.getElementById("del_btn").removeAttribute('disabled');
			opener.document.getElementById("ins_btn").disabled = "true";
			opener.frm.action = "cent.do?command=cent_modify"; 
			self.close();
		} */
		
/* 		function sendParentData(index, sub_id)
		{	
			var subID = sub_id;
			var score = document.getElementsByClassName("score")[index].innerHTML;
			var subName = document.getElementsByClassName("subName")[index].innerHTML;
			
			var subject = {
				"subID" : subID,
				"score" : score,
				"subName" : subName
			};
			
			window.opener.getChildDate(subject);

			
			this.window.close();
		} */
		
/* 		function useSubInfo() {
		
			
			opener.frm.subId.value = document.frm.subId.value;
			opener.frm.subName.value = document.frm.subName.value;
			opener.frm.subScore.value = document.frm.subScore.value;
			
			
		if (opener.frm.cent_no.value == '') {
				opener.document.getElementById("ins_btn").removeAttribute('disabled');
				opener.document.getElementById("mod_btn").disabled = "true";
				opener.document.getElementById("del_btn").disabled = "true";
			} 
			self.close();
		} */
	
	function sendOptSubInfo(index, subId, name, score){
		opener.setOptSubInfo(index, subId , name, score);
		this.window.close();
	}

		
	</script>


</body>
</html>