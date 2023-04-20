<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.suyeon.dto.BoardDto"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<input id="user_id" value="${login_user.user_id}">
	<input type="hidden" id="num" value="${read.num }">
	<a href="/member/logout">로그아웃</a>
	<div>${read.num }</div>
	<div>${read.id }</div>
	<h3>${read.title}</h3>
	<p>${read.content}</p>
	<div class="form_section">
		<div class="form_section_title">
			<label>사진 이미지</label>
		</div>
		<div class="form_section_content"></div>
	</div>
	<div style="margin-right: 1px;">
		<button type="button" class="btn btn-warning " id="like_btn"
			onclick="updateLike();">추천 ${read.like_count}</button>
		<button type="button" class="btn btn-danger" id="hate_btn">비추천</button>
	</div>
<!-- 	return false; -->
	<div style="margin-top: 1000px;">
		<ul class="actions">
			<li><a href="/board/list?category=${read.category}"
				class="button">목록</a></li>
			<li><a
				href="/board/del?num=${read.num}&category=${read.category}"
				class="button">삭제</a></li>
			<li><a
				href="/board/modify?num=${read.num}&category=${read.category}"
				class="button">수정</a></li>
		</ul>
	</div>
	
	<script>
		var num = "${read.num}";
		console.log("============"+num+"=========");
		var user_id = "${login_user.user_id}";
		console.log("============"+user_id+"=========");
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

	
</body>
</html>