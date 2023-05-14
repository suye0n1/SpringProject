<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<title>Insert title here</title>
<style>
#btn_submit {
	margin-left: 250px;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	font-weight: 500;
	border: none;
	border-radius: 10px;
	display: inline-block;
}

.btn_date {
	margin: 0;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	color: #fff;
	background-color: #ace2f9;
	font-weight: 300;
	border: none;
	/* 		border-radius: 10px; */
	display: inline-block;
	width: 100px;
	height: 30px;
}

#reservation_date {
	margin: 50px;
	width: 600px;
	border-collapse: collapse;
	color: #505050;
	/* 		border: 1px solid #dcdcdc; */
}

#reservation_date td.top {
	padding-bottom: 20px;
	font-weight: 700;
	font-size: 25px;
}

#reservation_date td.content {
	padding-bottom: 50px;
}

#calendar {
	margin-bottom: 50px;
	padding: 10px;
	width: 250px;
	color: #505050;
	border: 1px solid #dcdcdc;
}

#calendar td {
	padding: 10px;
}

#timeTable {
	margin-bottom: 50px;
	padding: 5px;
	width: 200px;
	color: #505050;
}

#timeTable td {
	padding: 8px;
}

#selectedDate {
	width: 200px;
	height: 25px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}

#selectedDate2 {
	width: 200px;
	height: 25px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}

#selectedTime {
	width: 200px;
	height: 25px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}

#totalPrice {
	width: 200px;
	height: 25px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}
</style>
</head>
<script type="text/javascript">
	var today = new Date(); //오늘 날짜 구하기

	//현재 참조중인 월 
	nowMonth = today.getMonth() + 1;
	//이번달이면 0, 다음달이면 1 리턴
	//monthEquals = thisMonth(nowMonth, realMonth);

	//선택되있던 셀 객체 저장
	var selectedCell;
	//선택된 월, 일
	var selectedMonth = null;
	var selectedDate = null;

	function buildCalendar() {
		var row = null
		var cnt = 0;
		var calendarTable = document.getElementById("calendar");
		var calendarTableTitle = document.getElementById("calendarTitle");
		calendarTableTitle.innerHTML = today.getFullYear() + "년"
				+ (today.getMonth() + 1) + "월"; //HTML의 CaledarTableTitle 요소의 내용에 추가

		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1); //현재 월의 첫 번째 날짜 출력
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //0:이전 달의 마지막 날짜를 계산해줌 그래서 todaly.getMonth()+1 

		while (calendarTable.rows.length > 2) { //작성할 테이블 초기화
			calendarTable.deleteRow(calendarTable.rows.length - 1);
		}

		row = calendarTable.insertRow();
		for (i = 0; i < firstDate.getDay(); i++) { //빈 셀을 생성???
			cell = row.insertCell(); //새로운 셀 생성해서 현재 행(row)에 삽입
			cnt += 1;
		}

		for (i = 1; i <= lastDate.getDate(); i++) { //요일 채우기
			cell = row.insertCell(); //새로운 셀 생성해서 현재 행(row)에 삽입
			cnt += 1;

			cell.setAttribute('id', i);
			cell.innerHTML = i;
			cell.align = "center";

			cell.onclick = function() { //선택한 일자 출력
				clickedYear = today.getFullYear();
				clickedMonth = (1 + today.getMonth());
				clickedDate = this.getAttribute('id');

				clickedDate = clickedDate >= 10 ? clickedDate : '0'
						+ clickedDate; //10 미만일 경우 0 + 한자리 수 
				clickedMonth = clickedMonth >= 10 ? clickedMonth : '0'
						+ clickedMonth;
				clickedYMD = clickedYear + "-" + clickedMonth + "-"
						+ clickedDate;

				opener.document.getElementById("date").value = clickedYMD;
				self.close();
			}

			cell.onclick = function() {
				//선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)
				clickedYear = today.getFullYear();
				clickedMonth = (1 + today.getMonth());
				clickedMonth = clickedMonth >= 10 ? clickedMonth : '0'
						+ clickedMonth;
				clickedDate = this.getAttribute('id');
				clickedDate = clickedDate >= 10 ? clickedDate : '0'
						+ clickedDate;

				clickedYMD = clickedYear + "-" + clickedMonth + "-"
						+ clickedDate;

				//하단에 예약일시 표시
				
				inputField = document.getElementById("selectedDate");
				inputField2 = document.getElementById("selectedDate2");

				if (inputField.value == "") {
					inputField.value = clickedYMD;
				} else if (inputField2.value == "") {
					inputField2.value = clickedYMD;
				} else if (inputField.value > clickedYMD) {
					inputField.value = clickedYMD;
				} else if (inputField2.value < clickedYMD) {
					inputField2.value = clickedYMD;
				} else if(inputField.value < clickedYMD && inputField2.value > clickedYMD) {
					inputField.value = clickedYMD;
					inputField2.value = "";
				}


				//선택된 월, 일 변수 저장
				selectedMonth = today.getMonth() + 1;
				selectedDate = this.getAttribute('id');

				//선택된 셀 색 변화
				if (selectedCell != null) {
					selectedCell.bgColor = "#FFFFFF";
				}
				selectedCell = this;
				this.bgColor = "#fbedaa";

			}

			if (cnt % 7 == 1) { //일요일 빨간색
				cell.innerHTML = "<font color=red>" + i + "</font>";
			}

			if (cnt % 7 == 0) { //토요일 파란색
				cell.innerHTML = "<font color=skyblue>" + i + "</font>";
				row = calendar.insertRow();
			}
		}

		if (cnt % 7 != 0) { //달력의 마지막 날 다음 자리는 빈칸으로 채우기
			for (i = 0; i < 7 - (cnt % 7); i++) {
				cell = row.insertCell();
			}
		}
	}

	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar();
	}

	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();
	}
