<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.suyeon.dto.MemberDto" %>
<%@ page import="com.suyeon.session.SessionUtils" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- Header -->
				<header id="header" class="alt2">
					<h1><a href="/board/login_page">COMMUNITY</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="/board/login_page">Home</a></li>
							<li>
								<a href="#" class="icon solid fa-angle-down">MENU</a>
								<ul>
								
									<li><a href="/board/list?category=board_1">자유로운 이야기</a></li>
									<li><a href="/board/list?category=board_2">나눔의 장</a></li>
									<li>
										<a href="#">운동 센터</a>
										<ul>
											<li><a href="/reservation/calendar">접수</a></li>
										</ul>
									</li>
								</ul>								
							<!-- login_user세션 변수에서 값 가져오기 -->
							<input type="hidden" id="user_id" value="${login_user.user_id}">
							</li>
							<!--	로그인한 아이디 값 -->
							<li>${login_user.user_id}<a href="/member/logout" class="button">LOG OUT</a></li>
							<li><a href="/reservation/mypage?user_id=${login_user.user_id}" class="button">MY PAGE</a></li>
						</ul>
					</nav>
				</header>

</body>
</html>