<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	<style>
		.adminWrapper{
			display:inline-flex;
		}
		.side{
			overflow-y:auto;
			overflow-x:hidden;
			height:100vh;
			width:80px;
			background-color:#f0f0f0;
			border-right:1px solid #e0e0e0;
			position:relative;
		}
		.top{
			/*height:7.5vh;*/
			width:calc(100vw - 80px);
			/*max-height: 80px;*/
			height:80px;
			background-color: rgba(136, 93, 54, 0.62);
			padding:10px;
		}
		.adminmain{
			height:calc(100vh - 80px);
			width:calc(100vw - 80px);
			padding: 10px;
		}

	</style>
	<script>
		function SetAdminTitle(title){
			document.title = 'DreamStay ' + title;
			$($('section.top>span')[0]).text(title);
		}
	</script>

</head>
<body>
<div class="adminWrapper">
	<aside class="side">
		<tiles:insertAttribute name="side" />
	</aside>
	<div class="rightside">
		<section class="top">
			<tiles:insertAttribute name="top" />
		</section>
		<section class="adminmain">
			<tiles:insertAttribute name="adminmain" />
		</section>
	</div>
</div>

</body>
</html>
