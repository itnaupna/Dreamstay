<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .qnaboardlist {


    }

    .qnaboardlist a{
        text-decoration: none;
        color: #000;
    }

    .qnatr{
        /* background-color: #001100;*/
        color: black;
    }

    #qmalisttable{
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
        font-family: GmarketSansMedium;
    }

    #qmalisttable tr{
        height: 80px;
        border-bottom: 1px solid lightgray ;
        z-index: 10;

    }


    .qnaboardlist tr td {
        vertical-align: middle;
    }

    .qnatr{
        height: 80px !important;
        border-bottom: 3px solid lightgray !important;
    }

    .answerend{
        background-color: #001100;
        color: #fff;
        padding: 6px;
        border: 1px solid #001100;
        font-size: 15px;
    }

    .answerstart{
        color: #000;
        padding: 6px;
        border: 1px solid #001100;
        font-size: 15px;
    }

    .qnum{
        cursor: pointer;
    }

    .txtcenter{
        text-align: center;
    }

    .qnum{
        margin-left: 150px;
    }

    #findarticlediv .form-select{
        flex:initial;
    }

    /*Trigger Button*/
    .login-trigger {
        font-weight: bold;
        color: #fff;
        background: black;
        padding: 15px 30px;
        border-radius: 30px;
        position: relative;
        top: 65%;
    }

    /*Modal*/

    h5 {
        font-weight: bold;
        color: black;
    }
    .close {
        color: black;
        transform: scale(1.2);
        margin-left: 400px;
    }
    .modal-content {
        font-weight: bold;
       /* background: linear-gradient(to bottom right,#F87E7B,#B05574);*/
        background:white;
    }
    .form-control {
        margin: 1em 0;
    }
    .form-control:hover, .form-control:focus {
        box-shadow: none;
        border-color: white;
    }
    .password {
        border: none;
        border-radius: 0;
        box-shadow: none;
        border-bottom: 2px solid #eee;
        padding-left: 0;
        font-weight: normal;
        background: transparent;

    }

    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }

    .form-control::-webkit-input-placeholder {
        color: black;
    }
    .form-control:focus::-webkit-input-placeholder {
        font-weight: bold;
        color: lightgray;
    }
    .login {
        padding: 6px 20px;
        border-radius: 20px;
        background: black;
        border: 2px solid white;
        color: white;
        font-weight: bold;
        transition: all .5s;
        margin-top: 1em;
    }
    .login:hover {
        background: white;
        color: black;
        border: 1px solid black;
    }

    .qnaform_all{
        font-family: GmarketSansMedium;
    }

    .customer_text .maintext{
        font-size: 60px;
        font-family: "Playfair Display SC" !important;
    }

    .customer_text .subtext{
        font-size: 18px;
    }

    #QnaPassModal{
        font-family: GmarketSansMedium;
    }

    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }

    .suball{
        font-family: GmarketSansMedium;
    }

    .suball a{
        text-decoration: none;
        color: black;
    }
</style>


<a class="login-trigger" href="#" data-target="#QnaPassModal" data-toggle="modal">Login</a>

<div id="QnaPassModal" class="modal fade" role="dialog" style="position: absolute; top: 250px;">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-body">
                <%--<button data-dismiss="modal" class="close">&times;</button>--%>
                <h5>password</h5>
                <form>
                    <input type="password" name="qna_pass" class="password form-control" placeholder="비밀번호를 입력하세요"/>
                    <input class="btn login" id="passbtn" type="submit" value="확인" />
                </form>
            </div>
        </div>
    </div>
</div>


<div class="qnaform_all">
    <div class="customer_text" style="margin: 157px 0px 0px 120px;">
        <span class="maintext">Customer Service</span><br><br>
        <span class="subtext">드림스테이는 언제나 고객의 목소리에 귀기울이고 있습니다.</span><br>
        <span class="subtext">소중한 충고와 격려, 또는 제안의 말씀을 남겨 주시면 최대한 반영하여 더 나은 서비스로 보답하겠습니다.</span>
    </div>
</div>

<div class="suball" style="display: flex; margin: 0px 0px 0px 120px;">
    <div class="side" style="/*border: 1px solid black;*/ width: 320px; height: 500px; margin-top: 50px;">
        <div style="background-color: #F9F9F9; width: 310px; height: 250px;margin-top: 10px; /*border: 2px solid green;*/">
            <div style="font-size: 19px; left: 40px; /*border: 2px solid blue;*/ position: relative; top: 70px;">
                <a href="/qnaboard">
                    <span style="display: block; margin-bottom: 9px;">Q&A</span>
                </a>
                <a href="/mypage/qnalist">
                <span style="display: block; margin-bottom: 9px;">문의내역 조회</span>
                </a>
                <a href="/qnanomemberlist">
                    <strong><span style="display: block; margin-bottom: 9px;">비회원 문의</span></strong>
                </a>
            </div>
        </div>
    </div>

