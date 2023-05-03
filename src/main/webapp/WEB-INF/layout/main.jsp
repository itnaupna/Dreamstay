<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" href="/css/main.css" />

<style>
	/*메인타이틀 css*/
	#main_txt{
		display: inline-block;
		text-align: center;
		width: 100%;
		font-size: 60px;
		color: #ffffff;
		margin-bottom: 70px;
	}
	/*메인 아래 기능들 css*/
	.main_mini_dl{
		height: 64px;
		color: #ffffff;
		text-align: center;
		font-weight: bold;
		justify-content: space-between;
	}
	/*기능들 넓이 css*/
	#main_mini_dl_01{
		width: 205px;
	}

	#main_mini_dl_02{
		width: 300px;
		padding: 0px 30px;
	}
	#main_mini_dl_03{
		width: 380px;
		padding: 0px 30px;
	}
	#main_mini_dl_04{
		width: 270px;
		padding: 0px 30px;
	}

	#main_mini_dl_01_room{
		color: #ffffff;
		width: 205px;
		padding: 0px;
		font-size: 20px;
	}
	#main_mini_dl_02_hotel{
		width: 300px;
	}
	#main_mini_dl_03_check{
		width: 380px;
	}

	#main_mini_dl_04_room01{
		font-size: 25px;
		color: #ffffff;
	}
	#main_mini_dl_04_room02{
		font-size: 25px;
		color: #ffffff;
	}#main_mini_dl_04_room03{
		 font-size: 25px;
		 color: #ffffff;
	 }

	/*기능들을 감싸는 div css*/
	#main_border_01{
		border-right: 2px solid #c8c8c8;
		width: 205px;
		line-height: 30px;
	}
	#main_border_02{
		border-right: 2px solid #c8c8c8;
		width: 300px;
		padding: 0px 30px;
		padding-left: 0px;
		line-height: 30px;
	}
	#main_border_03{
		border-right: 2px solid #c8c8c8;
		width: 380px;
		padding: 0px 30px;
		line-height: 30px;
	}
	#main_border_04{
		width: 270px;
		padding: 0px 0px 0px 30px;
		justify-content: space-between;
		line-height: 30px;

	}
	/*div 간격 css*/
	#room_select01{
		justify-content: space-between;
		width: 70px;
		display: inline-block;
	}
	#room_select02{
		justify-content: space-between;
		width: 70px;
		display: inline-block;
	}
	#room_select03{
		justify-content: space-between;
		width: 70px;
		display: inline-block;
	}
	/*검색버튼 css*/
	#search_box{
		color: #ffffff;
		font-size: 20px;
		border: 2px solid #ffffff;
		padding-left: 35px;
		padding-right: 35px;
		height: 64px;
		width: 165px;
		text-align: center;
		line-height: 32px;
		margin-left: 25px;
		margin-bottom: 40px;
		font-weight: bold;
		position: relative;
		top:0;
		left: 15px;
		vertical-align: middle;
		transition: 0.6s;
	}
	#search_box:hover{
		color: black;
		background-color: #ffffff;
	}

	/*기능들 겹치는 부분 클래스로 통합*/
	.op_select{
		text-align: center;
	}

	.main_mini_dl_main_txt{
		color: #ffffff;
		font-size: 20px;

	}
	.main_mini_dl_sub{
		color: rgba(200,200,200,1);
		font-size: 14px;
		text-align: left;
		box-sizing: border-box;
		height: 0;
		display: inline-block;

	}
	/*스크롤아이콘 css(마우스모양)*/
	.txt-scroll{
		text-align: center;
		color: #ffffff;
		font-weight: bold;
		display: block;
		font-size: 13px;
		position: relative !important;
	}
	.arrows-scroll{
		margin: 0px 18px;

	}
	.icon-scroll {
		text-align: center;
		display: block;
		width: 50px;
		height: 50px;
		bottom: 20px;
		left: 43%;
		margin-left: 150px;
		transform: translateX(-50%);
		z-index: 9999;
		position: relative !important;
		top: 31%;
	}
	.icon-scroll .arrows-scroll span {
		display: block;
		bottom: 0;
		left: 50%;
		width: 10px;
		height: 10px;
		margin-left: 1px;
		border-left: 1px solid #fff;
		border-bottom: 1px solid #fff;
		transform: rotate( -45deg );
		animation: scrollDown 2s infinite;
		opacity: 0;
		box-sizing: border-box;
	}
	.icon-scroll .arrows-scroll span:nth-of-type(3) {
		animation-delay: .3s;
	}
	.icon-scroll .arrows-scroll span:nth-of-type(2) {
		bottom: 7px;
		animation-delay: .15s;
	}
	.icon-scroll .arrows-scroll span:nth-of-type(1) {
		bottom: 14px;
		animation-delay: 0s;
	}
	@keyframes scrollDown {
		0% {
			opacity: 0;
		}
		50% {
			opacity: 1;
		}
		100% {
			opacity: 0;
		}
	}
	/*2번페이지 시작*/
	.one_page{
		text-align: center;
		display: flex;
		justify-content: center;
		margin: 0 auto;
	}
	.one_cont{
		display: inline-block;
		padding: 30px;
	}


</style>

<div id="fullpage">
	<div class="section bg_imgs01" >
		<strong id="main_txt">
			Experience the Difference
		</strong>
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
				<div id="main_mini_dl_03" class="main_mini_dl_sub">
					<div id="main_border_03" class="main_mini_dl_size">
						CHECK IN/OUT
						<div id="main_mini_dl_03_check" class="main_mini_dl_main_txt">
							2023.05.03 목요일 - 2023.05.04 목
						</div>
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
						<button type="button" id="search_box">SEARCH</button>
					</div>
				</div>
			</div>
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
	<div class="section bg_imgs02">Some section2 <a href="#3rdPage">아래</a>
		<div class="slide" id="slide1">
			<div class="one_page">
				<div class="one_cont">
					<div><img src="/photo/josu.png"></div>
					<div>discoverseoul</div>
					<div> 전통과 현대의 맛이 가득한 서울시티 버스를 타고...<br>2023.05.03 ~ 2023.05.09</div>
					<div>포포인츠 바이 쉐라톤 조선 서울역</div>
				</div>
				<div class="one_cont">
					<div><img src="/photo/josu.png"></div>
					<div>discoverseoul</div>
					<div> 전통과 현대의 맛이 가득한 서울시티 버스를 타고...<br>2023.05.03 ~ 2023.05.09</div>
					<div>포포인츠 바이 쉐라톤 조선 서울역</div>
				</div>
				<div class="one_cont">
					<div><img src="/photo/josu.png"></div>
					<div>discoverseoul</div>
					<div> 전통과 현대의 맛이 가득한 서울시티 버스를 타고...<br>2023.05.03 ~ 2023.05.09</div>
					<div>포포인츠 바이 쉐라톤 조선 서울역</div>
				</div>
			</div>
		</div>
		<div class="slide" id="slide2"><h1>Totally customizable</h1></div>
		<div class="slide" id="slide3"><h1>Totall customizable</h1></div>
	</div>
	<div class="section bg_imgs03" >Some section3 <a href="#4thpage">아래</a></div>
	<div class="section bg_imgs04" >Some section4 <a href="#firstPage">위로</a></div>

</div>
<script type="text/javascript" src="/js/main.js"></script>

