<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/WEB-INF/views/headerbar.jsp"%>

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>BOARD</h2>
				<p>Just an assorted selection of elements.</p>
			</header>
			<div class="row">
				<div class="col-12">

					<!-- Form -->
					<section class="box">
						<h3>글 작성하기</h3>
						<form action="/board/write" method="post">
							<div class="row gtr-uniform gtr-50">
								<div class="col-6 col-12-mobilep">
									<input type="text" name="id" id="id"
										value="${login_user.user_id}" placeholder="Name" />
								</div>
								<div class="col-6 col-12-mobilep">
									<input type="text" name='title' id="title" placeholder="title">
								</div>
								<input type="hidden" name='category' value="${category}">
								<div class="col-12">
									<textarea name='content' id="message"
										placeholder="Enter your message" rows="6"></textarea>
								</div>
								<div class="form_section_content">
									<input type="file" multiple id="fileItem" name='uploadFile' style="height: 30px;">
									<div id="uploadResult">
<!-- 										<div id="result_card"> -->
<!-- 											<div class="imgDeleteBtn">x</div> -->
<!-- 											<img src="/board/display?fileName=test.png"> -->
<!-- 										</div> -->
									</div>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="submit" value="Send Message" /></li>
										<li><input type="reset" value="Reset" class="alt" /></li>
									</ul>
								</div>
							</div>
						</form>

						<hr />
					</section>

				</div>
			</div>
		</section>
	</div>

	<script type="text/javascript">
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
			
			//이미지가 등록될 때 파일이 이미 존재한다면 삭제를 처리한 후 서버에 이미지 업로드 요청을 수행
			if($(".imgDeleteBtn").length > 0){
				deleteFile();
			}
			
			// 		뷰에 서버로 데이터를 전송하기 위해 <form>태그 사용 그러나 이미지 첨부의 경우 화면 이동없이 첨부파일을 서버로 전송해야함
			// 		<form>태그와 같은 역할을 해주는 FormData객체를 생성하여 첨부파일을 FormData에 저장하고 FormData 자체를 서버로 전송
			let formData = new FormData();

			// 		fileList객체가 맞는지 확인하기 위한 과정
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			// 		fileList의 요소로 있는 File객체에 접근
			let fileObj = fileList[0];
			console.log("fileList:" + fileList);
			console.log("fileObj:" + fileObj);
			// 		File객체에 담긴 데이터가 <input>태그를 통해 선택한 파일이 맞는지 확인
			console.log("fileaName:" + fileObj.name);
			console.log("filesize:" + fileObj.size);
			console.log("fileType(MimeType):" + fileObj.type);

			//if 조건문에는 fileCheck()메서드와 not논리 연산자 작성,구현부에는 return false를 작성
			//이렇게 하면 메서드가 false를반환 했을 때 not연산자로 인해 ture로 값이 변경되어 실행됨
			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}
			// 		 <input> name과 Controller의 url 매핑 메서드의 매개변수 이름과 동일하게 해주었듯이
			// 		 key와 추후 추가할 url 매핑 메서드의 매개변수명이 동일
			//		파일 한 개만 저장
			// 		formData.append("uploadFile", fileObj);
			//		파일 여러 개 저장
			for (let i = 0; i < fileList.length; i++) {
				formData.append("uploadFile", fileList[i]);
			}
			// 		서버로 전송하는 코드
			//		processData와 contentType의 경우 속성 값을 false로 해주여야만 첨부파일이 서버로 전송됨
			$.ajax({
				url : '/board/upload', //서버로 요청을 보낼 url
				processData : false, //서버로 전송할 데이터를 queryString 형태로 변환할지 여부
				contentType : false, //서버로 전송되는 데이터의 content-type
				data : formData, //서버로 전송할 데이터
				type : 'POST', //서버 요청 타입(GET,POST)
				dataType : 'json', //서버로부터 반환받을 데이터 타입
				//성공처리 콜백 함수
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				//400에러
				error : function(result) {
					alert("이미지 파일이 아닙니다");
				}
			});

		});
		// 	파일 사이즈, 용량 제한
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576;
		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈를 초과하였습니다.")
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}

			return true;

		}
		
		//이미지 출력
		function showUploadImage(uploadResultArr){
			
			//전달받은 데이터 검증
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			
			let str = "";
			// encodeURIComponent() : 한글 자동 변환 / 이 메서드는 '/'와 '\'문자 또한 인코딩을 하기 때문에 replace 사용 안해도 됨
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<div id='result_card'>";
			str += "<img src = '/board/display?fileName="+ fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "</div>";
			
			uploadResult.append(str);
		}
		
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();		
		
		});
		//이미지 파일 삭제 메서드
		function deleteFile(){
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/board/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type: 'POST',
				success : function(result){
					console.log(result);
					targetDiv.remove();
					$("input[type='file']").val("");
				},
			error : function(result){
				console.log(result);
				alert("파일을 삭제하지 못하였습니다.")
			}
			});
		}
		
	</script>


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