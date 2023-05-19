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
<style>
	.section_3{
		text-align: center;
		color: #000000;
		font-size: 20px;


	}
	#section_3_body{

		display: inline-block;
		height: 500px;
		width: 1200px;
		background-color: #ffffff;
		text-align: center;
	}
	#section_3_logo{

		display: inline-block;
		position: relative;
		height: 400px;
		width: 400px;
		left: -1%;
		top: -85px;

	}
	#section_3_text_body{

		display: inline-block;
		height: 350px;
		width: 700px;
		margin-top: 75px;
		line-height: 20px;
		left: 30%;
		padding-top: 65px;
	}
	#section_3_text1{
		font-weight: bold;
		font-size: 35px;
		height: 70px;
	}
	#section_3_text2{

		display: inline-block;
		height: 100px;
		width: 700px;
		margin-top:50px;
		line-height: 20px;
		left: 30%;
		text-align: left;
	}
	#section_3_logo img {
		width: 400px;
		height: 400px;
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
						편안함(Easy), 자연(Green), 어울림(Love)
					</div>
					<div class="section_3" id="section_3_text2">1914년 조선호텔이 시작된 이래, 조선호텔앤리조트는 ‘First & Best’ 정신을 이어오며 호스피탈리티 산업의 대표기업으로 자리매김 하고 있습니다.<br>
						수많은 ‘한국 최초’의 신화를 남겨온 조선호텔앤리조트는 호텔 뿐 아니라 외식사업, 오피스 빌딩 위탁 운영 등 품격 있는 서비스와 시설을 제공합니다.</div>
				</div>
			</dviv>
		</div>
	</div>
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

<script type="text/javascript" src="/js/main.js"></script>