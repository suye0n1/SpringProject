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
	<form action="/board/write" method="post">
		<input type="hidden" name='category' value="${category}"> 
		<input name='title' placeholder="글 제목">
		<textarea rows="5" name='content' placeholder="글 내용을 입력하세요"></textarea>
		<input type="submit" value="제출">
	</form>

</body>
</html>