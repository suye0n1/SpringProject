<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/login.css" />
</head>
<body>
	<!-- 	<h1>로그인</h1> -->
	<%-- 	${login.user_id} 로그인 세션--%>
<%-- <form name="loginForm" method="get" onsubmit="return false;">
	onsubmit="return false; ㅡ>자동 submit 방지 /안해주면 fomr이 제출되면서 컨트롤러로 넘어가고 컨트롤러가 실행되면서 list.jsp로 감
	  <table>
			<tr>
				<td><input type="text" name='user_id' placeholder="아이디"><br></td>
			</tr>
			<tr>

				<td><input type="password" name='passwd' placeholder="패스워드"><br></td>
			</tr>

			<tr>
				<td><button onclick="fn_login()">LOG IN</button></td>
			</tr>
</table> 
</form> --%>

<button id="show">로그인</button>
<div class="background show"> <!-- 전체 배경 -->
	<div class="window"> <!-- 모달 팝업을 감싸주는 창 -->
		<div class="popup"> <!-- 모달 팝업 내용 -->
		<div class="text">
		<strong >로그인 후 이용하세요.</strong>
		</div>
		<form name="loginForm" method="get" onsubmit="return false;">
		<input type="text" class="id" name='user_id' placeholder="아이디"><br>
		<input type="password" class="pw" name='passwd' placeholder="패스워드">
		</form>
		<div class="btn">
		<button onclick="fn_login()">LOG IN</button>
		<button id="close">닫기</button>		
		</div>
		<div class="text2">
		<a href="/member/join">회원가입</a>
		<a href="#">비밀번호 찾기</a>
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
		alert("로그인되었습니다.");
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
</body>
</html>