<div class="qnaboardlist" style="margin:60px 0px 0px 60px;">
    <%--<span>Customer Service</span>--%>
    <table class="table table" id="qmalisttable">
        <thead>
        <tr class="qnatr">
            <td style="width: 250px" class="txtcenter">호텔</td>
            <td style="width: 600px;  margin-left: 150px;"><span style="margin-left: 150px;">제목</span></td>
            <td style="width: 200px" class="txtcenter">작성자</td>
            <td style="width: 200px" class="txtcenter">답변상태</td>
            <td style="width: 200px" class="txtcenter">작성일</td>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${qnaBoardList}" var="qnaBoardDto">

            <td class="txtcenter">${qnaBoardDto.hotelname}</td>
            <td>
                <a data-value="${qnaBoardDto.num}" class="qnum" data-bs-toggle="modal" data-bs-target="#QnaPassModal" >
                    <span style="color: #989442">${qnaBoardDto.category_txt}</span>
                    <span class="qnadetail" data-num="${qnaBoardDto.num}">
                         ${qnaBoardDto.subject}
                        <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/lock.png" style="width: 13px; height: 13px;">
                    </span>
                </a>
            </td>
            <td class="txtcenter">${qnaBoardDto.qna_name}</td>
            <c:if test="${qnaBoardDto.answer=='답변대기'}">
                <td class="txtcenter"><span class="answerstart">${qnaBoardDto.answer}</span></td>
            </c:if>
            <c:if test="${qnaBoardDto.answer=='답변완료'}">
                <td class="txtcenter"><span class="answerend">${qnaBoardDto.answer}</span></td>
            </c:if>
            <td class="txtcenter"><fmt:formatDate value="${qnaBoardDto.writeday}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>

        </c:forEach>
        </tbody>

        <tfoot>
        </tfoot>

    </table>

    <br>
    <!-- 페이징 처리 -->
        <input type="hidden" name="totalPage" value="${totalPage}">
        <input type="hidden" name="startPage" value="${startPage}">
        <input type="hidden" name="endPage" value="${endPage}">
        <input type="hidden" name="currentPage" value="${currentPage}">

    <div class="pagination" style="width: 100%;text-align: center;font-size: 17px; margin-left: 700px;">
        <!-- 이전 -->
        <c:if test="${startPage>1}">
            <a style="color:black;text-decoration: none;cursor: pointer;"
               href="./qnanomemberlist?currentPage=${startPage-1}">이전</a>
        </c:if>
        &nbsp;
        <!-- 페이지번호 출력 -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${currentPage==pp}">
                <a style="color:#989442;text-decoration: none;cursor: pointer;"
                   href="./qnanomemberlist?currentPage=${pp}">${pp}</a>
            </c:if>
            <c:if test="${currentPage!=pp}">
                <a style="color:black;text-decoration: none;cursor: pointer;"
                   href="./qnanomemberlist?currentPage=${pp}">${pp}</a>
            </c:if>
            &nbsp;
        </c:forEach>
        <!-- 다음 -->
        <c:if test="${endPage<totalPage}">
            <a style="color:black;text-decoration: none;cursor: pointer;"
               href="list?currentPage=${endPage+1}">다음</a>
        </c:if>
    </div>

</div>
</div>

<br>
<div id="findarticlediv" class="input-group" style="left: 48%; width: 500px; display: flex">
        <select name="searchtype" id ="q_searchtype" class="form-select" style="width:100px; height: 40px;">
            <option name="title" value="title" selected>제목</option>
            <option name="content" value="content">내용</option>
            <option name="qna_name" value="qna_name">작성자</option>
        </select>
        <input type="text" id="q_keyword" name="keyword" value="" >
        <button type="button" id="searchbutton" class="searchbutton">검색</button>
</div>


