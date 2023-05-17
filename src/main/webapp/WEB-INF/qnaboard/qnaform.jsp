<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
    .qnaboard {
        /*border: 1px solid red;*/
        height: 1400px;
    }

    .custom-select1,
    .custom-select2 {
        position: relative;
        margin-top: 30px;
        /*margin-left: 100px;*/
        /*border: 1px solid blue;*/
    }

    .selected1,
    .selected2 {
        width: 400px;
        margin-top: 5px;
    }

    .custom-select1 span,
    .custom-select2 span {
        margin-right: 30px;
    }

    .selected1,
    .selected2 {
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

    .options1,
    .options2 {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background-color: white !important;
        border: 1px solid #ddd;
        border-top: none;
        padding: 0;
        margin: 0;
        list-style: none;
        display: none;
        overflow-y: scroll;
        max-height: 150px;
        z-index: 11;
    }

    .options1 li,
    .options2 li {
        padding: 5px;
        cursor: pointer;
    }

    .options1 li:hover,
    .options2 li:hover {
        background-color: white;
    }

    .selectli1,
    .selectli2 {
        /*border: 1px solid red;*/
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        width: 926px;
    }

    .show {
        display: block;
    }

    .qnaboard_main_title span {
        font-family: 'Playfair Display SC', serif;
        font-size: 50px;
    }

    .qnaboard_main_content,
    .qnaboard_main_content2,
    .qnaboard_main_content3,
    .qnaboard_main_content4,
    .qnaboard_main_content5{
        /*border: 1px solid pink;*/
        margin-top: 50px;
    }

    .qnaboard_main_content input[type=text] {
        border: none;
        border-bottom: 1px solid #ccc;
        width: 100%;
        margin-top: 10px;
    }

    .qnaboard_main_content input[type=text]:focus {
        outline: none;
    }

    .qnaboard_main_content2 {
        width: 100%;
        height: 100px;
    }

    .qnaboard_main_content2 textarea{
        width: 1000px;
        height: 100px;
        border: none;
        border-bottom: 1px solid #ccc;
        margin-top: 20px;
    }

    .qnaboard_main_content3_subject input[type=text]{
        border: none;
        border-bottom: 1px solid #ccc;
    }

    /* span 태그 위 간격 조절 */
    .qnaboard_main_content3 input[type=text],
    .qnaboard_main_content4 input[type=text],
    .qnaboard_main_content5 input[type=text]{
        margin-top: 10px;
        border: none;
        border-bottom: 1px solid #ccc;
        width: 400px;
        height: 30px;
    }

    .qnaboard_main_content3 input[type=text]:focus,
    .qnaboard_main_content4 input[type=text]:focus,
    .qnaboard_main_content5 input[type=text]:focus{
        outline: none;
    }

    .qnaboard_btn{
        margin-top: 50px;
    }

    .qnaboard_btn .submit_btn{
        border: none;
        background-color: black;
        width: 200px;
        height: 60px;
        color: white;
    }

    .qnaboard_btn .submit_btn:hover{
        background-color: white;
        color: black;
        box-shadow: -3px 3px 10px 0px rgba(0, 0, 0, 0.55);
    }

    /* imaged preview */
    .filebox .upload-display {  /* 이미지가 표시될 지역 */
        margin-bottom: 5px;
    }

    @media(min-width: 768px) {
        .filebox .upload-display {
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 0;
        }
    }

    .filebox .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
        display: inline-block;
        width: 54px;
        padding: 2px;
        vertical-align: middle;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #fff;
    }

    .filebox .upload-display img {  /* 추가될 이미지 */
        display: block;
        max-width: 100%;
        width: 100% \9;
        height: auto;
    }

</style>

