<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <script type="text/javascript">
	var today = new Date();	//오늘 날짜 구하기
	
	function buildCalendar(){
		var row = null
		var cnt = 0;
		var calendarTable = document.getElementById("calendar");
		var calendarTableTitle = document.getElementById("calendarTitle");
		calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월"; //HTML의 CaledarTableTitle 요소의 내용에 추가
		
		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1); //현재 월의 첫 번째 날짜 출력
		var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); //0:이전 달의 마지막 날짜를 계산해줌 그래서 todaly.getMonth()+1 
	
		while(calendarTable.rows.length > 2){	//작성할 테이블 초기화
			calendarTable.deleteRow(calendarTable.rows.length - 1);
		}
		
		row = calendarTable.insertRow();
		for(i = 0; i < firstDate.getDay(); i++){	//빈 셀을 생성???
			cell = row.insertCell(); //새로운 셀 생성해서 현재 행(row)에 삽입
			cnt += 1;
		}

		for(i = 1; i <= lastDate.getDate(); i++){	//요일 채우기
			cell = row.insertCell(); //새로운 셀 생성해서 현재 행(row)에 삽입
			cnt += 1;

			cell.setAttribute('id', i);
			cell.innerHTML = i;
			cell.align = "center";
			
			cell.onclick = function() {	//선택한 일자 출력
				clickedYear = today.getFullYear();
				clickedMonth = (1 + today.getMonth());
				clickedDate = this.getAttribute('id');
				
				clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate; //10 미만일 경우 0 + 한자리 수 
				clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
				clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
				
				opener.document.getElementById("date").value = clickedYMD;
				self.close();
			}
			
			if(cnt % 7 == 1){	//일요일 빨간색
				cell.innerHTML = "<font color=red>" + i + "</font>";
			}
			
			if(cnt % 7 == 0){	//토요일 파란색
				cell.innerHTML = "<font color=skyblue>" + i + "</font>";
				row = calendar.insertRow();
			}
		}

			if(cnt % 7 != 0){	//달력의 마지막 날 다음 자리는 빈칸으로 채우기
				for(i = 0; i < 7 - (cnt % 7); i++) {
					cell = row.insertCell();
				}
			}
		}
		
		function prevCalendar(){
			today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
			buildCalendar();
		}
		
		function nextCalendar(){
			today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
			buildCalendar();
		}

	</script>	 
<body>
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
	<script type="text/javascript">buildCalendar();</script>
	
	
	
</body>
</html>