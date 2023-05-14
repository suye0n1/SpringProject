<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.suyeon.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<title>Insert title here</title>
</head>
<!-- <body> -->
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/WEB-INF/views/headerbar.jsp"%>

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>MY PAGE</h2>
				<br>
				<p>예약 내역</p>
			</header>
			<div class="row">
				<div class="col-12">
				<c:forEach var="reservation" items="${mypageList}">
					종류:${reservation.reserve_type}<hr>
					날짜:${reservation.date1} ~ ${reservation.date1}<hr>
				</c:forEach>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		buildCalendar();
	</script>

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