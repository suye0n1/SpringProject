<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.suyeon.dto.BoardDto"%>
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
			<h4>READ</h4>
			<%-- 			<input id="user_id" value="${login_user.user_id}">  --%>
			<!-- 			<a href="/member/logout">로그아웃</a> -->
			<input type="hidden" id="num" value="${read.num }">
			<div class="table-wrapper">
				<table class="alt">
					<thead>
						<tr>
							<th>${read.num}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${read.title}</td>
						</tr>
						<tr>
							<td>${read.id}</td>
						</tr>
						<tr style="height: 200px;">
							<td>${read.content}</td>
						</tr>
						<tr>
							<td>
								<div class="form_section" style="height: 400px;">
									<div class="form_section_title">
										<label>사진 이미지</label>
									</div>
									<div class="form_section_content"></div>
								</div>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<div style="margin-left: 450px;">
									<button type="button" class="button primary" " id="like_btn"
										onclick="updateLike();">추천 ${read.like_count}</button>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div style="margin-left: 800px;">
				<ul class="actions">
					<li><a href="/board/list?category=${read.category}"
						class="button small">목록</a></li>
					<li><a
						href="/board/del?num=${read.num}&category=${read.category}"
						class="button small">삭제</a></li>
					<li><a
						href="/board/modify?num=${read.num}&category=${read.category}"
						class="button small">수정</a></li>
				</ul>
			</div>
		</section>
	</div>
	<!-- Footer -->


	<script>
		var num = "${read.num}";
		console.log("============" + num + "=========");
		var user_id = "${login_user.user_id}";
		console.log("============" + user_id + "=========");
		function updateLike() {
			$.ajax({
				type : "GET",
				url : "/board/updateLike",
				dataType : "json",
				data : {
					num : num,
					user_id : user_id
				},
				error : function() {
					alert("통신 에러");
				},
				success : function(likeCheck) {

					if (likeCheck == 0) {
						alert("추천완료.");
						location.reload();
					} else if (likeCheck == 1) {
						alert("추천취소");
						location.reload();

					}
				}
			});
		}
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