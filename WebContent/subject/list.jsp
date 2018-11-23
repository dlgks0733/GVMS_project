<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

				<form method="post" action="subject?command=subDelete">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
<table class="table table-bordered">
	
	<tr>
	    <th> <input type = "checkbox" name = "ALL" onclick = "javascript:CheckAll()"></th>
		<th style="width: 10px"> NO </th>
		<th>대분류</th>
		<th>중분류</th>
		<th>항목명</th>
		<th style="width: 50px">점수</th>
	</tr>


<c:forEach items="${list}" var="SubjectVO">

	<tr>
		<td><input type ="checkbox" value="${SubjectVO.subId}" name="subId"></td>
		<td>${SubjectVO.subId}</td>
		<td>${SubjectVO.major}</td>
		<td>${SubjectVO.middle}</td>
		<td><a href ="/subject?command=subModifyForm&subId=${SubjectVO.subId}">${SubjectVO.subName}</a></td>
		<td>${SubjectVO.subScore}</td>		     
	</tr>
</c:forEach>
</table>

				</div>
				<!-- /.box-body -->

				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
			    <a type = 'button' value = "신규등록"  href = "http://localhost:8181/subject/register.jsp">	
				<button type = "submit">신규등록</button></a>	
	
				<button type = "submit">삭제</button>
			</form>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>

	/* var check = false;
	function CheckAll(){
		var chk = document.getElementsByName("subId[]");
		if(check == false){
			check = true;
			for(var i =0; <chk.length; i++){
				chk[i].checked = true;
			}
		}else{
			check = false;
			for(var i = 0; <chk.length; i++){
				chk[i].checked = false;
			}
		}
	}
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    } */
    
    </script>

<%@include file="../include/footer.jsp"%>
