<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>회원가입</title>
<link rel="stylesheet" href="/resources/assets/css/join.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/WEB-INF/views/headerbar.jsp"%>
		
	<div class="wrapper">
		<form name="joinForm" method="post" onsubmit="return false;">
			<div class="wrap">
				<div class="subject"><h2>회원가입</h2></div>
				<!-- 	아이디 -->
				<div class="id_wrap">
					<div class="id_name">아이디</div>
<!-- 					<div class="id_input_box"> -->
						<input class="id_input"  type="text" name="user_id" required
							maxlength="12" onkeydown="inputIdCheck()" />
<!-- 					</div> -->
					<div>
						<button class="id_ch_button" type="button"
							onclick="fn_dbIdCheck(event)" name="dbIdCheck">중복 확인</button>
						<input type="hidden" name="idDuplication" value="idUncheck" />
					</div>

				</div>
				<!-- 	비밀번호 -->
				<div class="password_wrap">
					<div class="password_name">비밀번호</div>
<!-- 					<div class="password_input_box"> -->
						<input class="pw_input" type="password" name='passwd' required
							maxlength="15">
<!-- 					</div> -->
				</div>
				<!-- 	비밀번호 확인 -->
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
<!-- 					<div class="pwck_input_box"> -->
						<input class="pwck_input" type="password" name="pw_ch" required
							maxlength="15">
<!-- 					</div> -->
				</div>
				<!-- 	 이름 -->
				<div class="user_wrap">
					<div class="user_name">이름</div>
<!-- 					<div class="user_input_box"> -->
						<input class="user_input" type="text" name='name' required>
<!-- 					</div> -->
				</div>
				<!-- 	이메일 -->
				<div class="email_wrap">
					<div class="email_name">이메일</div>
<!-- 					<div class="email_input_box"> -->
						<input class="email_input" type="text" name='email' id='email'
							required>
<!-- 					</div> -->
					<div class="email_ch_wrap">
<!-- 						<div class="email_ch_input_box" id="email_ch_input_box_false"> -->
							<input class="email_ch_input" type="text" placeholder="인증번호 입력"
								class='email_auth_key' name='email_key' disabled="disabled">
<!-- 						</div> -->
						<div class="email_ch_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="email_ch_input_box_warn"></span>
					</div>
					<!-- 주소 -->
					<div class="address_wrap">
						<div class="address_name">주소</div>
						<div class="address_input_1_wrap">
							<input class="address_input_2_box" type="text"
								id="sample6_postcode" name="postcode" placeholder="우편번호">
							<input class="address_button" type="button"
								onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
							<div>
								<div class="address_input_2_wrap">
									<input class="address_input_1_box" type="text"
										id="sample6_address" name="address" placeholder="주소">
									<input class="address_input_2_box" type="text"
										id="sample6_detailAddress" name="detailAddress"
										placeholder="상세주소">
								</div>
								<div class="address_input_3_wrap">
									<input class="address_input_3_box" type="text"
										id="sample6_extraAddress" placeholder="참고항목">
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
					</div>
				</div>
				<div><%@include file="/WEB-INF/views/member/agree.jsp"%></div>
				<div class="join_button_wrap">
					<button class="join_button" onclick="fn_joinMember()">회원가입</button>
				</div>
			</div>
		</form>
	</div>
	</div>
	<script>

		var code = ""; //Controller로부터 전달받은 인증번호를 뷰에 저장하는 코드 추가
		
		$(".email_ch_button").click(function(event){
				event.preventDefault(); //폼태그 안에 있는 button태그는 submit기능을 하기 때문에 preventDefault메소드를 사용해주기
				var email = $(".email_input").val();	//이메일 주소값 얻어오기
				console.log('완성된 이메일:'+ email);	//이메일 오는지 확인
				var checkBox = $(".email_ch_input"); //인증번호 입력란
				var boxWrap = $(".email_ch_input_box"); //인증번호 입력란 박스

		 		$.ajax({
		 			type : "GET",	
		 			url : "mailCheck?email=" + email,
 		 			success: function(data){
		 				console.log("data:"+data);
		 				alert('인증번호가 전송되었습니다.');
		 				checkBox.attr("disabled", false); //입력이 가능하도록 속성 변경(disable속성: 비활성화 / false이므로 비활성화 해제)
		 				boxWrap.attr("id", "email_ch_input_box_true");	//이메일 인증 입력란의 색상 변경
		 				code = data; //data = 인증번호
		 			}
				
				});//end ajax
			});
				
//인증번호 비교 .blur()메서드는 선택한 요소에서 포커스를 잃을 때 실행되는 이벤트 핸들러
$(".email_ch_input").blur(function(){
	var inputCode = $(".email_ch_input").val();	//입력코드
	var checkResult = $("#email_ch_input_box_warn"); //비교 결과
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");
	} else{
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
	}

});

			</script>
	<!-- 	script -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/joinmember.js"></script>
	<script src="${contextPath}/resources/assets/js/addressapi.js"></script>
	<!-- 주소 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 지도 -->
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c29e6e2a0b7d1f4b8bdd99f49d6fab&libraries=services"></script>

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