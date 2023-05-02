<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;900&family=Playfair+Display+SC&display=swap" rel="stylesheet">
<style>
	.mainWrapper .header {
		background: transparent;
	}

	.mainTxt span {
		display: block;
		color: #fff;
		font-size: 60px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -100%);
		width: 100%;
		text-align: center;
		font-family: 'Playfair Display SC';
	}

	.selectRoom .selectHotel:before {
		content: '';
		display: block;
		position: absolute;
		left: 0;
		top: 0;
		width: 1px;
		height: 64px;
		background: #fff;
		opacity: .2;
	}
</style>
<body>

<%--페이지 배경--%>
<div class="hubmain"></div>
<div id="container" class="container">

	<div class="contents01" style="z-index: 1;">
		<div class="mainBg">
			<img src="https://www.josunhotel.com/static/home/images/ko/pc/HUMA/bg_main01.jpg">
		</div>
		<div class="mainTxt" style="opacity: 1;">
			<span>Experience the Difference</span>
		</div>
	</div>

</div>

<div class="selectGroup">
	<strong class="tit">RESERVATION</strong>
	<div class="selectWap" style="width:205px;" >
		<select data-height="150px" data-direction="up" name="selectVal"
				id="ui-id-1" style="display: none;">
			<option selected="selected" value="R">ROOM</option>
			<option  value="M">MEMBERSHIP</option>
		</select>
	</div>
</div>

<%--<div class="selectInner"></div>
	<div class="selectRoom" role="area">
		<div class="selectHotel">
		<strong class="tit">HOTEL</strong>
		</div>
		<div class="selectHotel">
			<strong class="tit">HOTEL</strong>
		</div>
</div>--%>

</body>