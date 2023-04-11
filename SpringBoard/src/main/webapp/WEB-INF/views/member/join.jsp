<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="${contextPath}/resources/assets/js/joinmember.js"></script>
<script src="${contextPath}/resources/assets/js/addressapi.js"></script>
<!-- 주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 지도 -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c29e6e2a0b7d1f4b8bdd99f49d6fab&libraries=services"></script>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<h1>회원가입</h1>
	<form name="joinForm" method="post" onsubmit="return false;">
		<table cellpadding="10">
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
				<td><input type="text" name='email' id='email' required>
				<button type="button" id='mail_check_btn'>인증번호 받기</button><br>
				<input type="text" placeholder="인증번호 입력" class='email_auth_key' name='email_key' required maxlength="6">
				<button type="button">인증하기</button>
				</td>
			</tr>
			<tr>
				<th>주소</th>					
				<td><input type="text" id="sample6_postcode" name="postcode"
					placeholder="우편번호"> <input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="address"
					placeholder="주소"><br> <input type="text"
					id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				</td>
			</tr>
			
		</table>
		<table>
			<tr>
				<td>
				<%@include file="/WEB-INF/views/member/agree.jsp" %>
				</td>
			</tr>
			<tr>
				<td><button onclick="fn_joinMember()">회원가입</button></td>
			</tr>
		</table>
	</form>
			<script>
			//이메일 인증 작동 안됨
			$('#mail_check_btn').click(function(){
				const email = $('#email').val();	//이메일 주소값 얻어오기
				console.log('완성된 이메일:'+ email);	//이메일 오는지 확인
				const checkInput = $('.email_auth_key');	//인증번호 입력하는 곳
				
		 		$.ajax({
		 			type : 'get',	
		 			url : <c:url value ="/member/mailCheck?email="/>+email,
		 			success: function(data){
		 				console.log("data:"+data);
		 				code = data;
		 				alert('인증번호가 전송되었습니다.');
		 			}
				
				});//end ajax
				
			});
			
			</script>

	
</body>
</html>