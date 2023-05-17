<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="map" style="width:500px;height:400px;"></div>
<!-- kakaomap api key code -->
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa468c5083b55410c7222b4cfec215f7"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var y = 126.570667;
    var delta = 0.005; // 마커가 이동하는 거리입니다. 조정 가능합니다.

    // 마커를 표시할 위치입니다
    var position =  new kakao.maps.LatLng(33.450701, y);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: position,
        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
    });

    // 마커를 지도에 표시합니다.
    marker.setMap(map);
    kakao.maps.event.addListener(marker, 'mouseover', function() {
        // 마커에 마우스오버 이벤트를 등록합니다
        // 마커에 애니메이션을 적용합니다
        marker.setAnimation(kakao.maps.Animation.BOUNCE);
    });

    kakao.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트를 등록합니다
        // 마커에 애니메이션을 제거합니다
        marker.setAnimation(null);
    });
</script>



