/**
 *  수강 후기 부분 유효성 검사
 *  @author 김소민
 */

function registVal(){
	
	// 제목 입력여부 검사
	if(this.imgboard.title.value.length==0){
		alert("제목을 입력하세요.");
		imgboard.title.focus();
		return false;
	}
	// 기관 선택여부 검사
	if(this.imgboard.compname.value==0){
		alert("기관을 선택하세요.");
		return false; 
	}
	// 프로그램 선택여부 검사
	if(this.imgboard.intronum.value==0){
		alert("프로그램을 선택하세요.");
		return false;
	}
	return true;
}
