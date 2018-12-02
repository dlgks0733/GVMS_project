<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>


<!-- Main content -->

<!-- <style>
#container {width: 960px; margin: 0 auto;}
#container #input-form {text-align: center;}
#user-table {margin: 0 auto; text-align: center;}
#input-form {margin-top: 10px; margin-bottom: 10px;}
#user-table {border-collapse: collapse;}
#user-table > thead > tr { background-color: #222; color:#fff; }
#user-table > thead > tr > th { padding: 8px; width: 150px; }
#user-table > tbody > tr > td { border-bottom: 1px solid gray; padding:8px; }
</style> -->


<section class="content">
	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">학생 목록</h2>
				</div>
				<div class="box-wrap">
					<div class="box-body">
						<div class="box-keyword">
							<form method="get">
								<div class="row">
									<div class="col-md-2 col-xs-4">
										<select class="form-control" name="searchType">
											<option>이름</option>
											<!-- <option value="s" -->
												<c:out value="${cri.searchType eq 's'?'selected':''}"/>>
												
										</select>
									</div>
									<div class="col-md-4 col-xs-8">
										<input type="text" class="form-control"
											placeholder="이름을 입력하세요" id="keyword" onkeydown="return enter(event)"
											value="${cri.keyword}">
									</div>
								</div>
								<div class="row">
									<div class="btn-group-custom">
									<!-- 	<button type="submit" class="btn btn-default">
											<i class="fa fa-search" ></i> 검색
										</button> -->
									</div>
								</div>
							</form>
						</div>
						<form name="frm" role="form">
							<div style="overflow-y: scroll; height: 400px;">
								<table class="table table-bordered" id="user-table">
								<thead>
								
								

									<tr>
										<!-- input type checkbox? -->
										<th style="width : 10px"> <input type = "checkbox" name = "AllCheck" ></th>
										<th style="text-align: center;">학번</th>
										<th style="text-align: center;">이름</th>
										<th style="text-align: center;">재적상태</th>
									</tr>
									</thead>
									<c:forEach items="${list}" var="StudentVO">
									<tbody>

										<tr>
											<td style="width : 10; text-align: center;"><input type="checkbox"
												value="${StudentVO.stuId}" name="stuCheck"></td>
											<td style="text-align: center;">${StudentVO.stuId}</td>
											<td style="text-align: center;"><a
												href="/student?command=stud_modi_form&stuId=${StudentVO.stuId}&stuName=${StudentVO.stuName}&stuStat=${StudentVO.stuStat}">${StudentVO.stuName}</a></td>
											<td style="text-align: center;">${StudentVO.stuStat}</td>
											<%-- <td style="text-align: center;"><a
										href='/admin/student/modify${pageMaker.makeAppSearch(pageMaker.cri.page) }
											&stuid=${studentVO.stuid}'>
											${studentVO.stuname} </a></td>
									<td style="text-align: center;">${studentVO.stuphone}</td> --%>
										</tr>
										</tbody>
									</c:forEach>

								</table>
                                </div>
								<button type="button" class="btn btn-danger">삭제</button>
								<a type="button" href="/student?command=stud_reg_form"
									class="btn btn-default">신규 등록</a>
						</form>
					
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
							<!-- jsp 주소로 바꿈  -->
							<!--   <button type="submit" class="btn btn-danger" id="submitbutton">삭제</button> -->
							<!-- <a type="button" href="/student?command=stud_reg_form"
								class="btn btn-default">신규 등록</a>  -->
							<!-- <a type="button" href="/student?command=stud_modi_form"
							    class="btn btn-default">수정</a> -->
							<!--   <a type="button" href="/student/delete.jsp"
							    class="btn btn-default">삭제</a> -->
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

	var formObj = $("form[role='form']");

	console.log(formObj);

	$(".btn-primary").on("click", function() {
		self.location = "/student/register.jsp";
	});
	
	$(".btn-danger").on("click", function() {
		formObj.attr("action", "student?command=stud_delete");
		formObj.attr("method", "post");
		formObj.submit();
		alert("삭제가 완료되었습니다.");

	});

});

		
		
		

$("input[name=AllCheck]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='stuCheck']").prop("checked", true);
	} else{
		$("input[name='stuCheck']").prop("checked", false);
	}
});


	$(document).ready(
			function() {

				var formObj = $("form[role='form']");

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

				$(".btn-danger").on("click", function() {
					formObj.attr("action", "student?command=stud_delete");
					formObj.attr("method", "post");

					var isChk = false;

					var arrStu = document.getElementsByName("stuCheck");

					for (var i = 0; i < arrStu.length; i++) {
						if (arrStu[i].checked == true) {
							isChk = true;
							break;
						}
					}

					if (!isChk) {
						alert("선택된 학생이 없습니다.");
					} else {
						formObj.submit();
					}
				});

			});

	function validateDelete() {
		var isChk = false;

		var arrStu = document.getElementsByName("stuCheck");

		for (var i = 0; i < arrStu.length; i++) {
			if (arrStu[i].checked == true) {
				isChk = true;
				break;
			}
		}

		if (!isChk) {
			alert("선택된 학생이 없습니다.");
			return false;
		} else {
			document.frm.submit();
		}

	}
	
	
	$(document).ready(function() {
		$("#keyword").keyup(function(){
			var k = $(this).val();
			$("#user-table > tbody > tr").hide();
			var temp = $("#user-table > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
			
			$(temp).parent().show();
		})
	})
	
	function enter(e){
	if(window.event){
		key = window.event.keyCode;
	}else if(e){
		key = e.which;
	}
	if(key==13){
		return false    
	}
}
	
</script>

<%@include file="../include/footer.jsp"%>
