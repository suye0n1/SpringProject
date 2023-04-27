<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<h1><a href="/">COMMUNITY</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="/">Home</a></li>
							<li>
								<a href="#" class="icon solid fa-angle-down">MENU</a>
								<ul>
									<li><a href="/board/list?category=free_1">자유로운 이야기</a></li>
									<li><a href="/board/list?category=free_2">나눔의 장</a></li>
									<li><a href="/board/list?category=board_3">상가 맛집</a></li>
									<li>
										<a href="#">운동 센터</a>
										<ul>
											<li><a href="/reservation/exercise">접수</a></li>
											<li><a href="#">Q&A</a></li>
										</ul>
									</li>
								</ul>
							<input type="hidden" id="user_id" value="${login_user.user_id}">
							</li>
							<li><a href="/member/logout" class="button">LOG OUT</a></li>
						</ul>
					</nav>
				</header>

</body>
</html>