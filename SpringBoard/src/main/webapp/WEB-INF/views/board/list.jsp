<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.suyeon.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//  	Object o = request.getAttribute("list"); 
	//  	List<BoardDto> list = (List<BoardDto>)o; 
	//  	for(int i=0; i<list.size(); i++){ 
	// 		Long num = list.get(i).getNum();
	//  		String title = list.get(i).getTitle();
	//  		String id = list.get(i).getId(); 
	// 		Long hits = list.get(i).getHits(); 
	//  		String dt = list.get(i).getDt();
	%>

	<h1>게시판 목록</h1>
	<hr>
	${login.user_id}
	<a href="/member/logout">로그아웃</a>
	<table>
		<tr>
			<td>카테고리</td>
			<td>번호</td>
			<td>제목</td>
			<td>아이디</td>
			<td>조회수</td>
			<td>작성시간</td>
		</tr>
		<%-- 	<c:set var="arr" value="${list}"/> --%>
		<c:forEach var="i" items="${list}">
			<tr>

				<td>${i.category}</td>
				<td>${i.num}</td>
				<td><a href="/board/read?num=${i.num}&category=${i.category}">${i.title}</a></td>
				<td>${i.id}</td>
				<td>${i.hits}</td>
				<td>${i.dt}</td>
			</tr>
		</c:forEach>
	</table>
	<%-- 	번호:<%=num %> --%>
	<%-- 	제목:<%=title %> --%>
	<%-- 	아이디:<%=id %> --%>
	<%-- 	조회수:<%=hits %> --%>
	<%-- 	작성 시간:<%=dt %><hr> --%>
	<a href="/board/write?category=${category}">글쓰기</a>
	<a href="/">홈으로 이동</a>
	

</body>
</html>