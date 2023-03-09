<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_login(){
	var loginForm = document.loginForm;
	var user_id = loginForm.user_id.value;
	var passwd = loginForm.passwd.value;
	
	if(user_id.length==0 || user_id==""){
		alert("아이디를 입력해주세요");
		loginForm.user_id.focus();
		return false;	//return false를 해야 돌아갔을 때 form에 입력한 게 그대로 남아있음
	}	else if(passwd.length==0 || passwd=="")	{
		alert("비밀번호를 입력해주세요");
		loginForm.passwd.focus();
		return false;	
	}
		alert("로그인되었습니다.");
		loginForm.method="get";
		loginForm.action="${contextPath}/member/login_check";
		loginForm.submit();
}

</script>
</head>
<body>
	<h1>로그인</h1>
	${login.user_id}
	<form name="loginForm" method="get" onsubmit="return false;">	<%-- onsubmit="return false; ㅡ>자동 submit 방지 /안해주면 fomr이 제출되면서 컨트롤러로 넘어가고 컨트롤러가 실행되면서 list.jsp로 감 --%>
		<table>
		<tr>
			<td><input type="text" name='user_id' placeholder="아이디"><br></td>
		</tr>
		<tr>

			<td><input type="password" name='passwd' placeholder="패스워드"><br></td>
		</tr>

		<tr>
<!-- 			<td colspan="2" align="center"><input type=submit id=l -->
<!-- 				value="LOG IN"></td> -->
				<td><button onclick="fn_login()">LOG IN</button></td>
		</tr>
		</table>
	</form>
	<a href="/">홈</a>
</body>
</html>