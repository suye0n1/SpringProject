<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.suyeon.dto.BoardDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

글 제목: ${read.title}
글 내용: ${read.content}
<%-- ${read.category} ㅡ> BoardContoller에서 저장한 read --%>
<a href="/board/list?category=${read.category}">목록</a>
<a href="/board/del?num=${read.num}&category=${read.category}">삭제</a>
<a href="/board/modify?num=${read.num}&category=${read.category}">수정</a>

</body>
</html>