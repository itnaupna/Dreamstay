<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style>
    .footer2 {
        /*display: none;*/
        position:absolute;
        bottom: -900px;
        left: 0;
        width: 100%;
    }
    <%-- 마이페이지 main content --%>
    .mypagecontent{
        /*border: 1px solid aqua;*/
        width: 1000px;
        height: 1200px;
        top: 32%;
        position: absolute;
        padding: 30px;
        margin-left: 500px;
        z-index: 1;
    }

</style>

<body>
<div class="myPagelayout">
    <header class="header2">
        <tiles:insertAttribute name="header2"/>
    </header>
    <div>
        <section class="info">
            <tiles:insertAttribute name="info"/>
        </section>
        <section class="mypagecontent">
            <tiles:insertAttribute name="mypagecontent"/>
        </section>
    </div>
    <footer class="footer2">
        <tiles:insertAttribute name="footer2"/>
    </footer>
</div>
</body>
