<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" href="/css/main.css" />

<style>
	#main_txt{
		display: inline-block;
		text-align: center;
		width: 100%;
		font-size: 60px;
		color: #ffffff;
		margin-bottom: 70px;
	}
	.main_mini_dl{
		height: 64px;
		color: #ffffff;
		text-align: center;
		font-weight: bold;
		justify-content: space-between;
	}
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
		border-right: 2px solid #c8c8c8;
	}
	#main_mini_dl_02_hotel{
		width: 300px;
		border-right: 2px solid #c8c8c8;
	}
	#main_mini_dl_03_check{
		width: 380px;
		border-right: 2px solid #c8c8c8;
	}

	#main_mini_dl_04_room{
		text-align: center;
	}
	#main_border_01{
		border-right: 2px solid #c8c8c8;
	}
	#main_border_02{
		border-right: 2px solid #c8c8c8;
	}
	#main_border_03{
		border-right: 2px solid #c8c8c8;
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

	.section{
		border: 1px solid black;
	}


</style>

<div id="fullpage">
	<div class="section bg_imgs01" >
		<strong id="main_txt">
			Experience the Difference
		</strong>
			<div class="main_mini_dl"><!-- contents01 일 경우 cts01, contents02 일 경우 cts02 클래스 적용 -->
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
							텔호선조드랜그
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
						ROOM
						<div id="main_mini_dl_04_room" class="main_mini_dl_main_txt">
							1
						</div>
					</div>
				</div>
			</div>
		<div class="icon-scroll">
			<span class="txt-scroll" style="">SCROLL</span>
			<img src="https://www.josunhotel.com/static/home/images/ko/pc/common/ico_scroll.png" class="ico-scroll" alt="">
			<div class="arrows-scroll">
				<span></span>
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<div class="section bg_imgs02">Some section2 <a href="#3rdPage">아래</a>
		<div class="slide" id="slide1"><h1>Slide Backgrounds</h1></div>
		<div class="slide" id="slide2"><h1>Totally customizable</h1></div>
		<div class="slide" id="slide3"><h1>Totall customizable</h1></div>
	</div>
	<div class="section bg_imgs03" >Some section3 <a href="#4thpage">아래</a></div>
	<div class="section bg_imgs04" >Some section4 <a href="#firstPage">위로</a></div>


</div>
<script type="text/javascript" src="/js/main.js"></script>

