<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.suyeon.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="utf-8">

</head>
<body>


							<article class="box page-content">

								<section>
									
									<table>
										<tr>
											<td>카테고리</td>
											<td>번호</td>
											<td>제목</td>
											<td>아이디</td>
											<td>조회수</td>
											<td>작성시간</td>
										</tr>
										<c:forEach var="i" items="${list}">
											<tr>
												<td>${i.category}</td>
												<td>${i.num}</td>
												<td><a
													href="/board/read?num=${i.num}&category=${i.category}">${i.title}</a></td>
												<td>${i.id}</td>
												<td>${i.hits}</td>
												<td>${i.dt}</td>
											</tr>
										</c:forEach>
									</table>
									<ul class="actions" style="margin-left: 800px;">
											<li><a href="/board/write?category=${category}" class="button">글쓰기</a></li>
										</ul>
								</section>
							</article>


</body>
</html>