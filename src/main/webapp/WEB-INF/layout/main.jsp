<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>--%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<!-- animate.css 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="/css/main.css" />


<div id="fullpage">
	<div class="section bg_imgs01" >
		<strong id="main_txt" class="animate__animated">
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
						<%--<input class="form-control seldate flatpickr flatpickr-input" id="seldate" type="datetime-local" placeholder="select check in">
						<input class="form-control seldate2" id="seldate2" placeholder="select check out">--%>
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
		<div class="icon-scroll" id="icon_scroll">
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

<script>


</script>
<script type="text/javascript" src="/js/main.js"></script>

