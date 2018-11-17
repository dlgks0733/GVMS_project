/**
 * 
 */

function vidPreview() {
	//관리자 동영상링크 미리보기버튼
	var link = document.frm.link.value.substr(-11);
	var youtubeUrl = "https://www.youtube.com/embed/" + link;
	
	document.getElementById("vid_prv").src = youtubeUrl;

	document.getElementById("vid_prv").contentWindow.location.reload(true);
	
}

function vidMainLinkPreview() {
	
	//관리자 메인링크 유튜브
	
	var link = document.frm.linkName.value.substr(-11);
	var youtubeUrl = "https://www.youtube.com/embed/" + link;
	
	document.getElementById("vid_prv_admin").src = youtubeUrl;

	document.getElementById("vid_prv_admin").contentWindow.location.reload(true);
	
}

//관리자 동영상 등록시 유효성 체크
function writeCheck(){
	if(document.frm.title.value==""){
		alert("제목을 입력해 주세요.");
		document.frm.title.focus();
		return false;
	}else if(document.frm.link.value==""){
		alert("링크를 입력해주세요");
		document.frm.link.focus();
		return false;
	}else{
		return true;
	}


}