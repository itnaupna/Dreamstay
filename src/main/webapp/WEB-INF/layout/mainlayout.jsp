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

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/css/commonlayout.css"/>
	<style>
		/* footer 설정입니다 */
		.footer{
			display: none;
		}
	</style>
</head>
<body>
<div class="mainlayout">
	<header class="header">
		<tiles:insertAttribute name="header" />
	</header>
	<section class="main">
		<tiles:insertAttribute name="main" />
	</section>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	<c:if test="${loginuser != null and loginuser.user_level == 1}"> <%-- 채팅기능은 로그인 유저에게만 노출 --%>
		<aside class="floatingchat">
			<tiles:insertAttribute name="floating"/>
		</aside>
	</c:if>
</div>
</body>
</html>
