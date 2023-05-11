<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<!-- animate.css 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="/css/main.css" />

<style>
	#select_hotel{
		background-color: transparent;
		border: none;
		cursor: pointer;
		color: #ffffff;
		width: 280px;
		font-weight: bold;
		padding-left: 0;
		display: inline-block;
		position: relative;
	}
	#select_hotel option{
		margin: 0;
		padding: 0;
		background-color: rgba(173,158,135,.9);
		cursor: pointer;
		border: 1px solid blue;
		color: #ffffff;
	}
	#select_hotel:focus {
		outline: none;

	}

	#room_options {
		position: absolute;
		top: -117%;
		left: 0%;
		right: 0%;
		height: 480px;
		width: 1408px;
		background-color: #ffffff;
	}
	#room_options_body{
		position: absolute;
		height: 480px;
		width: 1408px;
	}
	.room_option {
		font-size: 20px;
		width: 1408px;
		height: 160px;
		padding: 20px 20px 20px 20px;
		box-sizing: border-box;
		/*border: 1px solid #000000;*/
		position: absolute;
		background-color: #ffffff;
		color:  #000000;
		left: 0;
		line-height: 120px;
	}
	#room_option01_select{
	}
	#room_option02_select{
		top: 160px;
	}
	#room_option03_select{
		top: 320px;
	}
	.roomContainer{
		color: black;
		list-style: none;
	}
	.mainRoom{
		left:-965px;padding:90px 220px;
		height: 480px;
	}
	.mainRoom .roomContainer{
		padding:0;
	}
	.mainRoom .roomContainer .txtGuide{
		position:absolute;
		right:200px;
		bottom:180px;
	}
	.mainRoom .roomContainer .txtGuide.gjb{
		right:40px
	}
	.mainRoom .roomContainer .txtGuide li{
		display:block
	}
	.mainRoom .roomInner{
		position:relative;
		padding-left:130px
	}
	.mainRoom .roomSel{
		width:700px;
		margin:30px 0 0;
	}
	.mainRoom .roomSel+.roomSel{
		margin:80px 0 0;
	}
	.mainRoom .roomTit{
		position:absolute;
		left:0;
		top:50%;
		margin-top:-18px;
		width:130px;
		text-align:left;
		font-size:24px;
		font-weight:500;
	}
	.mainRoom .numPeople{
		width: 200px;
		border-bottom: 1px solid #000000;
		text-align: center;
		padding: 0 20px 10px 20px;
	}
	.mainRoom .numPeople+.numPeople{
		margin-left:40px
	}
	#toggleop_select{
		display: inline-block;
	}
	.numWrap {
		display: flex;
		align-items: center;
	}

	.numPeople {
		display: flex;
		align-items: center;
		margin-right: 10px;
		justify-content: space-between;
		padding: 20px 0;
	}
	.btnDown,.btnUp{
		border: none;
	}
	#btnDown_01{
		border: none;
	}
	#room_cnt,#adult_cnt,#children_cnt{
		background-color: transparent;
		border: none;
		cursor: pointer;
		color: #ffffff;
		width: 70px;
		font-weight: bold;
		padding-left: 0;
		display: inline-block;
		position: relative;
		text-align: center;
	}
	#room_cnt:focus, #adult_cnt:focus, #children_cnt:focus{
		outline: none;
	}
</style>

