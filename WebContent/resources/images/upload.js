function checkImageType(fileName){
	
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);

}

function getFileInfo(fullName){
		
	var fileName,imgsrc, getLink;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12); // /2015/07/01/ 
		var end = fullName.substr(14);
		
		getLink = "/displayFile?fileName="+front + end;
		
	}else{
		imgsrc ="/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	
}

function getFileAndLinkInfo(fullName){
	
	var fileName, imgsrc, getLink, imgUri;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc="/noticeUp/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		
		getLink = "/noticeUp/displayFile?fileName="+front+end;
	} else {
		imgsrc ="/resources/admin/dist/img/file.svg";
		fileLink = fullName.substr(12);
		getLink = "/noticeUp/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	$.ajax({
		url : "/admin/notice/getUriLink",
		type: "POST",
		data: {fullName:fullName},
		async: false,
		success: function(result){
			imgUri = result;
		} 
	});
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName, imgUri:imgUri};
}

function getUserFileAndLinkInfo(fullName){
	
	var fileName, imgsrc, getLink, imgUri;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc="/noticeUp/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		
		getLink = "/noticeUp/displayFile?fileName="+front+end;
	} else {
		imgsrc ="/resources/admin/dist/img/file.svg";
		fileLink = fullName.substr(12);
		getLink = "/noticeUp/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	$.ajax({
		url : "/notice/getUriLink",
		type: "POST",
		data: {fullName:fullName},
		async: false,
		success: function(result){
			imgUri = result;
			
		}  
	});
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName, imgUri:imgUri};
}


