<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	monthEquals = thisMonth(nowMonth, realMonth);

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

				if (inputField.value === "") {
					inputField.value = clickedYMD;
				} else if (inputField.value < clickedYMD) {
					inputField = document.getElementById("selectedDate2");
					inputField.value = clickedYMD;
				} else {
					inputField.value = clickedYMD;
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
<body>
	<div class="mainBox">
		<div class="contentBox">
			<div class="textLeft">
				<span style="color: #505050; font-size: 30px; font-weight: 700">예약하기</span>
				<div class="underLine"></div>
			</div>
			<Form action="reservation" method="post" name="reservation">
				<table id="reservation_date">
					<tr>
						<td class="top" align="center">날짜 선택</td>
						<!-- 				<td class="top" align="right"><button class="btn_date" type="button" onclick="tableinit()">초기화</button></td> -->
					</tr>
					<tr>
						<td>
							<table id="calendar" align="center">
								<tr>
									<td align="center"><label onclick="prevCalendar()">◀</label></td>
									<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
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
							name="selectedDate" value="" readonly="readonly"></input> <input
							id="selectedDate2" style="border: none; width: 100px"
							name="selectedDate2" value="" readonly="readonly"></input>
					</tr>

					<tr>
						<td class="top" align="left">결제 정보</td>
					</tr>
					<tr>
						<td class="content" align="left" colspan="2"><input
							id="totalPrice"
							style="border: none; text-align: right; width: 100px"
							name="totalPrice" value="" readonly="readonly"></input></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td class="content" align="left" colspan="2"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					
				</table>
				<input type="button" id="btn_submit" value="결제하기" onclick="submitBuy()"></input>
			</Form>
		</div>
	</div>

	<script type="text/javascript">
		buildCalendar();
	</script>
</body>
</html>