<script type="text/javascript">

        // 검색 버튼 클릭 이벤트 처리
        $('#searchbutton').click(function () {

            // 검색어 가져오기
            var keyword = $('#q_keyword').val();
            var searchtype = $('#q_searchtype').val();

            if(keyword=='' || keyword==null)
            {
                alert("검색어를 입력해주세요");
                return false;
            }

            // AJAX 요청 보내기
            $.ajax({
                url: './searchQna',
                type: 'POST',
                data: {
                    keyword: keyword,
                    searchtype: searchtype
                },
                success: function (result) {
                    /*console.log(result);*/
                    // 검색 결과를 테이블에 추가
                    var tableBody = $('#qmalisttable tbody');
                    tableBody.empty(); // 기존 내용 삭제

                    if (result.length === 0) {
                        tableBody.append('<tr><td colspan="4" style="text-align: center">검색된 게시물이 없습니다.</td></tr>');
                    } else {
                        $.each(result, function (index, item) {
                            var date = new Date(item.writeday);
                            var year = date.getFullYear();
                            var month = String(date.getMonth() + 1).padStart(2, '0');
                            var day = String(date.getDate()).padStart(2, '0');
                            var hours = String(date.getHours()).padStart(2, '0');
                            var minutes = String(date.getMinutes()).padStart(2, '0');
                            var formattedDate = `\${year}-\${month}-\${day} \${hours}:\${minutes}`;

                            var row = `<tr>
                                        <td class="txtcenter">\${item.hotelname}</td>
                                        <td class="txt">
                                            <a  class="qnum" data-value="\${item.num}" data-bs-toggle="modal" data-bs-target="#QnaPassModal">
                                                <span style="color: #989442">\${item.category==1?"[가입문의]":item.category==2?"[예약문의]":item.category==3?"[객실문의]":"[기타]"}</span>
                                                <span class="qnadetail">\${item.subject}</span>
                                            <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/lock.png" style="width: 13px; height: 13px;">
                                            </a>
                                        </td>
                                        <td class="txtcenter">\${item.qna_name}</td>
                                        <td class="txtcenter">\${item.answer=="답변완료"?"<span class='answerend'>답변완료</span>":"<span class='answerstart'>답변대기</span>"}</td>
                                        <td class="txtcenter">\${formattedDate}</td>
                                        </tr>`;
                            tableBody.append(row);

                            // 페이징 업데이트
                            var paging = $('.pagination');
                            paging.empty();

                            var totalPage = $("input[name=totalPage]").val();
                            var currentPage = $("input[name=currentPage]").val();
                            var startPage = $("input[name=startPage]").val();
                            var endPage = $("input[name=endPage]").val();

                           /* alert(totalpage);*/

                            if (totalPage> 0) {
                                for (var pp = startPage; pp < endPage; pp++) {
                                   /* alert(pp);*/
                                    var pageLink;
                                    if (currentPage === pp) {
                                        pageLink = '<a style="color:#989442;text-decoration: none;cursor: pointer;" href="./qnanomemberlist?currentPage=' + pp + '">' + pp + '</a>';
                                    } else {
                                        pageLink = '<a style="color:black;text-decoration: none;cursor: pointer;" href="./qnanomemberlist?currentPage=' + pp + '">' + pp + '</a>';
                                    }
                                    paging.append(pageLink + '&nbsp;');
                                }
                            }


                        });
                    }
                }
            });
        });

    $('input[name="keyword"]').on({
        'keydown':(e)=>{
            if(e.keyCode==13){
                $('#searchbutton').click();
            }
        }
    });

        $(function () {
            $(document).on("click", ".qnum", function () {
                var num = $(this).data("value");
                // 저장해 둔 num 값을 사용하여 비밀번호 확인 버튼 클릭 이벤트 핸들러 등록
                $("#passbtn").off("click").on("click", function () {
                    var qna_pass = $("input[name='qna_pass']").val();

                    $.ajax({
                        type: "get",
                        url: "./qnapass",
                        data: { "num": num, "qna_pass": qna_pass },
                        dataType: "json",
                        success: function (res) {
                            if (res.result == 'success') {
                                // 비밀번호가 맞는 경우 페이지 이동
                                location.href = './qnanodetail?num=' + num;
                            } else {
                                // 비밀번호가 틀린 경우 알림 메시지 출력
                                alert('비밀번호가 일치하지않습니다');
                                // 모달 창 요소 초기화
                                $("input[name='qna_pass']").val("");
                                // 모달 창 닫기
                                $("#QnaPassModal").modal("hide");
                            }
                        }
                    });
                });
            });

            // 모달 창 열릴 때 이벤트 핸들러
            $('#QnaPassModal').on('show.bs.modal', function () {
                // 모달 창 열릴 때 input 초기화
                $("input[name='qna_pass']").val("");
            });
        });



</script>