<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	글 번호:${read.num};
	<hr>
	글 내용:
	<form action="/board/modify" method="post">
		<input type="hidden" name='category' value="${read.category}"> <input
			type="hidden" name='num' value='${read.num}'> <input
			name='title' value="${read.title}">
		<textarea name='content'>${read.content}</textarea>
		<input type="submit" value="수정하기">

	</form>
</body>
</html>