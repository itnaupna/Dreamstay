<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" href="/css/main.css" />

<style>
	.calendar {
		font-size: 20px;
		width: 400px;
		padding: 20px 20px 20px 20px;
		box-sizing: border-box;
		/*border: 1px solid #000000;*/
		position: absolute;
		background-color: #ffffff;
		color:  #000000;
		/*display: none;*/
	}
	#calendar02{
		margin-left: 400px;
	}
	.calendar > .cal_header {text-align: center;}
	.calendar > .cal_header > .title {font-size: 25px; width:50%; display: inline-block;}
	.calendar > .cal_header > .calendar_btn {
		font-size: 20px;
		width: 30px;
		height: 30px;
		border: none;
		padding: 0;
		background-color: rgba(0,0,0,0);
		vertical-align: middle;
		color: black;

	}
	.calendar > .day {width:100%; display: table; table-layout: fixed; margin-top: 10px; font-size: 22px;}
	.calendar > .day > div {display: table-cell; text-align: center; height: 50px; vertical-align: middle;}
	.calendar > .day > div:first-child {color: red;}
	.calendar > .day > div:last-of-type {color: blue;}
	/*check in*/
	.calendar > .dates {display: flex; flex-wrap: wrap; width: 100%;}
	.calendar > .dates > .date {text-align: center; width: calc(100%/7); height: 50px; box-sizing: border-box;line-height: 3; border-radius: 3px;}
	.calendar > .dates > .date:nth-child(7n){color: blue;}
	.calendar > .dates > .date:nth-child(7n+1){color: red;}
	.calendar > .dates > .last {color: #c8c8c8 !important;}
	.calendar > .dates > .next {color: #c8c8c8 !important;}
	/*check OUT*/
	.calendar > .dates02 {display: flex; flex-wrap: wrap; width: 100%;}
	.calendar > .dates02 > .date02 {text-align: center; width: calc(100%/7); height: 50px; box-sizing: border-box;line-height: 3; border-radius: 3px;}
	.calendar > .dates02 > .date02:nth-child(7n){color: blue;}
	.calendar > .dates02 > .date02:nth-child(7n+1){color: red;}
	.calendar > .dates02 > .last {color: #c8c8c8 !important;}
	.calendar > .dates02 > .next {color: #c8c8c8 !important;}

	/*달력슬라이드*/

</style>



<div id="fullpage">
	<div class="section bg_imgs01" >
		<strong id="main_txt">
			Experience the Difference
		</strong>
		<form method="post" id="mainResveForm" name="mainResveForm">
			<input type="hidden" value="" id="check_in_hidden">
			<input type="hidden" value="" id="check_out_hidden">
			<div class="main_mini_dl">
				<div id="main_mini_dl_01" class="main_mini_dl_sub">
					<div id="main_border_01" class="main_mini_dl_size">
					RESERVATION
						<div id="main_mini_dl_01_room" class="main_mini_dl_main_txt">
							ROOM
						</div>
						</div>
					</div>
				<div id="main_mini_dl_02" class="main_mini_dl_sub">
					<div id="main_border_02" class="main_mini_dl_size">
						HOTEL
						<div id="main_mini_dl_02_hotel" class="main_mini_dl_main_txt">
							그랜드조선호텔
						</div>
					</div>
				</div>
				<a href="#">
					<div id="main_mini_dl_03" class="main_mini_dl_sub">
						<div id="main_border_03" class="main_mini_dl_size">
							CHECK IN/OUT
							<div id="main_mini_dl_03_check" class="main_mini_dl_main_txt">
								<span id="check_in"></span>
								&nbsp;
								<span>-</span>
								&nbsp;
								<span id="check_out"></span>
							</div>
						</div>
					</div>
				</a>
				<%--CHECK IN 달력--%>
				<div id="calendars" class="hidden">
					<div class="calendar animate__animated animate__backInUp" id="calendar">
							CHECK IN
						<div class="cal_header">
							<a class="calendar_btn" onclick="prevCal();">&lt;</a>
							<div class="title"><span class="year"></span><span class="month"></span></div>
							<a class="calendar_btn" onclick="nextCal();" >&gt;</a>
						</div>
						<div class="day">
							<div>S</div>
							<div>M</div>
							<div>T</div>
							<div>W</div>
							<div>T</div>
							<div>F</div>
							<div>S</div>
						</div>
						<div class="dates"></div>
					</div>
					<%--CHECK IN 달력끝--%>
					<%--CHECK OUT  달력--%>
					<div class="calendar animate__animated animate__backInUp" id="calendar02">
						CHECK OUT
						<div class="cal_header">
							<a class="calendar_btn" onclick="prevCal02();">&lt;</a>
							<div class="title"><span class="year02"></span><span class="month02"></span></div>
							<a class="calendar_btn" onclick="nextCal02();" >&gt;</a>
						</div>
						<div class="day">
							<div>S</div>
							<div>M</div>
							<div>T</div>
							<div>W</div>
							<div>T</div>
							<div>F</div>
							<div>S</div>
						</div>
						<div class="dates02"></div>
					</div>
				</div>
				<%--CHECK OUT 달력끝--%>
				<div id="main_mini_dl_04" class="main_mini_dl_sub">
					<div id="main_border_04" class="main_mini_dl_size">
						<div id="room_select01">
							<div class="op_select op_select_sub">
								ROOM
							</div>
							<div class="op_select" id="main_mini_dl_04_room01">
								1
							</div>
						</div>
						<div id="room_select02">
							<div class="op_select op_select_sub">
								ADULT
							</div>
							<div class="op_select" id="main_mini_dl_04_room02">
								2
							</div>
						</div>
						<div id="room_select03">
							<div class="op_select op_select_sub">
								CHILDREN
							</div>
							<div class="op_select" id="main_mini_dl_04_room03">
								0
							</div>
						</div>
					</div>
				</div>
				<div id="main_mini_dl_05" class="main_mini_dl_sub">
					<div id="main_border_05" class="main_mini_dl_size">
						<button type="submit" id="search_box">SEARCH</button>
					</div>
				</div>
			</div>
		</form>
		<div class="icon-scroll">
			<a href="#secondPage"><span class="txt-scroll">SCROLL</span>
			<img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_scroll.png" class="ico-scroll" alt="">
			<div class="arrows-scroll">
				<span></span>
				<span></span>
				<span></span>
			</div></a>
		</div>
	</div>
	<div class="section bg_imgs02">
		<div class="slide" id="slide1">
			<div class="one_page">
				<div class="one_cont" id="cont_01_01">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1545133&sysCode=FPBSS"></div>
						<div class="one_cont_main_txt">자세히보기</div>
						<div class="one_cont_sub_txt"><h2>DISCOVER SEOUL</h2></div><br>
						<div class="one_cont_sub_txt">전통과 현대의 맛이 가득한 서울시티 버스를 타고..</div>
						<div class="one_cont_sub_txt">2023.05.03 - 2023.10.31</div><br>
						<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color01">포포인츠 바이 쉐라톤 조선 서울역</div>
					</a>
				</div>
				<div class="one_cont" id="cont_01_02">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1533712&sysCode=TWCB"></div>
						<div class="one_cont_main_txt">자세히보기</div>
						<div class="one_cont_sub_txt"><h2>HAPPY PLAYCATION</h2></div><br>
						<div class="one_cont_sub_txt">어른이들에게는 동심을, 아이들에게는 상상력..</div>
						<div class="one_cont_sub_txt">2023.04.20 - 2023.07.20</div><br>
						<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color02">웨스틴 조선 부산</div>
					</a>
				</div>
				<div class="one_cont" id="cont_01_03">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1489591&sysCode=JPY"></div>
						<div class="one_cont_main_txt">자세히보기</div>
						<div class="one_cont_sub_txt"><h2>BOONTHESHOP X JOSUNPALACE</h2></div><br>
						<div class="one_cont_sub_txt">국내최초 럭셔리 스페셜티 스토어 분더샾과 함께..</div>
						<div class="one_cont_sub_txt">2023.03.17 ~ 2023.07.31</div><br>
						<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color03">조선 펠리스</div>
					</a>
				</div>
			</div>
		</div>
		<div class="slide" id="slide2">
			<div class="one_page">
				<div class="one_cont" id="cont_02_01">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1481795&sysCode=GJB"></div>
					<div class="one_cont_main_txt">자세히보기</div>
					<div class="one_cont_sub_txt"><h2>2 NIGHTS ESCAPE!</h2></div><br>
					<div class="one_cont_sub_txt">1박만으로 아쉽다면 최대 20% 할인 받고 2박..</div>
					<div class="one_cont_sub_txt">2023.03.08 ~ 2023.06.30</div><br>
					<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color04">그랜드 조선 부산</div>
					</a>
				</div>
				<div class="one_cont" id="cont_02_02">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1449440&sysCode=TWCB"></div>
						<div class="one_cont_main_txt">자세히보기</div>
						<div class="one_cont_sub_txt"><h2>ROMANTIC MOMENTS</h2></div><br>
						<div class="one_cont_sub_txt">해운대 바다가 아름답게 펼쳐진 호텔 룸 안에서 스...</div>
						<div class="one_cont_sub_txt">2023.02.07 ~ 2023.06.30</div><br>
						<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color05">웨스턴 조선 부산</div>
					</a>
				</div>
				<div class="one_cont" id="cont_02_03">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1425533&sysCode=FPBSS"></div>
						<div class="one_cont_main_txt">자세히보기</div>
						<div class="one_cont_sub_txt"><h2>STAY & PLAY : GOLF</h2></div><br>
						<div class="one_cont_sub_txt">호캉스와 골프를 모두 즐기는 완벽한 방법1..</div>
						<div class="one_cont_sub_txt">2023.01.31 ~ 2023.05.31</div><br>
						<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color06">포포인츠 바이 쉐라톤 조선 서울역</div>
					</a>
				</div>
			</div>
		</div>
		<div class="slide" id="slide3">
			<div class="one_page">
				<div class="one_cont" id="cont_03_01">
					<a href="#">
						<div><img class="one_cont_imgs" src="https://www.josunhotel.com/util/file/download.do?fileSn=1358633&sysCode=FPBSM"></div>
						<div class="one_cont_main_txt">자세히보기</div>
						<div class="one_cont_sub_txt"><h2>HIPJIRO PACKAGE</h2></div><br>
						<div class="one_cont_sub_txt">◆객실에서 느끼는 힙지로 바이브◆ 수페리어..</div>
						<div class="one_cont_sub_txt">2023.04.01 ~ 2023.05.31</div><br>
						<div class="one_cont_sub_txt one_cont_sub_color_txt" id="one_cont_sub_color07">포포인츠 바이 쉐라톤 조선,서울 명동</div>
					</a>
				</div>
				<div class="one_cont">
				</div>
				<div class="one_cont">
				</div>
			</div>
		</div>
	</div>
	<div class="section bg_imgs03" >Some section3 <a href="#4thpage">아래</a></div>
	<div class="section bg_imgs04" id="bg_imgs04">
		<div id="page4">
			<div class="page4_title">
				<div id="page4_main_title">
					<div>Retail Business</div>
				</div>
				<div id="page4_sub_title">
					<div>조선호텔앤리조트의 라이프 스타일 브랜드<br>
						호스피탈리티 전문성을 바탕으로 확장한 라이프 스타일 브랜드를 소개합니다.</div>
				</div>
			</div>
			<div id="page4_box">
				<div id="page4_sub_box_01">
					<div class="page4_box_logo" id="logo_01">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo03.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_01.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo" id="logo_02">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo02.png">
							<input type="hidden" class="page4_box_logo_inputs" value="/photo/page4_box_logo_02.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo04.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_03.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo05.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_04.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
				</div>
				<div id="page4_sub_box_02">
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo06.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_05.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo07.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_06.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo08.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_07.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo09.png">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_08.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- footer section 입니다 --%>
	<div class="section footer-wrap fp-auto-height">
		<div class="m_footer">
			<%@ include file="footer.jsp" %>
		</div>
	</div>

</div>
<script type="text/javascript">
	/*check in*/
	document.body.style.overflow = "hidden";
	var CDate = new Date();
	var today = new Date();
	var selectCk = 0;
	var check = 1;
	/*checkOut*/
	var CDate02 = new Date();
	var selectCk02 = 0;
	var check02 = 1;

	/*오늘 날짜*/
	var defaultYear = CDate.getFullYear();
	var defaultMonth =( CDate.getMonth() + 1).toString().padStart(2, '0');
	var defaultDate = CDate.getDate().toString().padStart(2, '0');
	var defaultDayOfWeek = CDate.getDay();

	var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
	var defaultDayOfWeekText = daysOfWeek[defaultDayOfWeek];

	var defaultFormattedDate = defaultYear + "." + defaultMonth + "." + defaultDate + " (" + defaultDayOfWeekText + ")";

	document.getElementById("check_in").innerText = defaultFormattedDate;

	/*내일날짜*/
	var tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate() + 1);

	var tomorrowYear = tomorrow.getFullYear();
	var tomorrowMonth = (tomorrow.getMonth() + 1).toString().padStart(2, '0');
	var tomorrowDate = tomorrow.getDate().toString().padStart(2, '0');
	var tomorrowDayOfWeek = tomorrow.getDay();

	var tomorrowDayOfWeekText = daysOfWeek[tomorrowDayOfWeek];

	var tomorrowFormattedDate = tomorrowYear + "." + tomorrowMonth + "." + tomorrowDate + " (" + tomorrowDayOfWeekText + ")";

	document.getElementById("check_out").innerText = tomorrowFormattedDate;


	var buildcalendar = function(){
		/*check in*/
		var htmlDates = '';
		var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날
		var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
		var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
		document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
		document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력
		/*check in*/
		const dates = [];
		if(thisFirst.getDay()!=0){
			for(var i = 0; i < thisFirst.getDay(); i++){
				dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
			}
		}
		for(var i = 1; i <= thisLast.getDate(); i++){
			dates.push(i); // 이번 달 날짜 채우기
		}
		for(var i = 1; i <= 13 - thisLast.getDay(); i++){
			dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
		}

		for(var i = 0; i < 42; i++){
			if(i < thisFirst.getDay()){
				htmlDates += '<div class="date last">'+dates[i]+'</div>';
			}else if(i >= thisFirst.getDay() + thisLast.getDate()){
				htmlDates += '<div class="date next">'+dates[i]+'</div>';
			}else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
				htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>';
			}else{
				htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>';
			}
		}

		document.querySelector(".dates").innerHTML = htmlDates;
	}

	var buildcalendar02 = function(){
		/*checkOut*/
		var htmlDates02 = '';
		var prevLast02 = new Date(CDate02.getFullYear(), CDate02.getMonth(), 0); //지난 달의 마지막 날
		var nextFirst02 = new Date(CDate02.getFullYear(), CDate02.getMonth() , 1); //다음 달의 첫째 날
		var nextLast02 = new Date(CDate02.getFullYear(), CDate02.getMonth() + 1, 0); //다음 달의 마지막 날
		document.querySelector(".year02").innerHTML = nextFirst02.getFullYear() + "년";  // year에 년도 출력
		document.querySelector(".month02").innerHTML = (nextFirst02.getMonth() + 1) + "월";  //month에 월 출력

		/*checkOut*/
		const dates02 = [];
		if(nextFirst02.getDay()!=0){
			for(var i = 0; i < nextFirst02.getDay(); i++){
				dates02.unshift(prevLast02.getDate()-i); // 지난 달 날짜 채우기
			}
		}
		for(var i = 1; i <= nextLast02.getDate(); i++){
			dates02.push(i); // 이번 달 날짜 채우기
		}
		for(var i = 1; i <= 13 - nextLast02.getDay(); i++){
			dates02.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
		}

		for(var i = 0; i < 42; i++){
			if(i < nextFirst02.getDay()){
				htmlDates02 += '<div class="date02 last">'+dates02[i]+'</div>';
			}else if(i >= nextFirst02.getDay() + nextLast02.getDate()){
				htmlDates02 += '<div class="date02 next">'+dates02[i]+'</div>';
			}else if(today.getDate()==dates02[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
				htmlDates02 += '<div id="date02_'+dates02[i]+'" class="date02 today" onclick="fn_selectDate02('+dates02[i]+');">'+dates02[i]+'</div>';
			}else{
				htmlDates02 += '<div id="date02_'+dates02[i]+'" class="date02" onclick="fn_selectDate02('+dates02[i]+');">'+dates02[i]+'</div>';
			}
		}
		document.querySelector(".dates02").innerHTML = htmlDates02;
	}




	function prevCal(){
		CDate.setMonth(CDate.getMonth()-1);
		buildcalendar();
	}
	function nextCal(){
		CDate.setMonth(CDate.getMonth()+1);
		buildcalendar();
	}

	function prevCal02(){
		CDate02.setMonth(CDate02.getMonth() - 1);
		buildcalendar02();
	}

	function nextCal02(){
		CDate02.setMonth(CDate02.getMonth() + 1);
		buildcalendar02();
	}

	/*check in*/
	function fn_selectDate(date){

		var year = CDate.getFullYear();
		var month = CDate.getMonth() + 1;
		var selectedDay = new Date(year, month - 1, date);
		var day = selectedDay.getDay();
		var date_txt = "";
		if(CDate.getMonth() + 1 < 10){
			month = "0" + (CDate.getMonth() + 1);
		}
		if(date < 10){
			date_txt = "0" + date;
		}
		else{
			date_txt = date;
		}
		var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		var dayOfWeek = daysOfWeek[day];

		if(selectCk == 0){
			$(".date").css("background-color", "");
			$(".date").css("color", "");
			$("#date_"+date).css("background-color", "red");
			$("#date_"+date).css("color", "white");

			$("#check_in_hidden").val(year+"-"+month+"-"+date);
			var period_1 = year + "." + month+"."+date_txt + " (" + dayOfWeek + ")";
			//alert(period_1);
			document.getElementById('check_in').innerText=period_1;
			check = 0;
			selectCk = 0;

			if(check == 0){
				const target = document.getElementById('btnS');
				target.disabled = false;
			}

		}

	}
	/*checkOut*/
	function fn_selectDate02(date02){
		var year02 = CDate02.getFullYear();
		var month02 = CDate02.getMonth() + 1;
		var selectedDay02 = new Date(year02, month02 - 1, date02);
		var day02 = selectedDay02.getDay();
		var date_txt02 = "";

		if(CDate02.getMonth() + 1 < 10){
			month02 = "0" + (CDate02.getMonth() + 1);
		}
		if(date02 < 10){
			date_txt02 = "0" + date02;
		}
		else{
			date_txt02 = date02;
		}
		var daysOfWeek02 = ["일", "월", "화", "수", "목", "금", "토"];
		var dayOfWeek02 = daysOfWeek02[day02];

		if(selectCk02 == 0){
			$(".date02").css("background-color", "");
			$(".date02").css("color", "");
			$("#date02_"+date02).css("background-color", "red");
			$("#date02_"+date02).css("color", "white");

			$("#check_out_hidden").val(year02 + "-" + month02+"-"+date02);
			var period_2 = year02 + "." + month02+"."+date_txt02 + " (" + dayOfWeek02 + ")";
			//alert(period_2);
			document.getElementById('check_out').innerText=period_2;
			check02 = 0;
			selectCk02 = 0;
			//alert(year02 + "-" + month02 +"-"+date02);

			if(check02 == 0){
				const target02 = document.getElementById('btnS');
				target02.disabled = false;
			}

		}

	}
	buildcalendar();
	buildcalendar02();
	const target = document.getElementById('btnS');
	target.disabled = true;
	$("#btnF").click(function(){
		const target = document.getElementById('btnS');
		target.disabled = true;
		CDate.setMonth(CDate.getMonth());
		buildcalendar();
		CDate02.setMonth(CDate02.getMonth());
		buildcalendar02();
	});
	function numberMaxLength(e){
		if(e.value.length > e.maxLength){
			e.value = e.value.slice(0, e.maxLength);
		}
	}

	/*달력슬라이드*/

</script>
<script type="text/javascript" src="/js/main.js"></script>

