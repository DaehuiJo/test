/**
 * 
 */

function checkForm(writeform) {

	if (!writeform.title.value) {
		alert("제목을 적어주세요");
		writeform.title.focus();
		return false;
	}
	if (!writeform.username.value) {
		alert("이름을 적어주세요");
		writeform.username.focus();
		return false;
	}

	if (!writeform.passwd.value) {
		alert("비밀번호를 적어주세요");
		writeform.passwd.focus();
		return false;
	}

	if (!writeform.memo.value) {
		alert("내용을 적어주세요");
		writeform.memo.focus();
		return false;
	}

	writeform.action = "writePro.jsp";
	writeform.submit();
}


function modifyCheck(modify){

	if (!modify.passwd.value) {
		alert("비밀번호를 적어주세요");
		modify.passwd.focus();
		return false;
	}
	if (!modify.title.value) {
		alert("제목을 적어주세요");
		modify.title.focus();
		return false;
	}

	if (!modify.memo.value) {
		alert("내용을 적어주세요");
		modify.memo.focus();
		return false;
	}
	
	modify.action = "modifyPro.jsp";
	modify.submit();
}

function replyCheck(replyform){
	
	if(!replyform.username.value){
		alert("이름을 적어주세요.");
		replyform.username.focus();
		return false;
	}
	if(!replyform.passwd.value){
		alert("비밀번호를 입력해주세요.");
		replyform.passwd.focus();
		return false;
	}
	if(!replyform.memo.value){
		alert("내용을 입력해주세요.");
		replyform.memo.focus();
		return false;
	}
	replyform.action = "replyPro.jsp";
	replyform.submit();
}