<div id="fullpage">
	<div class="section bg_imgs01" >
		<strong id="main_txt" class="animate__animated animate__fadeIn">
			Experience the Difference
		</strong>
		<form method="post" id="mainResveForm" name="mainResveForm" class="animate__animated animate__fadeIn" action="search_room">
			<input type="hidden" value="" id="check_in_hidden" name="check_in_hidden">
			<input type="hidden" value="" id="check_out_hidden" name="check_out_hidden">
			<input type="hidden" value="" id="check_in_show" name="check_in_show">
			<input type="hidden" value="" id="check_out_show" name="check_out_show">
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
							<select id="select_hotel" onclick="hideCalendars();hideroom_option();" name="select_hotel">
								<c:forEach var="dto" items="${list }">
									<option class="select_hotel_option" value="${dto.num }">${dto.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<a href="#" id="total_calendars" onclick="toggleCalendars();">
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
				<div id="calendars_body" class="hidden">
					<div id="calendars" class="animate__animated">
					<!--CHECK IN 달력-->
						<a class="close-btn" onclick="hideCalendars();"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/btn_close_25x25.png"></a> <!-- X 표시를 a 태그로 변경 -->
						<div class="calendar" id="calendar">
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
						<!--CHECK IN 달력끝-->
						<!--CHECK OUT  달력-->
						<div class="calendar" id="calendar02">
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
				<!--CHECK OUT 달력끝-->
					</div>
				</div>
				<a  href="#" id="toggleop_select" onclick="toggleop_select();">
					<div id="main_mini_dl_04" class="main_mini_dl_sub">
						<div id="main_border_04" class="main_mini_dl_size">
							<div id="room_select01">
								<div class="op_select op_select_sub">
									ROOM
								</div>
								<div class="op_select" id="main_mini_dl_04_room01">
									<span id="room_option01"><input id="room_cnt" value="1" type="text" readonly name="room_cnt"></span>
								</div>
							</div>
							<div id="room_select02">
								<div class="op_select op_select_sub">
									ADULT
								</div>
								<div class="op_select" id="main_mini_dl_04_room02">
									<span id="room_option02"><input id="adult_cnt" value="2" type="text" readonly name="adult_cnt"></span>
								</div>
							</div>
							<div id="room_select03">
								<div class="op_select op_select_sub">
									CHILDREN
								</div>
								<div class="op_select" id="main_mini_dl_04_room03">
									<span id="room_option03"><input id="children_cnt" value="0" type="text" readonly name="children_cnt"></span>
								</div>
							</div>
						</div>
					</div>
				</a>
				<div id="room_options_body" class="hidden">
					<div id="room_options" class="animate__animated">
						<a class="close-btn" onclick="hideroom_option();"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/btn_close_25x25.png"></a>
						<div class="mainRoom clearCont opened" style="display: block;">
							<div class="roomContainer">
								<div class="roomWrap">
									<div class="roomSel on">
										<div class="roomInner">
											<strong class="roomTit">객실1</strong>
											<div class="numWrap" data-roomnum="1">
												<div class="numPeople" data-target="adult">
													<input type="hidden" name="adltCntArr" value="2" id="adltCntArr01">
													<button type="button" id="btnDown_01"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_down.png"></button>
													<span>성인 <em>2</em></span>
													<button type="button" class="btnUp"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_up.png"></button>
												</div>
												<div class="numPeople" data-target="child">
													<input type="hidden" name="chldCntArr" value="0" id="chldCntArr01">
													<button type="button" class="btnDown"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_down.png"></button>
													<span>어린이 <em>0</em></span>
													<button type="button" class="btnUp"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_up.png"></button>
												</div>
											</div>
										</div>
									</div>
									<div class="roomSel"> <!-- 객실 추가 시 클래스 on 추가 -->
										<div class="roomInner">
											<strong class="roomTit">객실2</strong>
											<div class="numWrap" data-roomnum="2">
												<div class="numPeople" data-target="adult">
													<input type="hidden" name="adltCntArr" value="0" id="adltCntArr02">
													<button type="button" class="btnDown"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_down.png"></button>
													<span>성인 <em>0</em></span>
													<button type="button" class="btnUp"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_up.png"></button> <!-- 인원 수 0 일 경우 감소 쪽에 blank 클래스 추가 -->
												</div>
												<div class="numPeople" data-target="child">
													<input type="hidden" name="chldCntArr" value="0" id="chldCntArr02">
													<button type="button" class="btnDown"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_down.png"></button>
													<span>어린이 <em>0</em></span>
													<button type="button" class="btnUp"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_up.png"></button>
												</div>
											</div>
										</div>
									</div>
									<div class="roomSel">
										<div class="roomInner">
											<strong class="roomTit">객실3</strong>
											<div class="numWrap" data-roomnum="3">
												<div class="numPeople" data-target="adult">
													<input type="hidden" name="adltCntArr" value="0" id="adltCntArr03">
													<button type="button" class="btnDown"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_down.png"></button>
													<span>성인 <em>0</em></span>
													<button type="button" class="btnUp"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_up.png"></button>
												</div>
												<div class="numPeople" data-target="child">
													<input type="hidden" name="chldCntArr" value="0" id="chldCntArr03">
													<button type="button" class="btnDown"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_down.png"></button>
													<span>어린이 <em>0</em></span>
													<button type="button" class="btnUp"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_up.png"></button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- //roomWrap -->
								<ul class="txtGuide">
									<li>최대 3개 객실 예약 가능</li>
									<li id="ageTxtGuide">어린이 기준 : 37개월 ~ 만 12세</li>
								</ul>
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
		<div class="icon-scroll animate__animated animate__fadeIn" id="icon_scroll" >
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
	<div class="section bg_imgs03" >Some section3 <a href="#">아래</a></div>
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

<script>
	function toggleop_select() {
		var room_options_body = document.getElementById("room_options_body");
		var room_options = document.getElementById("room_options");
		var calendars_body = document.getElementById("calendars_body");
		var calendars = document.getElementById("calendars");
		var mainResveForm = document.getElementById("mainResveForm");
		var icon_scroll = document.getElementById("icon_scroll");
		var main_txt = document.getElementById("main_txt");

		calendars.classList.remove("animate__fadeInUp");
		calendars.classList.add("animate__fadeOutDown");

		if (room_options_body.classList.contains("hidden")) {

			// 방옵션을 나타내기 전에 숨겨진 상태일 때
			main_txt.classList.add("animate__fadeOut");
			setTimeout(function(){

				room_options_body.classList.remove("hidden");
				room_options.style.display = "block";
				calendars_body.classList.add("hidden");
				calendars.style.display = "none";

				room_options.classList.remove("animate__fadeOutDown");
				room_options.classList.add("animate__fadeInUp");
				mainResveForm.classList.add("calendars_show");
				icon_scroll.classList.add("icon_scroll_show");
			},300);
		} else {
			calendars_body.classList.add("hidden");
			calendars.style.display = "none";
			calendars.classList.remove("animate__fadeOutDown");
			// 방옵션을 숨길 때
			room_options.classList.remove("animate__fadeInUp");
			room_options.classList.add("animate__fadeOutDown");



			// 애니메이션 완료 후 방옵션 숨김 처리
			setTimeout(function() {
				room_options_body.classList.add("hidden");
				room_options.style.display = "none";
				room_options.classList.remove("animate__fadeOutDown");
				mainResveForm.classList.remove("calendars_show");
				icon_scroll.classList.remove("icon_scroll_show");
				main_txt.classList.remove("animate__fadeOut");
				main_txt.classList.add("animate__fadeIn");
			}, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
		}
	}

	// CHECK IN 및 CHECK OUT 방옵션 숨김 처리 함수
	function hideroom_option() {
		var room_options_body = document.getElementById("room_options_body");
		var room_options = document.getElementById("room_options");
		var mainResveForm = document.getElementById("mainResveForm");
		var icon_scroll = document.getElementById("icon_scroll");
		var main_txt = document.getElementById("main_txt");

		// 방옵션을 숨길 때
		room_options.classList.remove("animate__fadeInUp");
		room_options.classList.add("animate__fadeOutDown");

		// 애니메이션 완료 후 달력 숨김 처리
		setTimeout(function() {
			room_options_body.classList.add("hidden");
			room_options.style.display = "none";

			room_options.classList.remove("animate__fadeOutDown");
			mainResveForm.classList.remove("calendars_show");
			icon_scroll.classList.remove("icon_scroll_show");
			main_txt.classList.remove("animate__fadeOut");
			main_txt.classList.add("animate__fadeIn");
		}, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
	}


	//룸 옵션 자바스크립트
	$(".btnDown").click(function (){
		var numPeople = $(this).parent().children("input").val();
		$(this).parent().children("input").val(parseInt(numPeople)-1);
		var numPeople_m = $(this).parent().children("input").val();
		if(numPeople_m < 0){
			alert("0보다 작을 수 없습니다.");
			$(this).parent().children("input").val(0);
			$(this).parent().children("span").children("em").text(0);
		}else {
			$(this).parent().children("span").children("em").text(numPeople_m);
		}
		var child_num =  $(this).parent().next().find("input").val();
		if(child_num > 0 && numPeople_m <= 0){
			$(this).parent().next().find("input").val(0);
			$(this).parent().next().find("span").children("em").text(0);
		}

		var adltCntArr01 = $("#adltCntArr01").val();
		var adltCntArr02 = $("#adltCntArr02").val();
		var adltCntArr03 = $("#adltCntArr03").val();
		var chldCntArr01 = $("#chldCntArr01").val();
		var chldCntArr02 = $("#chldCntArr02").val();
		var chldCntArr03 = $("#chldCntArr03").val();

		if(adltCntArr02 > 0 && adltCntArr03 > 0){
			$("#room_cnt").val(3);
		} else if(adltCntArr02 > 0 || adltCntArr03 > 0){
			$("#room_cnt").val(2);
		} else{
			$("#room_cnt").val(1);
		}

		$("#adult_cnt").val(parseInt(adltCntArr01) + parseInt(adltCntArr02) + parseInt(adltCntArr03));
		$("#children_cnt").val(parseInt(chldCntArr01) + parseInt(chldCntArr02) + parseInt(chldCntArr03));

	});
	$("#btnDown_01").click(function (){
		var numPeople = $(this).parent().children("input").val();
		$(this).parent().children("input").val(parseInt(numPeople)-1);
		var numPeople_m = $(this).parent().children("input").val();
		if(numPeople_m < 1){
			alert("최소 한명은 필요합니다.");
			$(this).parent().children("input").val(1);
			$(this).parent().children("span").children("em").text(1);
		}else {
			$(this).parent().children("span").children("em").text(numPeople_m);
		}
		var adltCntArr01 = $("#adltCntArr01").val();
		var adltCntArr02 = $("#adltCntArr02").val();
		var adltCntArr03 = $("#adltCntArr03").val();
		var chldCntArr01 = $("#chldCntArr01").val();
		var chldCntArr02 = $("#chldCntArr02").val();
		var chldCntArr03 = $("#chldCntArr03").val();

		if(adltCntArr02 > 0 && adltCntArr03 > 0){
			$("#room_cnt").val(3);
		} else if(adltCntArr02 > 0 || adltCntArr03 > 0){
			$("#room_cnt").val(2);
		} else{
			$("#room_cnt").val(1);
		}

		$("#adult_cnt").val(parseInt(adltCntArr01) + parseInt(adltCntArr02) + parseInt(adltCntArr03));
		$("#children_cnt").val(parseInt(chldCntArr01) + parseInt(chldCntArr02) + parseInt(chldCntArr03));
	});
	$(".btnUp").click(function (){
		var numPeople = $(this).parent().children("input").val();
		$(this).parent().children("input").val(parseInt(numPeople)+1);
		var numPeople_s = $(this).parent().children("input").val();
		if(numPeople_s > 4){
			alert("최대 4명이 이용 가능합니다.");
			$(this).parent().children("input").val(4);
			$(this).parent().children("span").children("em").text(4);
		}else {
			$(this).parent().children("span").children("em").text(numPeople_s);
		}

		var adult_num =  $(this).parent().prev().find("input").val();
		if(adult_num == 0){
			alert("성인 없이 어린이만 예약 할 수 없습니다.");
			$(this).parent().children("input").val(0);
			$(this).parent().children("span").children("em").text(0);
		}
		var adltCntArr01 = $("#adltCntArr01").val();
		var adltCntArr02 = $("#adltCntArr02").val();
		var adltCntArr03 = $("#adltCntArr03").val();
		var chldCntArr01 = $("#chldCntArr01").val();
		var chldCntArr02 = $("#chldCntArr02").val();
		var chldCntArr03 = $("#chldCntArr03").val();

		if(adltCntArr02 > 0 && adltCntArr03 > 0){
			$("#room_cnt").val(3);
		} else if(adltCntArr02 > 0 || adltCntArr03 > 0){
			$("#room_cnt").val(2);
		} else{
			$("#room_cnt").val(1);
		}

		$("#adult_cnt").val(parseInt(adltCntArr01) + parseInt(adltCntArr02) + parseInt(adltCntArr03));
		$("#children_cnt").val(parseInt(chldCntArr01) + parseInt(chldCntArr02) + parseInt(chldCntArr03));
	});


</script>
<script type="text/javascript" src="/js/main.js"></script>

