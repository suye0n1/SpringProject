<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

					<!-- Form -->
					<section class="box">
						<h3>글 수정하기</h3>
						<form action="/board/modify" method="post">
							<div class="row gtr-uniform gtr-50">
								<div class="col-6 col-12-mobilep">
									<input type="text" name="name" id="name"
										value="${read.id}" placeholder="Name"
										readonly="readonly" />
								</div>
								<div class="col-6 col-12-mobilep">
									<input type="text" name='title' id="email" value="${read.title}">
								</div>
								<input type="hidden" name='category' value="${read.category}">
								<input type="hidden" name='num' value='${read.num}'>
								<div class="col-12">
									<textarea name='content' id="message"
										placeholder="Enter your message" rows="6">${read.content}</textarea>
								</div>
								<div>
									<input type="file" multiple id="fileItem" name='uploadFile'>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="submit" value="Edit Message" /></li>
										<li><input type="reset" value="Reset" class="alt" /></li>
									</ul>
								</div>
							</div>
						</form>
						<hr />
					</section>

				</div>
			</div>
		</section>
	</div>

	<!-- 	script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>



</body>
</html>