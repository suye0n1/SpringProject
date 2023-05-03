<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h2>게스트 하우스</h2>
				<p>원하시는 날짜를 선택해주세요.</p>
			</header>
	<div class="row">
		<div class="col-12">

			<!-- Lists -->
			<section class="box">
				<div class="row">
					<div class="col-6 col-12-mobilep">
						<ul class="alt">
						<%@include file="calendar2.jsp"%>
							
						</ul>

					</div>

				</div>
				</section>
		</div>
		</div>
		</section>
		
		<!-- Footer -->
		<footer id="footer">
			<ul class="copyright">
				<li>&copy; 문의: 031-000-0000</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>
		
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
