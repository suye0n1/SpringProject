<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/assets/css/login.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body>

<div class="background show"> <!-- 전체 배경 -->
	<div class="window"> <!-- 모달 팝업을 감싸주는 창 -->
		<div class="popup"> <!-- 모달 팝업 내용 -->
		<a href="/" class="btn">닫기</a>
		<div class="text">
		<strong >로그인 후 이용하세요.</strong>
		</div>
		<form name="loginForm" method="get" onsubmit="return false;">
		<input type="text" class="id" name='user_id' placeholder="아이디"><br>
		<input type="password" class="pw" name='passwd' placeholder="패스워드">
		</form>
		<div>
		<button onclick="fn_login()" class="button">LOG IN</button>	
		</div>
		<div class="text2">
		<a href="/member/join">회원가입</a>
		</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
	function fn_login() {
		var loginForm = document.loginForm;
		var user_id = loginForm.user_id.value;
		var passwd = loginForm.passwd.value;

		if (user_id.length == 0 || user_id == "") {
			alert("아이디를 입력해주세요");
			loginForm.user_id.focus();
			return false; //return false를 해야 돌아갔을 때 form에 입력한 게 그대로 남아있음
		} else if (passwd.length == 0 || passwd == "") {
			alert("비밀번호를 입력해주세요");
			loginForm.passwd.focus();
			return false;
		}
		loginForm.method = "get";
		loginForm.action = "${contextPath}/member/login_check";
		loginForm.submit();
	}
	
	function show(){
		document.querySelector(".background").className = "background show";
	}

	function close(){
		document.querySelector(".background").className = "background";
	}

	document.querySelector("#show").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);

</script>


<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>