<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<!-- 지도 -->
<!-- <script -->
<!-- 	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c29e6e2a0b7d1f4b8bdd99f49d6fab&libraries=services"></script> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	// 	function id() {
	// 		var form = document.join;
	// 		var id = form.user_id.value;
	// 		location.href = "/member/idCheck?user_id=" + id;

	// 	}

	function fn_joinMember() {
		var joinForm = document.joinForm;
		var user_id = joinForm.user_id.value;
		var passwd = joinForm.passwd.value;
		var pw_ch = joinForm.pw_ch.value;
		var name = joinForm.name.value;
		var email = joinForm.email.value;

		if (user_id.length == 0 || user_id == "") {
			alert("아이디를 입력해주세요");
			joinForm.user_id.focus();
			return false; //return false를 해야 돌아갔을 때 form에 입력한 게 그대로 남아있음
		} else if (passwd.length == 0 || passwd == "") {
			alert("비밀번호를 입력해주세요");
			joinForm.passwd.focus();
			return false;
		} else if (pw_ch.length == 0 || pw_ch == "") {
			alert("비밀번호를 다시 입력해주세요");
			joinForm.pw_ch.focus();
			return false;
		} else if (passwd != pw_ch) {
			alert("입력하신 비밀번호가 틀립니다.");
			joinForm.pw_ch.focus();
			return false;
		} else if (name.length == 0 || name == "") {
			alert("이름을 입력해주세요");
			joinForm.name.focus();
			return false;
		} else if (joinForm.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요");
			return false;
		} else if (email.length == 0 || email == "") {
			alert("이메일을 입력해주세요");
			joinForm.email.focus();
			return false;
		}
		alert("회원가입이 완료되었습니다.");
		joinForm.method = "get";
		joinForm.action = "${contextPath}/member/joinMember";
		joinForm.submit();
	}

	function fn_dbIdCheck() {
		var joinForm = document.joinForm;
		var user_id = joinForm.user_id.value;
		if (user_id == 0 || user_id == "") {
			alert("아이디를 입력해주세요.");
			joinForm.user_id.focus();
		} else {
			window.open("${contextPath}/member/idCheck?user_id=" + user_id, "",
					"width=500, height=300")
		}
	}

	function inputIdCheck() {
		var joinForm = document.joinForm;
		var dbIdCheck = document.joinForm.dbIdCheck;
		document.joinForm.idDuplication.value = "idUncheck";
		dbIdCheck.disabled = false;
		dbIdCheck.style.opacity = 1;
		dbIdCheck.style.cursor = "pointer";
	}
</script>

</head>
<body>
	<h1>회원가입</h1>
	<form name="joinForm" method="post" onsubmit="return false;">
		<table cellpadding="10">
			<!-- 	아이디(중복확인) -->
			<!-- 		<tr> -->
			<!-- 				<th>아이디</th> -->
			<!-- 				onkeydown:키를 눌렀을 때 이벤트 -->
			<!-- 				<td><input type="text" name="user_id" onkeydown="inputIdchk()"> -->
			<!-- 					<button type="button" onclick="fn_dbIdCheck()" name="dbIdCheck">중복 확인</button> -->
			<!-- 					아이디 중복 체크 여부	 -->
			<!-- 					아이디를 중복 체크하지 않고 회원가입 버튼을 클릭할 경우, 아이디 중복 체크 메세지 전달 -->
			<!-- 				<input type="hidden" name=idDuplication" value="idUncheck"> -->
			<!-- 				</td> -->
			<!-- 		</tr> -->


			<%
			// 		String user_id=(String)request.getAttribute("user_id");
			// 		if(user_id!=null){
			%>
			<!-- 			<tr> -->
			<!-- 				<th>아이디</th> -->
			<%-- 				<td><input type="text" name="user_id" value="<%=user_id %>" > --%>
			<!-- 					<button>중복확인완료</button></td> -->
			<!-- 			</tr> -->
			<%-- 		<% --%>
			<!--  		} else { -->
			<%-- 		%> --%>
			<!-- 		<form action="/member/idCheck" method="get"> -->
			<!-- 			<tr> -->
			<!-- 				<th>아이디</th> -->
			<!-- 				<td><input type="text" name="user_id" required maxlength="12"> -->
			<!-- 					<button type="submit">중복 확인</button></td> -->
			<!-- 			</tr> -->
			<!-- 		</form> -->
			<%-- 		<%} %> --%>






			<!-- 		회원가입 form 넘기기 -->
			<!-- 		<form name="join" action="/member/join" method="post"> -->
			<%-- 		<input type="hidden" name='user_id' value="<%=user_id %>"> --%>



			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" required maxlength="12"
					onkeydown="inputIdCheck()" />
					<button type="button" onclick="fn_dbIdCheck()" name="dbIdCheck">중복
						확인</button> <input type="hidden" name="idDuplication" value="idUncheck" />
				</td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name='passwd' required
					maxlength="15"><br></td>
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pw_ch" required maxlength="15"><br></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name='name' required><br></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name='email'><br></td>
			</tr>
			<tr>
				<th>주소</th>
				<!-- 		주소 검색 -->
				<!-- 				<td><input type="text" id="sample4_address" placeholder="주소"> -->
				<!-- 					<input type="button" onclick="sample4_execDaumPostcode()" -->
				<!-- 					value="주소 검색"><br> -->
				<!-- 					<div id="map" -->
				<!-- 						style="width: 300px; height: 300px; margin-top: 10px; display: none"></div> -->
				<!-- 					<br></td> -->
				<td><input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="sample6_address" placeholder="주소"><br> <input
					type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</td>
			</tr>
		</table>


		<table>
			<!-- 			<tr> -->
			<!-- 				<td> -->
			<!-- 					<h2>이용약관</h2> -->
			<!-- 					<div style="border: 1px solid #ccc"> -->
			<!-- 						<p>=======================================이용약관================================================</p> -->
			<!-- 					</div> -->
			<!-- 					<h2>개인정보동의</h2> -->
			<!-- 					<div style="border: 1px solid #ccc"> -->
			<!-- 						<p>=======================================개인정보동의================================================</p> -->
			<!-- 					</div> <label> <input type="checkbox" name="agree" value=true -->
			<!-- 						required>동의합니다<br> -->
			<!-- 				</label> -->
			<!-- 				</td> -->
			<!-- 			</tr> -->
			<tr>
				<!-- 						<td colspan="2" align="center"> -->
				<!-- 						<input type=submit value="회원가입"></td> -->
				<td><button onclick="fn_joinMember()">회원가입</button></td>
			</tr>
		</table>
	</form>
</body>
</html>