/**
 *  보도자료 등록부분 유효성 검사
 *  @author 이동희
 */

function checkNews(){
	
	var newsTitle = document.getElementsByName("newsTitle")[0];
	var newsLink = document.getElementsByName("newsLink")[0];
	var newsText = document.getElementsByName("newsText")[0];
	
	// 제목 입력여부 검사
	if(newsTitle.value==""){
		alert("제목을 입력하지 않았습니다.");
		news.newsTitle.focus();
		return false;
	} 
	
	
	// 내용 입력여부 검사
	if(newsText.value==""){
		alert("내용을 입력하지 않았습니다.");
		return false;
	}
	// 링크 입력여부 검사
	if(newsLink.value==""){
		alert("뉴스링크를 입력하지 않았습니다.");
		return false;
	}
	return true;
	
	
}
