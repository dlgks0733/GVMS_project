
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../include/header.jsp"%>

<!-- Start main-content -->
<style>

</style>

<section class="content">
	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">메인 링크 목록</h2></div>
				
					<div class="box-wrap">
						<table class="table table-striped">
							<tr>
								<th style="width:10%">센터번호</th>
								<th>센터명</th>
								<th>링크</th>
								<th>날짜</th>
							</tr>
							
							<c:forEach items="${list}" var="list" varStatus="status">

								<tr>
									<td style="text-align: center; vertical-align:middle;">${list.compNum}</td>
									
									<td style="text-align: center; vertical-align:middle;">
									<a  href='/admin/mainLink/modify?compNum=${list.compNum}'>
											${list.compName} </a></td>
									<td style="text-align: center;">
									<span><div class="thumb">
										<iframe id="vid_prv" height="170px"
											src="https://www.youtube.com/embed/${list.linkName}"
											frameborder="0" gesture="media" allow="encrypted-media"
											allowfullscreen></iframe>
									</div></span></td>
									<td style="text-align: center; vertical-align:middle;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.regdate}" /></td>
								</tr>

							</c:forEach>
						
						</table>
						<div class="box-footer">
							<div class="btn-group-custom " >
							<button id="newBtn" class="btn btn-default" type="submit">
										신규등록
										</button>
										</div>
						</div>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- .box-wrap END -->
			</div>
		
		<!--/.col (left) -->

	<!-- /.row -->
</section>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}

	$('#newBtn').on("click", function(evt) {
		self.location = "register${pageMaker.makeSearch(pageMaker.cri.page) }";
	});
	

					
</script>
<%@include file="../include/footer.jsp"%>