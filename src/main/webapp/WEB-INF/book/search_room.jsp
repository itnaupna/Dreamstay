<%--
  Created by IntelliJ IDEA.
  User: milion
  Date: 2023-05-09
  Time: 오후 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<br><br><br><br><br><br><br><br><br><br><br>
<div>
    <div>
        <div>
            <button type="button" onclick="search_room">세션 가지고오기</button>
            <input type="text" value="${sessionScope.checkIn}">
            <input type="text" value="${sessionScope.checkOut}">
            <input type="text" value="${sessionScope.checkInShow}">
            <input type="text" value="${sessionScope.checkOutShow}">
            <input type="text" value="${sessionScope.selectedHotel}">
            <input type="text" value="${sessionScope.roomCount}">
            <input type="text" value="${sessionScope.adultCount}">
            <input type="text" value="${sessionScope.childrenCount}">
        </div>
    </div>
</div>

<script>


</script>

