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
					<form method="post" action="score?command=scoreRegSubSearch">
								<input type="text" name="subName">
								<input type="hidden" name = "p_index" value="${p_index}" >
								<input type="submit" class="btn btn-default" value="검색">
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
						<table class="table table-striped">
							<tr>
								<th>대분류</th>
								<th>중분류</th>
								<th>항목 명</th>
								<th>항목 점수</th>
							</tr>
							<c:forEach items="${list}" var="SubjectVO" varStatus="listStat">
							<input type="hidden" name = "p_index" class="p_index"  value="${p_index}" >
								<tr style="cursor : pointer;">
									<td style="text-align: center;"onclick="sendParentData('${listStat.index}', '${SubjectVO.subId}','${p_index}')">${SubjectVO.major}</td>
									<td style="text-align: center;"onclick="sendParentData('${listStat.index}', '${SubjectVO.subId}','${p_index}')">${SubjectVO.middle}</td>
									<td class="subName" style="text-align: center;"onclick="sendParentData('${listStat.index}', '${SubjectVO.subId}','${p_index}')">${SubjectVO.subName}</td>
									<td class="score" style="text-align: center;"onclick="sendParentData('${listStat.index}', '${SubjectVO.subId}','${p_index}')">${SubjectVO.subScore}</td>
								</tr>
							<%-- <input type = "hidden" name = "${studentVO.stuid}stuid" value  = "${studentVO.stuid}">
               				<input type = "hidden" name = "${studentVO.stuid}stuname" value  = "${studentVO.stuname}"> --%>
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
										+ "&keyword="
										+ $('#keywordInput').val();

							});

					$('#newBtn').on("click", function(evt) {

						self.location = "register";

					});

				});
		
		function stuSelect(name) {
		
			/* opener.frm.cent_name_ok.value = 1; */

			
			opener.frm.stuid.value = document.getElementsByName(name + "stuid")[0].value;
			opener.frm.stuname.value = document.getElementsByName(name + "stuname")[0].value;
			
			
			/* opener.frm.cent_p_no.value = document.getElementsByName(name + "cent_p_no")[0].value;
			opener.frm.cent_addr.value = document.getElementsByName(name + "cent_addr")[0].value;
			opener.frm.cent_addr_dtl.value = document.getElementsByName(name + "cent_addr_dtl")[0].value;
			opener.document.getElementById("mod_btn").removeAttribute('disabled');
			opener.document.getElementById("del_btn").removeAttribute('disabled');
			opener.document.getElementById("ins_btn").disabled = "true";
			opener.frm.action = "cent.do?command=cent_modify"; */
			self.close();
		}
		
		function sendParentData(index, subId , p_index)
		{			
			
			
			var subID = subId;
			var parent_index = p_index;
			var score = document.getElementsByClassName("score")[index].innerHTML;
			var subName = document.getElementsByClassName("subName")[index].innerHTML;
			
			var subject = {
				"subID" : subID,
				"score" : score,
				"subName" : subName,
				"parent_index" : p_index
				
			};
						
			window.opener.getChildData(subject);
	
			this.window.close();
		}
		
	</script>


</body>
</html>