<script type="text/javascript">
    const config = {
        enableTime: false,
        dateFormat: "Y-m-d"
    };

    flatpickr("input[type=date-local]", config);

    $(document).ready(function () {
        //초기값 (문의)

        $(".useday").hide();
        $(".filebox preview-image").hide();

        $("input[name='qna_type']").change(function () {

            //문의 선택 시
            if ($("input[name='qna_type']:checked").val() == '문의') {
                $(".useday").hide();
                $(".filebox preview-image").hide();

            }

            //의견 선택 시
            else if ($("input[name='qna_type']:checked").val() == '의견') {
                $(".useday").show();
                $(".filebox preview-image").show();
                $(".reserveno").hide();
            }
        });
    });

    // 호텔 선택
    const select1 = document.querySelector('.custom-select1');
    const selected1 = select1.querySelector('.selected1');
    const options1 = select1.querySelector('.options1');

    selected1.addEventListener('click', () => {
        options1.classList.toggle('show');
    });

    options1.addEventListener('click', (event) => {
        selected1.textContent = event.target.textContent;
        options1.classList.remove('show');
    });

    // 문의 선택
    const select2 = document.querySelector('.custom-select2');
    const selected2 = select2.querySelector('.selected2');
    const options2 = select2.querySelector('.options2');

    selected2.addEventListener('click', () => {
        options2.classList.toggle('show');
    });

    options2.addEventListener('click', (event) => {
        selected2.textContent = event.target.textContent;
        options2.classList.remove('show');
    });

    // 파일 선택 값 input에 넣기
    $("#file").on('change',function(){
        var fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });

    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
        }
    });

</script>


<div class="qnaboard">
    <div class="qnaboard_full">
        <form action="/insertqna" method="post" name="qnaboard" enctype="multipart/form-data">
            <div class="qnaboard_top">
                <input type="radio" name="qna_type" value="문의" checked>문의
                <input type="radio" name="qna_type" value="의견">의견
                <div class="qnaboard_main_title">
                    <span>Q & A</span>
                </div>
            </div>
            <div class="selectli1">
                <div class="custom-select1">
                    <span>* 호텔</span>
                    <div class="selected1">호텔선택</div>
                    <ul class="options1">
                        <li class="options1_list">그랜드조선 서울</li>
                        <li class="options1_list">그랜드조선 부산</li>
                        <li class="options1_list">그랜드조선 제주</li>
                        <li class="options1_list">그랜드조선 여수</li>
                        <li class="options1_list">그랜드조선 속초</li>
                    </ul>
                </div>
            </div>

            <div class="selectli2">
                <div class="custom-select2">
                    <span>* 관련문의</span>
                    <div class="selected2">관련문의</div>
                    <ul class="options2">
                        <li class="options2_list">가입문의</li>
                        <li class="options2_list">예약문의</li>
                        <li class="options2_list">객실/패키지문의</li>
                        <li class="options2_list">기타</li>
                    </ul>
                </div>
            </div>

            <div class="qnaboard_main_content">
                <span>TITLE *</span>
                <div class="qnaboard_main_content_subject">
                    <input type="text" id="subject" name="subject" class="subject">
                </div>
            </div>

            <div class="useday" id="qnaboard_sub_content1">
                <input type="date" name="useday" class="flatpickr flatpickr-input">
            </div>

            <div class="filebox preview-image" id="qnaboard_sub_content2">
                <input class="upload-name" value="파일선택" disabled="disabled" >

                <label for="input-file">업로드</label>
                <input type="file" id="input-file" class="upload-hidden">
            </div>

            <div class="qnaboard_main_content2">
                <span>CONTENT *</span>
                <div class="qnaboard_main_content2_subject">
                    <textarea name="content" class="content" placeholder="불건전한 내용(예: 개인정보보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방 등) 또는 광고성 게시물은 사전 통보없이 삭제 처리될 수 있으며, 등록된 의겨은 수정이 불가능하오니이 점 양지하여 주시기 바랍니다"></textarea>
                </div>
            </div>

            <div class="qnaboard_main_content3">
                <span>NAME *</span>
                <div class="qnaboard_main_content3_subject">
                    <input type="text" name="qna_name" value="${familyname}${firstname}" class="qna_name">
                </div>
            </div>

            <div class="qnaboard_main_content4">
                <span>EMAIL *</span>
                <div class="qnaboard_main_content4_subject">
                    <input type="text" name="qna_email" value="${memberDto.email}" class="qna_email">
                </div>
            </div>

            <div class="qnaboard_main_content5">
                <span>PHONE *</span>
                <div class="qnaboard_main_content5_subject">
                    <input type="text" name="qna_phone" value="${memberDto.phone}" class="qna_phone">
                </div>
            </div>

            <div class="qnaboard_btn">
                <button type="submit" class="submit_btn">등록</button>
            </div>
        </form>
    </div>
</div>