<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/board/write" method="post" enctype="multipart/form-data">
		<%-- enctype="multipart/form-data" 파일 가져오기 위한 작업
			form태그에 데이터를 저장하여 서버로 전송할 때는 기본값인 'application/x-www-form-urlencoded'이 사용
			하지만 파일과 같은 데이터를 주고 받기 위해서는 enctype속성값이 'multipart/form-data'이어야함
		--%>
		<input type="hidden" name='category' value="${category}"> <input
			name='title' placeholder="글 제목">
		<textarea rows="5" name='content' placeholder="글 내용을 입력하세요"></textarea>
	<input type="file" multiple id="fileItem" name='uploadFile' style="height: 30px;"> 
		<input type="submit" value="제출">
	</form>
	
<!-- 	script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script type="text/javascript">
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
// 		뷰에 서버로 데이터를 전송하기 위해 <form>태그 사용 그러나 이미지 첨부의 경우 화면 이동없이 첨부파일을 서버로 전송해야함
// 		<form>태그와 같은 역할을 해주는 FormData객체를 생성하여 첨부파일을 FormData에 저장하고 FormData 자체를 서버로 전송
		let FormData = new FormData();
		
// 		fileList객체가 맞는지 확인하기 위한 과정
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
// 		fileList의 요소로 있는 File객체에 접근
		let fileObj = fileList[0];
		console.log("fileList:" + fileList);
		console.log("fileObj:"+fileObj);
// 		File객체에 담긴 데이터가 <input>태그를 통해 선택한 파일이 맞는지 확인
		console.log("fileaName:"+fileObj.name);
		console.log("filesize:"+fileObj.size);
		console.log("fileType(MimeType):"+fileObj.type);
		
		//if 조건문에는 fileCheck()메서드와 not논리 연산자 작성,구현부에는 return false를 작성
		//이렇게 하면 메서드가 false를반환 했을 때 not연산자로 인해 ture로 값이 변경되어 실행됨
		if(!fileCheck(fileObj.name, fileObj.size)){
 			return false;
		}
// 		 <input> name과 Controller의 url 매핑 메서드의 매개변수 이름과 동일하게 해주었듯이
// 		 key와 추후 추가할 url 매핑 메서드의 매개변수명이 동일
//		파일 한 개만 저장
// 		formData.append("uploadFile", fileObj);
//		파일 여러 개 저장
		for(int i=0; i<fileList.length; i++){
			formData.append("uploadfile", fileList[i]);
		}
// 		서버로 전송하는 코드
//		processData와 contentType의 경우 속성 값을 false로 해주여야만 첨부파일이 서버로 전송됨
		$.ajax({
			url: '/board/write'	//서버로 요청을 보낼 url
			processData : false,	//서버로 전송할 데이터를 queryString 형태로 변환할지 여부
			contentType : false,	//서버로 전송되는 데이터의 content-type
			data : formData,	//서버로 전송할 데이터
			type : 'POST',		//서버 요청 타입(GET,POST)
			dataType : 'json',	//서버로부터 반환받을 데이터 타입
			//성공처리 콜백 함수
			success : function(result){
				console.log(result);
			}
			//400에러
 			error : function(result){
 				alert("이미지 파일이 아닙니다");
 			}
		});
		
		});
// 	파일 사이즈, 용량 제한
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576;
	function fileCheck(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈를 초과하였습니다.")
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
		
	}
	</script>
</body>
</html>