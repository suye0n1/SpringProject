<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function sendCheckValue(event){
	event.preventDefault();
	var openJoinForm = opener.document.joinForm;	
	if(document.idCheckForm.chResult.value == "N"){
		alert("다른 아이디를 입력해주세요.");
		openJoinForm.user_id.focus();
		window.close();
	}	else{
		openJoinForm.idDuplication.value = "idCheck";
		openJoinForm.dbIdCheck.disabled = true;	//disabled: 버튼 비활성화하기
		openJoinForm.dbIdCheck.style.opacity = 0.6;	//opacity: 요소의 불투명도
		openJoinForm.dbIdCheck.style.cursor = "default";	//cursor: 마우스 커서 모양 바꾸기 auto: 자동 default: 기본값(화살표) pointer: 손가락 모양 wait: 로딩
		window.close();
	}
}
</script>
</head>
<body>
	<b><font size="4" color="gray">아이디 중복 확인</font></b><br>
	
	<form name="idCheckForm">
		<input type="text" name="user_id" value="${user_id}" disabled>
	<c:choose>	<%--choose = switch / when = case --%>
		<c:when test="${result==1}">	<%--컨트롤러에서 db값과 ${result==1}을 비교--%>
		<p style="color:red">이미 사용 중인 아이디입니다.</p>
		<input type="hidden" name="chResult" value="N"/>
		</c:when>
		<c:when test="${result==0}">	<%--컨트롤러에서 db값과 ${result==0}을 비교--%>
		<p style="color:blue">사용 가능한 아이디입니다.</p>
		<input type="hidden" name="chResult" value="Y"/>
		</c:when>
		</c:choose>
		<input type="button" onclick="window.close()" value="취소" />
		<input type="button" onclick="sendCheckValue(event)" value="사용하기" />
	</form>
</body>
</html>