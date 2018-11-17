/**
 *  수강 후기 부분 유효성 검사
 *  @author 이동희
 */

function registVal(){
	
	// 제목 입력여부 검사
	if(document.regist.title.value==""){
		alert("제목을 입력하세요.");
		document.regist.title.focus();
	    return false;
	}
	
	if(document.regist.category.value.length==0){
		alert("분류를 선택하세요.");
		document.regist.category.focus();
		return false;
	}
	
	if(document.regist.compnum.value.length==0){
		alert("기관을 선택하세요.");
		document.regist.compnum.focus();
		return false;
	}
	
	// 센터 선택여부 검사
	if(document.regist.content.value==""){
		alert("내용을 입력하세요.");
		document.regist.content.focus();
		return false; 
	}
	
	return true;
}
