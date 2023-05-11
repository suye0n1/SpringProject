<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="landing is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<h1>
				<a href="/">COMMUNITY</a>
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="/">Home</a></li>
					<li><a href="#" class="icon solid fa-angle-down">MENU</a>
						<ul>
							<li><a href=# id="menu1">자유로운 이야기</a></li>
							<li><a href=# id="menu2">나눔의 장</a></li>
							<li><a href="#" >운동 센터</a>
								<ul>
									<li><a href="#" id="menu3">접수</a></li>
								</ul>
								
								</li>
						</ul>
						
						</li>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">
			<h2>APARTMENT COMMUNITY</h2>
			<p>Another fine responsive site template freebie by HTML5 UP.</p>
			<ul class="actions special">
				<li><a href="/member/join" class="button">Sign Up</a></li>
				<li><a href="/member/login" id="show" class="button">Sign in</a></li>
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
				<div class="features-row">
					<section>
						<span class="icon solid major fa-cloud accent4"></span>
						<h3>Sed feugiat</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
					<section>
						<span class="icon solid major fa-lock accent5"></span>
						<h3>Enim phasellus</h3>
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
	<script>
	const menu1 = document.getElementById('menu1');
	const menu2 = document.getElementById('menu2');
	const menu3 = document.getElementById('menu3');
	
	menu1.addEventListener('click', function(){
			alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
			  window.location.href = "/member/login"; // 로그인 페이지로 이동
			});
	
	menu2.addEventListener('click', function(){
		alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
		  window.location.href = "/member/login"; // 로그인 페이지로 이동
		});
	
	menu3.addEventListener('click', function(){
		alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
		  window.location.href = "/member/login"; // 로그인 페이지로 이동
		});
	
	</script>

	
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