</script>
<!-- <body> -->
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/WEB-INF/views/headerbar.jsp"%>

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>예약하기</h2>
				<br>
				<p>원하시는 날짜를 선택해주세요.</p>
			</header>
			<div class="row">
				<div class="col-12">

					<!-- Lists -->
					<form action="/reservation/selectedDate" method="post">
						<section class="box">
							<div class="row">
								<div class="col-6 col-12-mobilep">
									<ul class="alt">
											<select name="reserve_type">
											<option value="헬스">헬스</option>
											<option value="수영">수영</option>
											<option value="요가">요가</option>
											<option value="독서실">독서실</option>
											<option value="게스트하우스">게스트하우스</option>
											</select>
										<table id="reservation_date">
											<tr>
												<td class="top" align="center">날짜 선택</td>
												<!-- 				<td class="top" align="right"><button class="btn_date" type="button" onclick="tableinit()">초기화</button></td> -->
											</tr>
											<tr>
												<td>
													<table id="calendar">
														<tr>
															<td align="center"><label onclick="prevCalendar()">◀</label></td>
															<td colspan="5" align="center" id="calendarTitle">yyyy년
																m월</td>
															<td align="center"><label onclick="nextCalendar()">▶</label></td>
														</tr>

														<tr>
															<td align="center"><font color="red"></font>일</td>
															<td align="center">월</td>
															<td align="center">화</td>
															<td align="center">수</td>
															<td align="center">목</td>
															<td align="center">금</td>
															<td align="center"><font color="skyblue"></font>토</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class="top" align="left" colspan="2">예약일시</td>
											</tr>
											<tr>
												<td class="content" colspan="2" align="left"><input
													id="selectedDate" style="border: none; width: 100px"
													name="date1" readonly="readonly"> <input
													id="selectedDate2" style="border: none; width: 100px"
													name="date2" readonly="readonly"> <input
													type="hidden" id="user_id" name="user_id"
													value="${login_user.user_id}">
											</tr>
											<tr>
												<!-- 											type을 button으로 해주면 따로 자바스크립트 함수를 작성해야하지만 submit으로 해주면 따로 작성할 필요x -->
												<td><input type="submit" id="btn_submit"
													onclick="submitRes()" value="예약하기"></td>
											</tr>
										</table>
									</ul>
								</div>
							</div>
						</section>
					</form>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		buildCalendar();

		/* function submitRes(){
			let reservationForm = document.reservation;
			//아이디 저장
			let loginedId = reservation.loginedId.value;
			//선택한 날짜1
			let date1 = reservation.date1.value;
			//선택한 날짜2
			let date2 = reservation.date2.value;
			//값을 컨트롤러에 넘겨줘서 db 저장
			alert("예약되었습니다.");
			reservationForm.method = "post";
			reservationForm.action = "${contextPath}/reservation/selectedDate?date1=" + encodeURIComponent(date1) + "&date2=" + encodeURIComponent(date2);
			reservationForm.submit();
		} */
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