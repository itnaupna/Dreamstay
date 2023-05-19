<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .qnaboardlist {
        position: absolute;
        top: 80px;
        width: 100% !important;
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
        flex:initial !important;
    }
</style>


</style>



<!-- The Modal -->
<div class="modal" id="QnaPassModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Modal Heading</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="height: 200px;">
                비밀번호를 입력해주세요
                <input type="password" name="qna_pass" class="form-control">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="passbtn">확인</button>
                <button type="button" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>



<div class="qnaboardlist">
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
                <td><span class="answerstart">${qnaBoardDto.answer}</span></td>
            </c:if>
            <c:if test="${qnaBoardDto.answer=='답변완료'}">
                <td><span class="answerend">${qnaBoardDto.answer}</span></td>
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
    <div  style="width: 100%;text-align: center;font-size: 17px; ">
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


<div id="findarticlediv" class="input-group" style="position: absolute; top:600px; width: 300px;">
        <select name="searchtype" id ="q_searchtype" class="form-select" style="width:100px;">
            <option name="title" value="title" selected>제목</option>
            <option name="content" value="content">내용</option>
            <option name="qna_name" value="qna_name">작성자</option>
        </select>
        <input type="text" id="q_keyword" name="keyword" value="" class="form-control">
        <button type="button" id="searchbutton" class="searchbutton">검색</button>
</div>


<script type="text/javascript">

    $(function () {
        $(".qnum").click(function () {
            var num = $(this).data("value");
            // 저장해 둔 num 값을 사용하여 비밀번호 확인 버튼 클릭 이벤트 핸들러 등록
            $(".passbtn").off("click").on("click", function () {
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


        // 검색 버튼 클릭 이벤트 처리
        $('#searchbutton').click(function () {

            // 검색어 가져오기
            var keyword = $('#q_keyword').val();
            var searchtype = $('#q_searchtype').val();

            // AJAX 요청 보내기
            $.ajax({
                url: './searchQna',
                type: 'POST',
                data: {
                    keyword: keyword,
                    searchtype: searchtype
                },
                success: function (result) {
                    console.log(result);
                    // 검색 결과를 테이블에 추가
                    var tableBody = $('#qmalisttable tbody');
                    tableBody.empty(); // 기존 내용 삭제

                    if (result.length === 0) {
                        tableBody.append('<tr><td colspan="4">검색된 게시물이 없습니다.</td></tr>');
                    } else {
                        $.each(result, function (index, item) {
                            var row = '<tr>' +
                                '<td>' + item.hotelname + '</td>';
                            tableBody.append(row);
                        });
                    }
                },
                error: function () {
                    // 오류 처리
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


</script>