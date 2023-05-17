<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    body {
        margin: 0;
        padding: 0;
    }

    .hoteldetail_slidebox ul {
        padding: 0;
        position: relative;
        left: 0;
        transition: 0.5s;
    }

    .hoteldetail_slidebox li {
        list-style: none;
    }

    .hoteldetail_slidebox {
        margin-left: 50px;
        width: 800px;
        height: 500px;
        overflow: hidden;
    }

    #hoteldetail_photos {
        display: flex;
    }

    .hoteldetail_photo {
        width: 800px;
        height: 500px;
    }

    .hoteldetail_slidebtn {
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 100px;
        position: absolute;
        border: none;
        color: #aaaaaa;
        padding: 0;
    }

    #hoteldetail_selectbox {
        margin-left: 50px;
        width: 400px;
        overflow: hidden;
        /*overflow-x: scroll;*/
        /*overflow-y: hidden;*/
        height: 100px;
        /*ms-overflow-style: none; !* 인터넷 익스플로러 *!*/
        /*scrollbar-width: none; !* 파이어폭스 *!*/
    }

    #hoteldetail_selectbox::-webkit-scrollbar {
        display: none;
    }

    #hoteldetail_selectPhotos {
        position: relative;
        padding: 0;
        display: flex;
        left: 160px;
        transition: 0.5s;
    }

    #hoteldetail_selectbox li {
        list-style: none;
    }

    .hoteldetail_selectPhoto {
        margin: 0 5px 0 5px;
    }

</style>

<br><br><br><br><br><br>
호텔 상세페이지

${detail[0].name}
<div class="hoteldetail_slidebox">
    <ul id="hoteldetail_photos">
        <li><img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/${detail[0].photo}" class="hoteldetail_photo" value="1"></li>
        <c:forEach var="photo" items="${roomphoto}" varStatus="idx">
            <li><img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/${photo}" class="hoteldetail_photo" value="${idx.count + 1}"></li>
        </c:forEach>
    </ul>
    <button type="button" class="hoteldetail_slidebtn" id="hoteldetail_prevbtn"><</button>
    <button type="button" class="hoteldetail_slidebtn" id="hoteldetail_nextbtn">></button>
</div>

<div id="hoteldetail_selectbox">
    <ul id="hoteldetail_selectPhotos">
        <li><img src="https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/${detail[0].photo}?type=f&w=80&h=80" class="hoteldetail_selectPhoto" leftIdx="${leftIndex[0]}" value="0"></li>
        <c:forEach var="photo" items="${roomphoto}" varStatus="idx">
            <li><img src="https://ukkzyijeexki17078490.cdn.ntruss.com/room/${photo}?type=f&w=80&h=80" class="hoteldetail_selectPhoto" leftIdx="${leftIndex[idx.count]}" value="${idx.count}"></li>
        </c:forEach>
    </ul>
</div>


<script>
    let photoList = $("#hoteldetail_photos");
    let slideBox = $(".hoteldetail_slidebox");
    const slideSize = $(".hoteldetail_slidebox").width(); // 슬라이드 컨테이너의 넓이값
    let slideBoxMargin = slideBox.outerWidth(true) - slideBox.outerWidth(); // 슬라이드 컨테이너의 마진값
    let photoLength = slideSize * $(".hoteldetail_photo").length; // 슬라이드 컨테이너에 들어있는 사진의 넓이 합
    let lastPhoto = ""; // 버튼 클릭 시 ul의 left 좌표
    let isTransition = true; // 트랜지션 작동 여부
    // 트랜지션 동작이 끝날때 이벤트
    var transitionEnd = 'transitionend webkitTransitionEnd oTransitionEnd otransitionend';

    let subPhotoList = $("#hoteldetail_selectPhotos");
    let subSlideBox = $("#hoteldetail_selectbox");
    let subSlideBoxMargin = subSlideBox.outerWidth(true) - subSlideBox.outerWidth();

    $(function() {
        $(".hoteldetail_slidebtn").css("top", slideBox.position().top * 2);
        // div의 top * 2 = 요소의 중앙 배치
        $("#hoteldetail_prevbtn").css("left", slideBox.position().left + 50);
        //   div의 left + width - absolute 할 요소의 width = div의 left의 끝 지점
        $("#hoteldetail_nextbtn").css("left", slideBox.position().left + slideBox.outerWidth(true) - $("#hoteldetail_nextbtn").outerWidth());

        $("#hoteldetail_nextbtn").click(next);
        $("#hoteldetail_prevbtn").click(prev);

        $("#hoteldetail_photos").on(transitionEnd, function() {isTransition = true;});

        $(".hoteldetail_selectPhoto").click(clickSlideView);
    });

    // 다음
    function next() {
        if(isTransition) {
            lastPhoto = photoList.position().left - (slideBoxMargin);
            if(Math.abs(lastPhoto) >= (photoLength - slideSize)) {
                photoList.css("left", 0);
                lastPhoto = Math.abs(photoList.position().left) + (slideBoxMargin);
                return;
            }
            photoList.css("left", photoList.position().left - (slideSize + (slideBoxMargin)));
            // subPhotoList.css("left", subPhotoList.position().left + 90);
            console.log(subPhotoList.position().left);
            console.log(photoList.position().left);
            console.log("마지막 사진 위치 : " + lastPhoto);
            console.log("범위 : " + photoLength);
            isTransition = false;
        }
    }

    // 이전
    function prev() {
        if(isTransition) {
            lastPhoto = photoList.position().left - (slideBoxMargin);
            if(lastPhoto >= 0) {
                console.log(1);
                photoList.css("left", 0);
                lastPhoto = Math.abs(photoList.position().left) + (slideBoxMargin);
                return
            }
            photoList.css("left", photoList.position().left + (slideSize - (slideBoxMargin)));

            console.log("마지막 사진 위치 : " + lastPhoto);
            console.log("범위 : " + photoLength);

            isTransition = false;
        }
    }

    // 클릭 시 해당 사진으로 바로 슬라이드
    function clickSlideView() {
        let photoValue = $(this).attr("value");
        let leftValue = $(this).attr("leftIdx");

        subPhotoList.css("left", leftValue + "px");
        photoList.css("left", -(photoValue * slideSize));

        console.log("leftvalue: " + leftValue);
        console.log(photoValue);
    }
</script>
