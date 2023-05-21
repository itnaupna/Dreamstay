<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- animate.css 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="/css/main.css" />

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
			<input type="hidden" value="1" name="select_hotel" id="select_hotel_hidden">
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
						<a href="#" id="total_hotels" onclick="toggleHotels();">
							<div id="main_mini_dl_02_hotel" class="main_mini_dl_main_txt" >
								<c:forEach var="dto" items="${list }">
									<c:if test="${dto.num == 1 }">
										<div id="select_hotel">${dto.name }</div>
									</c:if>
								</c:forEach>
							</div>
						</a>
						<div id="select_hotel_body" class="hidden">
							<div id="select_hotels" class="animate__animated">
								<a class="close-btn" onclick="hideHotels();"><img src="https://www.josunhotel.com/static/home/images/ko/pc/common/btn_close_25x25.png"></a>
								<div id ="select_hotels_container">
									<c:forEach var="dto" items="${list }">
										<a href="#" id="select_hotel_list">
											<input type="hidden" value="${dto.num }" name="select_hotel_list" id="select_hotel_val">
											<div id="select_hotel_list_name" style="background-image: url('https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/${dto.photo }')">
													${dto.name }
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
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
		<fmt:formatNumber value="${fn:length(list)/3 + (fn:length(list) mod 3>0?1:0)}" pattern="#" var="num2"/>
		<c:forEach begin="1" end="${num2}" var="slidenum">
			<fmt:formatNumber value="${slidenum}" pattern="00" var="slidenum"/>
			<div class="slide" id="slide${slidenum}">
				<div class="one_page">
					<c:forEach begin="1" end="3" var="onecontnum">
						<fmt:formatNumber value="${onecontnum}" pattern="00" var="onecontnum"/>
						<c:set value="${list[(slidenum-1)*3+(onecontnum-1)]}" var="slideitem"/>
						<c:if test="${slideitem ne null}">
							<div class="one_cont" id="cont_${slidenum}_${onecontnum}">
								<a href="/hotel/hoteldetail?num=${slideitem.num}">
									<div><img class="one_cont_imgs" src="https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/${slideitem.photo}"></div>
									<div class="one_cont_main_txt">자세히보기</div>
									<div class="one_cont_sub_txt"><h2>${slideitem.name}</h2></div>
									<div class="one_cont_sub_txt">${slideitem.memo}</div>
									<div class="one_cont_sub_txt">${slideitem.phone}</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="section bg_imgs03" >
		<div class="section_3">
			<dviv class="section_3" id="section_3_body">
				<div class="section_3" id="section_3_logo"><img src="https://cdn.discordapp.com/attachments/1101378968709501008/1108947363013329046/Dream_Stay_4.png"></div>
				<div class="section_3" id="section_3_text_body">
					<div class="section_3" id="section_3_text1">
						꿈을 품은 호텔, Dream Stay가 여러분을 기다립니다.
					</div>
					<div class="section_3" id="section_3_text2">꿈이 펼쳐지는 곳, 드림 스테이에 오신 것을 환영합니다.<br>
						눈부신 아침 햇살과 편안한 밤의 휴식,<br>
						모든 순간이 고요하고 아름다운 시간으로 어우러집니다.<br>
						풍요로운 객실과 다채로운 다이닝 옵션으로 특별한 체험을 선사합니다.<br>
						탁월한 위치와 아름다운 전망으로 도시의 아름다움을 만끽하세요.<br>
						최상의 품질과 서비스로 특별한 순간을 선사하는 호텔입니다.<br>
						특별한 여정은 이곳에서 시작됩니다.</div>
				</div>
			</dviv>
		</div>
	</div>
	<div class="section bg_imgs04 bg_imgs04_01" id="bg_imgs04">
		<div id="page4">
			<div class="page4_title">
				<div id="page4_main_title">
					<div>Retail Business</div>
				</div>
				<div id="page4_sub_title">
					<div>드림스테이의 라이프 스타일 브랜드<br>
						호스피탈리티 전문성을 바탕으로 확장한 라이프 스타일 브랜드를 소개합니다.</div>
				</div>
			</div>
			<div id="page4_box">
				<div id="page4_sub_box_01">
					<div class="page4_box_logo page4_logo01" id="logo_01">
						<a href="https://cafe.naver.com/zipsy">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo03.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_01.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo page4_logo02" id="logo_02">
						<a href="https://heroesofthestorm.com/ko-kr/">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo02.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="/photo/page4_box_logo_02.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo page4_logo03">
						<a href="https://www.josunhotel.com/retail/jaju.do">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo04.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_03.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo" id="main_kimchi">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo05.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_04.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
				</div>
				<div id="page4_sub_box_02">
					<div class="page4_box_logo page4_logo05">
						<a href="https://www.josunhotel.com/product/kyukmul.do">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo06.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_05.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo page4_logo06">
						<a href="https://www.josunhotel.com/product/janePacker.do">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo07.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_06.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo page4_logo07">
						<a href="https://www.youtube.com/watch?v=VmgzvfIX14Q&ab_channel=STEVENHWANG">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo08.png" class="page4_box_logo_img">
							<input type="hidden" class="page4_box_logo_inputs" value="./photo/page4_box_logo_07.jpg">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo page4_logo08">
						<a href="https://cafe.naver.com/funcc">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo09.png" class="page4_box_logo_img">
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

<script type="text/javascript" src="/js/main.js"></script>