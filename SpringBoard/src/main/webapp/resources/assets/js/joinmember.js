function fn_joinMember() {
    var joinForm = document.joinForm;
    var user_id = joinForm.user_id.value;
    var passwd = joinForm.passwd.value;
    var pw_ch = joinForm.pw_ch.value;
    var name = joinForm.name.value;
    var email = joinForm.email.value;


    if (user_id.length == 0 || user_id == "") {
        alert("아이디를 입력해주세요");
        joinForm.user_id.focus();
        return false; //return false를 해야 돌아갔을 때 form에 입력한 게 그대로 남아있음
    } else if (passwd.length == 0 || passwd == "") {
        alert("비밀번호를 입력해주세요");
        joinForm.passwd.focus();
        return false;
    } else if (pw_ch.length == 0 || pw_ch == "") {
        alert("비밀번호를 다시 입력해주세요");
        joinForm.pw_ch.focus();
        return false;
    } else if (passwd != pw_ch) {
        alert("입력하신 비밀번호가 틀립니다.");
        joinForm.pw_ch.focus();
        return false;
    } else if (name.length == 0 || name == "") {
        alert("이름을 입력해주세요");
        joinForm.name.focus();
        return false;
    } else if (joinForm.idDuplication.value != "idCheck") {
        alert("아이디 중복체크를 해주세요");
        return false;
    } else if (email.length == 0 || email == "") {
        alert("이메일을 입력해주세요");
        joinForm.email.focus();
        return false;
    }	
    
    
    alert("회원가입이 완료되었습니다.");
    joinForm.method = "post";
    joinForm.action = "/member/joinMember";
    joinForm.submit();
}

function fn_dbIdCheck(event) {
	event.preventDefault();
    var joinForm = document.joinForm;
    var user_id = joinForm.user_id.value;
    if (user_id == 0 || user_id == "") {
        alert("아이디를 입력해주세요.");
        joinForm.user_id.focus();
    } else {
        window.open("/member/idCheck?user_id=" + user_id, "",
                "width=500, height=300")
    }
}

function inputIdCheck() {
    var joinForm = document.joinForm;
    var dbIdCheck = document.joinForm.dbIdCheck;
    document.joinForm.idDuplication.value = "idUncheck";
    dbIdCheck.disabled = false;
    dbIdCheck.style.opacity = 1;
    dbIdCheck.style.cursor = "pointer";
}

$("input:checkbox").click(checkedChange);
function checkedChange(){
	if($(this).prop("checked")){
		$("label[for="+this.id+"]").test("동의합니다.");
		$("label[for="+this.id+"]").css("color", "blue");
	}	else{
		$("label[for="+this.id+"]").test("개인정보 동의에 체크하세요.");
		$("label[for="+this.id+"]").css("color", "red");
		
	}
}