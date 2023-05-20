<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .dining_main {
        width: 100%;
        max-width: 1100px;
        margin: 0 auto;
        font-size: 18px;
        letter-spacing: 4px;
    }

    .dining_main1{
        font-family: "Playfair Display", serif;
    }

    .dining_ul {
        list-style: none;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    .dining_ul li{
        cursor: pointer;
    }

    .dining_ul li p {
        display: inline-block;
        /*padding: 20px 0;*/
        text-transform: uppercase;
        border-bottom: 2px solid transparent;
        transition: border-bottom-color 0.3s ease-in-out;
    }

    .dining_header {
        padding: 42px 0 64px 0;
        text-align: center;
    }

    .dining_header h2 {
        font-size: 18px;
        font-weight: normal;
        font-family: "Playfair Display", serif;
        font-style: italic;
        padding: 0 0 40px 0;
    }

    .dining_header h1 {
        font-size: 35px;
        font-weight: normal;
        font-family: "Playfair Display", serif;
        padding: 0 0 50px 0;
    }

    .dining_header_sub {
        font-size: 16px;
        line-height: 1.4;
        color: #868686;
    }

    .dining_header_sub p {
        color: inherit;
    }

    .dining_main_content {
        background-color: #f5dcdc;
        /*flex-wrap: nowrap;*/
        width: 1024px;
        height: 700px;
    }

    .dining_main_content img {
        display: block;
        margin: 0 auto;
        width: 512px;
        height: 334px;
    }

    .content_sub{
        margin-top: 60px;
    }

    .dining_photo_content,
    .dining_photo_content1,
    .dining_photo_content2,
    .dining_photo_content3{
        padding-top: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .dining_photo_content img,
    .dining_photo_content1 img,
    .dining_photo_content2 img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .dining_photo_content1{
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .dining_photo_content1 img,
    .dining_photo_content3 img{
        width: 50%;
        height: auto;
        margin: 10px;
    }

    .dining_photo_content{
        perspective: 1000px;
        position: relative;
    }

    .dining_photo_content img {
        transition: transform 0.5s;
        transform-style: preserve-3d;
    }

    .dining_photo_content:hover img {
        transform: rotateY(180deg);
    }

    .dining_photo_content .content-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.5s;
    }


    .dining_photo_content:hover .content-overlay {
        opacity: 1;
    }

    .dining_photo_content .content-overlay p {
        font-size: 16px;
        text-align: center;
    }

    .dining_ul li p:hover{
        border-bottom-color: rgba(139, 69, 19, 0.5);
    }
</style>
<%--<p class="p_title">Honest, Comfort, Uncomplicated</p>--%>
<div class="dining_main">
    <div class="dining_main1">
        <ul class="dining_ul">
            <li>
                <p>heritage</p>
            </li>
            <li>
                <p>special</p>
            </li>
            <li>
                <p>people</p>
            </li>
            <li>
                <p>now</p>
            </li>
            <li>
                <p>hotels</p>
            </li>
        </ul>
        <hr>
    </div>
    <div class="dining_header">
        <h2>Hotel Dining</h2>
        <h1>In the Mood for Dream Stay</h1>
        <div class="dining_header_sub">
            <p>놓칠 수 없는 Dream Stay의 다이닝 공간 두 곳</p>
        </div>
    </div>

    <div class="dining_main_content">
        <div class="content_title">
            <p>Dream Stay</p>
            <span>섬세하고 대범한 요리의 프라이빗 다이닝 레스토랑</span>
        </div>
        <img src="/photo/content.png">
        <div class="content_sub">
            <span>
                제주 식재료를 활용한 미식의 향연이 가득한 그랑제이는 힐 스위트관에 투숙한 고객들만을 위한 전용 다이닝 공간이다. 때문에 대저택의 거실에 있는 것처럼 안락함을 주는 인테리어와 고요한 풍경이 고객에게 최대의 행복감을 선사한다. 특별한 경험을 기대하는 고객을 맞이하기 위해 그랑제이의 주방은 늘 고민과 실험으로 가득하다. 과감히 국경을 없앤 메뉴들로 새로움을 채우고,
                섬세한 플레이팅으로 놀라움을 선사하기 위해서다. 그뿐만 아니라 그랑제이는 힐 스위트관의 투숙객들에게 정성으로 완성한 정갈한 아침 식사를 제공하는 레스토랑이며,
                투숙객을 위한 혜택으로 구성된  다양한 선택지의 저녁 메뉴인 ‘그랑 초이스’를 통해 제주 여행의 만족도를 한층 올려주는 역할도 한다.
            </span>
        </div>
    </div>
    
    <div class="dining_photo_content">
        <img src="/photo/content1.png">
        <div class="content-overlay">
            <p>호텔 다이닝 공간은 세련된 인테리어와 함께 탁월한 음식 경험을 제공합니다.<br>
                고풍스러운 분위기에서 편안하게 식사를 즐길 수 있습니다.</p>
        </div>
    </div>

    <div class="dining_photo_content1">
        <img src="/photo/content2.png">
        <img src="/photo/content3.png">
    </div>
    
    <div class="dining_photo_content2">
        <img src="/photo/content4.png">
    </div>

    <div class="dining_photo_content3">
        <img src="/photo/content5.png">
        <img src="/photo/content6.png">
    </div>
</div>
