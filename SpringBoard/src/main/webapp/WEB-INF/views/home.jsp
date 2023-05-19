<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/login.css" />
</head>
<body class="landing is-preload">
	<div id="page-wrapper">


		<!-- Banner -->
		<section id="banner">
			<h2>APARTMENT COMMUNITY</h2>
			<p>Another fine responsive site template freebie by HTML5 UP.</p>
			<ul class="actions special">
				<li><a href="/member/join" class="button">Sign Up</a></li>
				<li class="login_popup"><a href="#" class="button">Sign in</a></li>
			</ul>
		</section>

		<!-- Main -->
		<section id="main" class="container">

			<section class="box special">
				<header class="major">
					<h2>
						Introducing the ultimate mobile app <br /> for doing stuff with
						your phone
					</h2>
					<p>
						Blandit varius ut praesent nascetur eu penatibus nisi risus
						faucibus nunc ornare<br /> adipiscing nunc adipiscing.
						Condimentum turpis massa.
					</p>
				</header>
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>
			</section>

			<section class="box special features">
				<div class="features-row">
					<section>
						<span class="icon solid major fa-bolt accent2"></span>
						<h3>Magna etiam</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
					<section>
						<span class="icon solid major fa-chart-area accent3"></span>
						<h3>Ipsum dolor</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
				</div>
				
			</section>
		</section>
		<!-- CTA -->
		<section id="cta">

			<h2>Sign up for beta access</h2>
			<p>Blandit varius ut praesent nascetur eu penatibus nisi risus
				faucibus nunc.</p>

			<form>
				<div class="row gtr-50 gtr-uniform">
					<div class="col-8 col-12-mobilep">
						<input type="email" name="email" id="email"
							placeholder="Email Address" />
					</div>
					<div class="col-4 col-12-mobilep">
						<input type="submit" value="Sign Up" class="fit" />
					</div>
				</div>
			</form>

		</section>
	</div>
	<footer>
		<ul class="copyright">
		</ul>
	</footer>
	
	<!-- 	로그인 모달 팝업 -->
	<div id="loginPopup" class="background"> <!-- 	전체 배경 투명색 -->
  <div class="window"> <!-- 모달 팝업을 감싸주는 창 -->
    <div class="popup">	 <!-- 모달 팝업 내용 -->
      	<a href="/" id="close">Close</a>
		<div>
		<strong >로그인 후 이용하세요.</strong>
		</div>
		<!-- 로그인 폼 -->
		<form name="loginForm" method="post" onsubmit="return false;"> 
		<!-- input태그에서 작성한 값을 서버로 전송(name='user_id', name='passwd') -->
		<input type="text" class="id" name='user_id' placeholder="아이디"><br>
		<input type="password" class="pw" name='passwd' placeholder="패스워드">
		</form>
		<div>
		<!-- 버튼 클릭 시 fn_login() 함수 실행 -->
		<button onclick="fn_login()" class="button">LOG IN</button>	
		</div>
		<div>
		<a href="/member/join">회원가입</a>
		</div>
    </div>
  </div>
</div>

<script>

//로그인 폼 처리
function fn_login() {
	let loginForm = document.loginForm;	
	let user_id = loginForm.user_id.value;	
	let passwd = loginForm.passwd.value;	

	if (user_id.length == 0 || user_id == "") {
		alert("아이디를 입력해주세요");
		loginForm.user_id.focus();
		return false; //return false를 통해 함수 실행 중지
	} else if (passwd.length == 0 || passwd == "") {
		alert("비밀번호를 입력해주세요");
		loginForm.passwd.focus();
		return false;
	}
	loginForm.method = "post";	
	loginForm.action = "${contextPath}/member/login_check";
	loginForm.submit();
}

//모달 팝업창
function showPopup() {
	  document.querySelector("#loginPopup").classList.add("show");
	}

	function closePopup() {
	  document.querySelector("#loginPopup").classList.remove("show");
	}

	document.querySelector(".login_popup").addEventListener("click", showPopup);
	document.querySelector("#close").addEventListener("click", closePopup);

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