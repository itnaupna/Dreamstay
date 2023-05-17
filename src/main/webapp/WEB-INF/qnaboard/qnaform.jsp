<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>

    .qnaform .qnahotel, .qnaform .qnacategory{
        background-color: white;
        border: none;
        border-bottom: 1px solid black;
        padding: 5px;
        cursor: pointer;
        font-size: 17px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-position: 96% center;
        background-size: 10px 10px;
    }

    .qnaform .property{
        /*border: 1px solid red;*/
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        width: 926px;
    }

    .qnaform .hotelselect, .qnaform .categoryselect {
        position: relative;
        width: 400px;
        margin-top: 30px;
    }

    .qnaform .qnahotellist, .qnaform .categoryllist {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background-color: white;
        border: 1px solid #ddd;
        border-top: none;
        padding: 0;
        margin: 0;
        list-style: none;
        display: none;
        overflow-y: scroll;
        max-height: 150px;
        z-index: 10;
    }

    .qnaform .qnahotellist li, .qnaform .categorylist li {
        padding: 5px;
        cursor: pointer;
    }

    .qnaform .qnahotellist li:hover, .qnaform .categorylist li:hover {
        background-color: white;
    }


</style>

<script type="text/javascript">
    const config = {
        enableTime: false,
        dateFormat: "Y-m-d"
    };

    flatpickr("input[type=date-local]", config);

    $(document).ready(function (){
        //초기값 (문의)

        $(".useday").hide();
        $(".qnaupload").hide();

        $("input[name='qna_type']").change(function (){

            //문의 선택 시
            if($("input[name='qna_type']:checked").val()=='문의'){
                $(".useday").hide();
                $(".qnaupload").hide();

            }

            //의견 선택 시
            else if ($("input[name='qna_type']:checked").val()=='의견'){
                $(".useday").show();
                $(".qnaupload").show();
                $(".reserveno").hide();


            }
        });
    });



</script>


<div class="qnaform">
    <form action="/insertqna" method="post" name="qnaboard" enctype="multipart/form-data">

       <%--의견 문의 선택--%>
        <div class="typeselect">
            <span>TYPE *</span>
            <input type="radio" name="qna_type" value="문의" checked>문의
            <input type="radio" name="qna_type" value="의견">의견

        </div>

        <%--호텔 선택--%>
        <div class="property">
            <div class="hotelselect">
                <span>PROPERTY *</span>
                <div class="qnahotel">호텔 선택</div>
                    <input type="hidden" value="" name="hotelname" id="hotelname">
                        <ul class="qnahotellist">
                            <li class="hotel_list" value="그랜드조선 서울">그랜드조선 서울</li>
                            <li class="hotel_list" value="그랜드조선 부산">그랜드조선 부산</li>
                            <li class="hotel_list" value="그랜드조선 제주">그랜드조선 제주</li>
                            <li class="hotel_list" value="그랜드조선 여수">그랜드조선 여수</li>
                            <li class="hotel_list" value="그랜드조선 속초">그랜드조선 속초</li>
                        </ul>
            </div>
        </div>

           <%--관련 문의--%>
           <div class="category">
               <div class="categoryselect">
                   <span>CATEGORY *</span>
                   <div class="qnacategory">카테고리 선택</div>
                   <input type="hidden" value="" name="category" id="category">
                   <ul class="categoryllist">
                       <li class="category_list" value="1">가입문의</li>
                       <li class="category_list" value="2">예약문의</li>
                       <li class="category_list" value="3">객실/패키지문의</li>
                       <li class="category_list" value="4">기타</li>
                   </ul>
               </div>
           </div>


        <div>
                예약번호
               <input type="text" name="resrevenum" class="form-control">
        </div>

            <div class="useday">
               이용한 날짜
               <input class="flatpickr flatpickr-input" type="date" name="useday">
            </div>

            <div class="qnasubject" >
                <span>*</span>제목
                <input type="text" name="subject" class="form-control">
            </div>

            <div>
                내용

                    <textarea name="content" class="form-control"></textarea>
            </div>

            <div class="qnaupload">
                파일첨부
                    <input type="file" name="photo" class="form-control" multiple>
            </div>

            <div>
                <span>*</span>성명

                <input type="text" name="qna_name" value="${memberDto.user_name}" class="form-control">
            </div>

            <div>
                <span>*</span>이메일
                <input type="text" name="qna_email" value="${memberDto.email}" class="form-control">
            </div>

            <div>
                <span>*</span>핸드폰번호
                <input type="text" name="qna_phone" value="${memberDto.phone}" class="form-control">
            </div>

            <div>
                    <button type="submit" class="">등록</button>
            </div>

    </form>
</div>

<script type="text/javascript">

    //호텔선택
    const select = document.querySelector('.hotelselect');
    const selected = select.querySelector('.qnahotel');
    const options = select.querySelector('.qnahotellist');

    selected.addEventListener('click', () => {
        if (options.style.display === 'none') {
            options.style.display = 'block';
        } else {
            options.style.display = 'none';
        }
    });

    options.addEventListener('click', (event) => {
        selected.textContent = event.target.textContent;
        options.style.display = 'none';
    });

    $(".hotel_list").click(function () {
        var selectedText = $(this).text();
        $("#hotelname").val(selectedText);
        options.style.display = 'none';
    });



</script>