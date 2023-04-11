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
</head>
<body>



	<div>${read.id }</div>
	<h3>${read.title}</h3>
	<p>${read.content}</p>
	<div class="form_section">
		<div class="form_section_title">
			<label>사진 이미지</label>
		</div>
		<div class="form_section_content"></div>
	</div>

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


</body>
</html>