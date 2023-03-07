<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 지도 -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c29e6e2a0b7d1f4b8bdd99f49d6fab&libraries=services"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function fn_joinMember() {
		var joinForm = document.joinForm;
		var user_id = joinForm.user_id.value;
		var passwd = joinForm.passwd.value;
		var pw_ch = joinForm.pw_ch.value;
		var name = joinForm.name.value;
		var email = joinForm.email.value;
		var address = joinForm.address.value;
		
		
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
	
	//주소
	function sample4_execDaumPostcode() {

		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
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
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="sample4_roadAddress" placeholder="도로명주소"> <input
					type="text" id="sample4_jibunAddress" placeholder="지번주소"> <span
					id="guide" style="color: #999; display: none"></span> <input
					type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
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