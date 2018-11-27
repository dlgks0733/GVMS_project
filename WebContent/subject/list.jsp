<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->

<style>
* { margin:0; padding:0; }
ul,li { list-style:none; }
a { text-decoration:none; color:#000; }
.tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden; }
.tab li { float:left; width:50%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
.tab li { display:inline-block; padding:20px; cursor:pointer; }
.tab li.on { background-color:#eee; color:#f00; }
.tab_con { clear:both; margin-top:5px; border:1px solid #ddd; }
.tab_con div { display:none; height:500px; background:#fff; line-height:100px; text-align:center; }

</style>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

				
			
<form role = "form">
			<div class="box" >
				<div class="box-header with-border">
					<h3 class="box-title">인중평가 목록</h3>
				</div>
				<div class="box-body">

<ul class="tab" id="tab">
    <li>필수</li>
    <li>선택</li>
</ul>
항목명  : <input type="text" id="keyword" onkeydown = "return enter(event)">

<div class="tab_con" id="tab_con" style = "overflow:scroll;">
<!-- 필수영역 -->
<div>

 <table class="table table-bordered" id="user-table">
	<thead>
	<tr>
	    <th style="width: 15px;text-align: center;"> <input type = "checkbox" name = "essAllCheck" ></th>
		<th style="width: 15px;text-align: center;"> NO </th>
		<th style="width: 100px; text-align: center;">대분류</th>
		<th style="width: 100px;text-align: center;">중분류</th>
		<th style="width: 100px;text-align: center;">항목명</th>
		<th style="width: 50px;text-align: center;">점수</th>
	</tr>
	</thead>

<c:forEach items="${esslist}" var="SubjectVO">
	<tbody >
	<tr>
		<td><input type ="checkbox" value="${SubjectVO.subId}" name="essSubId" ></td>
		<td>${SubjectVO.subId}</td>
		<td>${SubjectVO.major}</td>
		<td>${SubjectVO.middle}</td>
		<td><a href ="/subject?command=subModifyForm&subId=${SubjectVO.subId}">${SubjectVO.subName}</a></td>
		<td>${SubjectVO.subScore}</td>		     
	</tr>
	</tbody>
</c:forEach>
</table> 
</div>
<!-- 선택영역 -->	
    <div>
    <table class="table table-bordered" id="user-table2">
<thead>
	<tr>
	    <th style="width: 15px;text-align: center;"> <input type = "checkbox" name = "optAllCheck" ></th>
		<th style="width: 15px;text-align: center;"> NO </th>
		<th style="width: 100px; text-align: center;">대분류</th>
		<th style="width: 100px;text-align: center;">중분류</th>
		<th style="width: 100px;text-align: center;">항목명</th>
		<th style="width: 50px;text-align: center;">점수</th>
	</tr>
</thead>
<c:forEach items="${optlist}" var="SubjectVO">
	<tbody >
	<tr>
		<td><input type ="checkbox" name ="optSubId" value="${SubjectVO.subId}"></td>
		<td>${SubjectVO.subId}</td>
		<td>${SubjectVO.major}</td>
		<td>${SubjectVO.middle}</td>
		<td><a href ="/subject?command=subModifyForm&subId=${SubjectVO.subId}">${SubjectVO.subName}</a></td>
		<td>${SubjectVO.subScore}</td>		     
	</tr>
	</tbody>
</c:forEach>
</table> 
    </div>
</div>
				<div class="box-footer"></div>
				<!-- /.box-footer-->
			</div>
		<button type="button" class="btn btn-primary">신규등록</button>	
		<button type = "button" class="btn btn-danger">삭제</button>
		
			</div>
				
			
			</form>


<%-- <form role = "form">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
 <table class="table table-bordered">
	
	<tr>
	    <th> <input type = "checkbox" name = "allChecked" id = "allChecked" onclick = "allChecked()"></th>
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
		<button type="button" class="btn btn-primary">신규등록</button>	
		<button type = "button" class="btn btn-danger">삭제</button>
			</form>--%>
					
			
		</div> 
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->

<script>
//버튼 
$(document).ready(function() {

	var formObj = $("form[role='form']");

	console.log(formObj);

	$(".btn-primary").on("click", function() {
		self.location = "/subject/register.jsp";
	});
	
	$(".btn-danger").on("click", function() {
		formObj.attr("action", "subject?command=subDelete");
		formObj.attr("method", "post");
		formObj.submit();
		alert("삭제가 완료되었습니다.");

	});

});
//첫번째 탭 올체크
$("input[name=essAllCheck]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='essSubId']").prop("checked", true);
	} else{
		$("input[name='essSubId']").prop("checked", false);
	}
});
			
//두번째 탭
$("input[name=optAllCheck]").click(function(){
	var chk = $(this).is(":checked");
	
	if(chk){
		$("input[name='optSubId']").prop("checked", true);
	} else{
		$("input[name='optSubId']").prop("checked", false);
	}
});
			
			
//탭 기능  자바스크립트
	$(function () {	
		tab('#tab',0);	
	});

	function tab(e, num){
	    var num = num || 0;
	    var menu = $(e).children();
	    var con = $(e+'_con').children();
	    var select = $(menu).eq(num);
	    var i = num;

	    select.addClass('on');
	    con.eq(num).show();

	    menu.click(function(){
	        if(select!==null){
	            select.removeClass("on");
	            con.eq(i).hide();
	        }

	        select = $(this);	
	        i = $(this).index();

	        select.addClass('on');
	        con.eq(i).show();
	    });
	}
//첫번쨰 탭 검색기능 5n + 선택값 , contains() 문자열 포합값 출력 , $("#user-table > tbody > tr").hide(); 문자열을 받아오면 나머지는 숨기다.
	$(document).ready(function() {
		$("#keyword").keyup(function(){
			var k = $(this).val();
			$("#user-table > tbody > tr").hide();
			var temp = $("#user-table > tbody > tr > td:nth-child(5n+5):contains('" + k + "')");
			
			$(temp).parent().show();
		})
	})
//두번째 탭
		$(document).ready(function() {
		$("#keyword").keyup(function(){
			var k = $(this).val();
			$("#user-table2 > tbody > tr").hide();
			var temp = $("#user-table2 > tbody > tr > td:nth-child(5n+5):contains('" + k + "')");
			
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
	
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    } 
    
    </script>

<%@include file="../include/footer.jsp"%>
