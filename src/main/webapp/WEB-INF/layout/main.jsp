<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" href="/css/main.css" />

<style>
	#page4{
		color: #ffffff;
		height: 530px;
		width: 920px;
		text-align: center;
		margin: 0 auto;
	}
	#page4_main_title{
		font-size: 60px;
	}
	#page4_sub_title{
		font-size: 25px;
		margin-top: 20px;
		margin-bottom: 70px;
	}
	#page4_sub_box_01{
		font-size: 0;
	}
	#page4_sub_box_02{
		font-size: 0;
	}
	.page4_box_logo{
		display: inline-block;
		width: 229px;
		height: 140px;
		border: 1px solid rgba(200,200,200,0.3);
		font-size: 10px;
		opacity: .6;
		padding-top: 25px;
		margin-top:-1px;
		margin-left: -1px;
	}
	.page4_box_logo:hover div{
		opacity: 1.5;
	}
	.page4_box_logo:hover{
		border: 1px solid rgba(200,200,200,0.1);
		opacity: 1.5;
		transition: opacity 0.24s ease-in-out;
		background-color: rgba(1,1,1,0.37); ;
	}
	.page4_box_logo div{
		font-size: 14px;
		text-decoration: underline;
		text-underline-offset : 8px;
		opacity: 0;
		transition: opacity 0.17s ease-in-out;
		color: #ffffff;
	}
</style>


<script>
	$(function (){
		$(".page4_box_logo").mouseover(function () {
			const src = $(this).find(".inputs").val();
			$(".bg_imgs04").css("background-image", "url(" + src + ")");
		});
		$(".page4_box_logo").mouseout(function () {
			$(".bg_imgs04").css("background-image", "url(https://www.josunhotel.com/revolution/content/fileImage.do?fileId=255595&cntntsSn=255594)");
		});
	});
</script>

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
	<div class="section bg_imgs04" id="bg_imgs04" >
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
					<a href="#">
						<div class="page4_box_logo">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo03.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=255595&cntntsSn=255594">
							<div>자세히 보기</div>
						</div>
					</a>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo02.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=255356&cntntsSn=255355">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo04.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=255714&cntntsSn=255713">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo05.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=254985&cntntsSn=254983">
							<div>자세히 보기</div
						</a>
					</div>
				</div>
				<div id="page4_sub_box_02">
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo06.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=667086&cntntsSn=667085">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo07.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=253901&cntntsSn=253899">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo08.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=255574&cntntsSn=255573">
							<div>자세히 보기</div>
						</a>
					</div>
					<div class="page4_box_logo">
						<a href="#">
							<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/img_oblist_logo09.png">
							<input type="hidden" class="inputs" value="https://www.josunhotel.com/revolution/content/fileImage.do?fileId=672859&cntntsSn=672858">
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

