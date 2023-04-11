<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<ul>
			<li><a href="/board/list?category=free_2">게시판1</a></li>
			<li><a href="/board/list?category=free_2">게시판2</a></li>
			<li><a href="/member/join">회원가입</a></li>
			<li><a href="/member/login">로그인</a></li>
			<li>${login_user.user_id}<a href="/member/logout">로그아웃</a></li>
		</ul>
	</nav>
</body>
</html>