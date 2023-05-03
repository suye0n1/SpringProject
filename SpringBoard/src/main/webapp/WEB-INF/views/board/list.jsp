<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.suyeon.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<%@include file="/WEB-INF/views/headerbar.jsp"%>
		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>BOARD</h2>
				<p>Just an assorted selection of elements.</p>
			</header>

			<div class="row">
				<div class="col-12">

					<!-- Table -->
					<section class="box">
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>아이디</th>
										<th>조회수</th>
										<th>작성시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${list}">
										<tr>
											<td>${i.num}</td>
											<td><a
												href="/board/read?num=${i.num}&category=${i.category}">${i.title}</a></td>
											<td>${i.id}</td>
											<td>${i.hits}</td>
											<td>${i.dt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</section>
				</div>
				<div style="margin-left: 1000px;">
					<a href="/board/write?category=${category}" class="button">글쓰기</a>
				</div>
			</div>
		</section>
	</div>

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