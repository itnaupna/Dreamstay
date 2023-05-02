<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" href="/css/main.css" />

<div id="fullpage">
	<div class="section bg_test01" >Some section1 <a href="#secondPage">아래</a></div>
	<div class="section bg_test02">Some section2 <a href="#3rdPage">아래</a>
		<div class="slide" id="slide1"><h1>Slide Backgrounds</h1></div>
		<div class="slide" id="slide2"><h1>Totally customizable</h1></div>
		<div class="slide" id="slide3"><h1>Totall customizable</h1></div>
	</div>
	<div class="section" >Some section3 <a href="#4thpage">아래</a></div>
	<div class="section" >Some section4 <a href="#firstPage">위로</a></div>
</div>
<script type="text/javascript" src="/js/main.js"></script>

