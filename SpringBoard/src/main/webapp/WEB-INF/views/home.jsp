<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>
<!-- 		<a href="/board/list?category=free">자유게시판1</a> -->
		<a href="/board/list?category=free">자유게시판1</a>
	</h1>
	<hr>
	<h1>
		<a href="/board/list?category=free_2">자유게시판2</a>
	</h1>
	<hr>
	<h1>
		<a href="/member/join">회원가입</a>
	</h1>
	<hr>
	<h1>
		<a href="/member/login">로그인</a>
	</h1>
	<hr>

	<P>The time on the server is ${serverTime}.</P>
</body>
</html>
