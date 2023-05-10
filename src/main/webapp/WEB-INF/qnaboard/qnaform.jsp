<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
    .qnaboard table{
        position: absolute;
        top: 150px;
    }
</style>

<script type="text/javascript">
    const config = {
        enableTime: false,
        dateFormat: "Y-m-d",
    };

    flatpickr("input[type=datetime-local]", config);

    $(document).ready(function (){
        //초기값 (문의)

        $(".useday").hide();
        $(".qnaupload").hide();

        $("input[name='qnacategory']").change(function (){

            //문의 선택 시
            if($("input[name='qnacategory']:checked").val()=='문의'){
                $(".useday").hide();
                $(".qnaupload").hide();

            }

            //의견 선택 시
            else if ($("input[name='qnacategory']:checked").val()=='의견'){
                $(".useday").show();
                $(".qnaupload").show();
                $(".qnasubject").hide();
                $(".reserveno").hide();


            }
        });
    });

</script>


<div class="qnaboard">
    <form action="/insertqna" method="post" name="qnaboard">
        <table class="table table qnatable" style="width: 600px;">
            <tr>
                <td style="width: 250px;"><span>*</span>호텔</td>
                <td style="width: 350px;">
                    <div class="hotelselect">
                        <select name="hotelname">
                            <option value="그랜드조선 서울">그랜드조선 서울</option>
                            <option value="그랜드조선 부산">그랜드조선 부산</option>
                            <option value="그랜드조선 제주">그랜드조선 제주</option>
                            <option value="그랜드조선 여수">그랜드조선 여수</option>
                            <option value="그랜드조선 속초">그랜드조선 속초</option>
                        </select>

                        <input type="radio" name="qnacategory" value="문의" checked>문의
                        <input type="radio" name="qnacategory" value="의견">의견

                    </div>
                </td>
            </tr>

            <tr>
                <td style="width: 250px;"><span>*</span>관련문의</td>
                <td style="width: 350px;">
                    <select name="category" style="width: 200px;">
                        <option value="1">가입문의</option>
                        <option value="2">예약문의</option>
                        <option value="3">객실/패키지문의</option>
                        <option value="4">기타</option>
                    </select>
                </td>
            </tr>

            <tr class="reserveno">
                <td>예약번호</td>
                <td><input type="text" name="resrevenum"></td>
            </tr>

            <tr class="useday">
                <td>이용한 날짜</td>
                <td><input class="form-control flatpickr flatpickr-input" type="datetime-local"></td>
            </tr>

            <tr class="qnasubject">
                <td><span>*</span>제목</td>
                <td><input type="text" name="subject"></td>
            </tr>

            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content"></textarea>
                </td>
            </tr>

            <tr class="qnaupload">
                <td>파일첨부</td>
                <td>
                    <input type="file" name="qnafile">
                </td>
            </tr>

            <tr>
                <td><span>*</span>성명</td>
                <td>
                    <input type="text" name="qna_name" value="${memberDto.user_name}">
                </td>
            </tr>

            <tr>
                <td><span>*</span>이메일</td>
                <td><input type="text" name="qna_email" value="${memberDto.email}"> </td>
            </tr>

            <tr>
                <td><span>*</span>핸드폰번호</td>
                <td><input type="text" name="qna_phone" value="${memberDto.phone}"></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center">
                    <button type="submit">등록</button>
                </td>
            </tr>


        </table>

    </form>
</div>