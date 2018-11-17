/**
 * 작성자 : 남정규
 */

function add_row() {
	var my_tbody = document.createElement('my-tbody');
	// var row = my_tbody.insertRow(0); // 상단에 추가
	var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
	var cell1 = row.insertCell(0);
//	var cell2 = row.insertCell(1);


	cell1.innerHTML = '<div class="form-group"><label for="exampleInputEmail1" class="col-sm-2 control-label">이미지</label><div class=class="col-sm-10"><input type="file" class="fileDrop"></div></div><div class="form-group input-long"><label for="exampleInputEmail1" class="col-sm-2 control-label">URL</label><div class="col-sm-8"><input type="text" name="uri" class="form-control" placeholder="링크주소 입력"></div></div>';
//	cell2.innerHTML = '<div class="form-group input-long"><label for="exampleInputEmail1" class="col-sm-2 control-label">URL</label><div class="col-sm-10"><input type="text" name="ur" class="form-control" placeholder="링크주소 입력"></div></div>';

}

function delete_row() {
	var my_tbody = document.getElementById('my-tbody');
	if (my_tbody.rows.length < 1)
		return;
	// my_tbody.deleteRow(0); // 상단부터 삭제
	my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
}

function checkNotice(){	
	// 제목 입력여부 검사
	if(this.notice.noTitle.value==""){
		alert("제목을 입력해 주세요.");
		notice.noTitle.focus();
		return false;
	}
	if(this.notice.imgFileName!= "" && this.notice.uri == ""){
		alert("링크를 입력해 주세요.");
		notice.uri.focus();
		return false;
	}
	
	return true;
}

//내용 문자열 제한
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		if(escape(one_char).length > 4){
			rbyte += 3;                                         // 한글2Byte
		}else{
			rbyte++;                                            // 영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
			rlen = i+1;                                          // return할 문자열
																// 갯수
		}
	}

	if(rbyte > maxByte){
	    alert("한글 "+(maxByte/3)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	    str2 = str.substr(0,rlen);                                  // 문자열 자르기
	    obj.value = str2;
	    fnChkByte(obj, maxByte);
	}else{
	    document.getElementById('byteInfo').innerText = rbyte;
		}
	}

// 제목 문자열 제한 
function checkLength(objname, maxlength) {
	  var objstr = objname.value; // 입력된 문자열을 담을 변수 
	  var objstrlen = objstr.length; // 전체길이

	  // 변수초기화 
	  var maxlen = maxlength; // 제한할 글자수 최대크기 
	  var i = 0; // for문에 사용 
	  var bytesize = 0; // 바이트크기 
	  var strlen = 0; // 입력된 문자열의 크기
	  var onechar = ""; // char단위로 추출시 필요한 변수 
	  var objstr2 = ""; // 허용된 글자수까지만 포함한 최종문자열

	  // 입력된 문자열의 총바이트수 구하기
	  for (i = 0; i < objstrlen; i++) {
	   // 한글자추출 
	   onechar = objstr.charAt(i);

	   if (escape(onechar).length > 4) {
	    bytesize += 2; // 한글이면 2를 더한다. 
	   } else {
	    bytesize++; // 그밗의 경우는 1을 더한다.
	   }

	   if (bytesize <= maxlen) { // 전체 크기가 maxlen를 넘지않으면 
	    strlen = i + 1; // 1씩 증가
	   }
	  }

	  // 총바이트수가 허용된 문자열의 최대값을 초과하면 
	  if (bytesize > maxlen) {
	   alert("허용된 글자수를 초과했습니다. \n초과된 내용은 자동으로 삭제 됩니다.");  // match를 이용해서 영어로된 name을 한글로 변환해서 출력한다. 
	   objstr2 = objstr.substr(0, strlen);
	   objname.value = objstr2;
	  }
	  objname.focus();
	 }