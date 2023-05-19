<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2023-05-10
  Time: 10:55:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<table id="noticeTable" class="table">
    <caption>
        <button type="button" class="btn btn-secondary" onclick="showMdl(0,null,null);"><i class="bi bi-pencil-square" style="padding-right:8px;"></i>새 공지사항 작성</button>
    </caption>
    <thead>
    <tr>
        <th style="width:5%;">번호</th>
        <th style="width:70%">제목</th>
        <th>작성자</th>
        <%--        <th>count</th>--%>
        <th>작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="dto">
        <tr>
            <td>${dto.num}</td>
            <td>${dto.subject}</td>
            <td>${dto.writer}</td>
                <%--            <td>${dto.count}</td>--%>
            <td><fmt:formatDate value="${dto.writeday}" type="both"/> </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
<%--        ${page}--%>
        <td colspan="4">
            <c:if test="${page[0]>10}">
                <span class="pagenumber" onclick="Paging(${page[0]-1})">&lt;</span>
            </c:if>
            <c:forEach begin="${page[0]}" end="${page[2]}" var="i">
                <c:if test="${i<=page[3]}">
                    <c:if test="${i==page[1]}">
                        <span class="currpage pagenumber">${i}</span>
                    </c:if>
                    <c:if test="${i!=page[1]}">
                        <span class="pagenumber" onclick="Paging(${i})">${i}</span>
                    </c:if>
                </c:if>
            </c:forEach>
            <c:if test="${page[2]<page[3]}">
                <span class="pagenumber" onclick="Paging(${page[2]+1})">&gt;</span>
            </c:if>
        </td>
    </tr>
    </tfoot>
</table>
<div id="mdlBackground" style="display:none;">
    <div id="mdlContent">
        <form id="frmNotice" action="writeroom" method="post">
            <div id="mdlTitle" class="form-floating">
                <input type="text" name="subject" class="form-control" style="margin:0px;" placeholder="_">
                <label class="form-label">제목</label>
            </div>
            <div id="mdlBtnToolbar">
                <span id="btnModify">📝</span>
                &nbsp;&nbsp;
                <span id="btnSave" onclick="submitContents();">💾</span>
                &nbsp;&nbsp;
                <span id="btnDelete">🗑</span>
                &nbsp;&nbsp;
                <span onclick="dismissMdl(true);">✖</span>
            </div>
            <textarea name="content" id="mdltextarea" required="required" style="width: 100%; height: 700px; visibility: hidden;"></textarea>
            <div id="mdlViewPart"></div>
            <input type="hidden" id="frmNum" name="num">
            <input type="hidden" id="frmPhoto" name="photo">
        </form>
    </div>
</div>
<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">

    let oEditors;
    $('#noticeTable tbody').on('click','tr',(e)=>{
        readNotice(e.currentTarget.children[0].innerText);
    });

    function showMdl(num,defaultval,defaultphoto){
        $('#btnModify').hide();
        $('#frmNum').val(num);
        $('#frmPhoto').val(defaultphoto);
        $('#mdltextarea').val(defaultval);
        initEditor(defaultphoto);
        $('#mdlTitle input').val("").attr('readonly',false);
        $('#mdlBackground').fadeIn();
    }
    function readNotice(num){
        $.ajax({
            url:'/admin/notice/detail',
            data:{num:num},
            dataType:'json',
            success:(e)=>{
                $('#btnSave').hide();
                $('iframe').remove();
                $('#frmNum').val(e.num);
                $('#mdlTitle input').val(e.subject).prop('readonly',true);
                $('#mdltextarea').hide();
                //$('#mdltextarea').val(e.content);
                //initEditor(e.photo);
                $('#mdlViewPart').html(e.content).show();
                $('#mdlBackground').fadeIn();
                $('#btnModify').off('click').on({
                    'click':()=>{modifyNotice(e.num);}
                }).show();
                $('#btnDelete').off('click').on({
                    'click':()=>{deleteNotice(e.num);}
                }).show();
            }
        });
        $('#mdlBackground').fadeIn();
    }
    function deleteNotice(num){
        if(!confirm('삭제하시겠습니까? 되돌릴 수 없습니다.'))
            return;

        $.ajax({
            url:'/admin/notice/delete',
            type:'post',
            data:{num:num},
            dataType:'json',
            success:(e)=>{
                if(e){
                    alert('공지사항을 삭제하였습니다.');
                    Paging($($('.currpage')[0]).text());
                    dismissMdl(true);
                } else{
                    alert('삭제를 실패하였습니다.');
                }
            },
            error:(e)=>{
                alert(e);
            }
        });
    }
    function modifyNotice(num){
        $.ajax({
            url:'/admin/notice/detail',
            data:{num:num},
            dataType:'json',
            success:(e)=>{
                $('#mdlViewPart').hide().html('');
                $('#btnModify').hide();
                $('#btnSave').show();
                $('iframe').remove();
                $('#frmNum').val(e.num);
                $('#mdlTitle input').val(e.subject).prop('readonly',false);
                $('#mdltextarea').val(e.content).show();
                initEditor(e.photo);
                $('#mdlBackground').fadeIn();
                Paging($($('.currpage')[0]).text());
            }
        });
        $('#mdlBackground').fadeIn();
    }
    function dismissMdl(istrue){
        if(istrue || confirm('저장하지 않은 내용은 모두 사라집니다. 창을 닫으시겠습니까?')){
            $('#mdlBackground').fadeOut();
            $('iframe').remove();
            $('#mdltextarea').val('');
            $('#mdlViewPart').html('');
        }
    }
    function initEditor(defaultphoto){
        oEditors = [];
        nhn.husky.EZCreator.createInIFrame({

            oAppRef: oEditors,

            elPlaceHolder: "mdltextarea",

            sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
            fOnAppLoad : function(){
                if(defaultphoto!==undefined)
                    $.each(defaultphoto.split(","),(i,e)=>{
                        $('iframe').contents().find('#lst_img').append(
                            $('<option>').text(e)
                        );
                    });
            },
            fCreator: "createSEditor2",
            customParams:{folder:"notice"}

        });
    }
    //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
    function submitContents() {
        oEditors.getById["mdltextarea"].exec("UPDATE_CONTENTS_FIELD", [ ]);
        $('#frmPhoto').val($('iframe').contents().find('#lst_img option').map(function(){return $(this).text();}).get().join(','));
        if($('#frmNum').val().length==0) $('#frmNum').val(0);
        let data = $('#mdlContent form').serialize();

        try {
            $.ajax({
                url:'/admin/notice/write',
                type:'post',
                data:data,
                dataType:'json',
                success:(e)=>{
                    if(e>0){
                        alert('공지사항을 저장하였습니다.');
                        readNotice(e);
                        Paging($($('.currpage')[0]).text());
                        //dismissMdl(true);
                    } else{
                        alert('저장을 실패하였습니다.');
                    }
                },
                error:(e)=>{
                    alert(e);
                }
            });
            //$('#mdlContent form')[0].submit();
            // console.log(save);
        } catch(e) {
            console.log("err",e);
        }

    }
</script>

<style>
    #mdlTitle.form-floating>.form-control:not(:placeholder-shown)~label{
        transform:scale(0.75) translateY(0rem) translateX(0.1rem) !important;
    }
    #mdlTitle.form-floating>.form-control:focus:placeholder-shown~label{
        transform:scale(0.75) translateY(0rem) translateX(0.1rem) !important;
    }
    #mdlTitle.form-floating>.form-control{
        height: calc(2.5rem + 2px) !important;
        border:0px;
        background-color:transparent;
    }
    #mdlTitle.form-floating>label{
        top:initial !important;
        left:initial !important;
        width:initial !important;
        font-size: 1rem;
        font-weight:bolder;
    }
    #mdlTitle{
        position:absolute;
        background-color:#ecd2a9;
        font-size:1.5rem;
        top:0px;
        left:0px;
        right:0px;
        height:50px;
        padding-left:25px;
        padding-right:100px;
        display: flex;
        align-items: center;
    }

    #mdltextarea{
        height:100%;
    }
    #mdlBtnToolbar{
        position:absolute;
        margin:5px;
        top:5px;
        right:5px;
    }
    #mdlBtnToolbar span{
        cursor:pointer;
    }

    #mdlBackground{
        position:absolute;
        background-color:rgba(0,0,0,0.5);
        left:0;
        top:0;
        width:100vw;
        height:100vh;
        z-index:100;
        display:flex;
        /*visibility: hidden;*/
        justify-content: center;
        align-items: center;
    }
    #mdlContent{
        position:relative;
        background-color:white;
        border: 2px solid;
        border-radius: 0.875rem;
        width:50vw;
        height:90vh;
        padding:50px 25px 0px 25px;
        overflow-y: auto;
    }
    #noticeTable caption{
        caption-side: top;
    }
    .currpage{
        font-weight:bolder;
    }
    th {
        text-align: left;
    }

    thead {
        font-weight: bold;
        color: #fff;
        background: #73685d;
    }
    td, th {
        padding: 1em .5em;
        vertical-align: middle;
        text-align: center;
    }
    .pagenumber{
        /*border:1px solid;*/
        /*border-radius:0.875rem;*/
        padding:5px;
    }
    .pagenumber:hover{
        text-decoration: underline;
        cursor:pointer;
    }
    tbody tr:hover{
        background-color: rgba(136, 93, 54, 0.26);
        cursor:pointer;
    }
    td, th tr{
        /*font-size:.7rem;*/
        /*color:#5a5c69!important;*/
        /*font-weight: 700!important;*/
    }
    #noticeTable{
        width: 100%;
    }
</style>


<script>
    function Paging(page){
        $.ajax({
            url:'./notice/list/' + page,
            dataType:'json',
            success:(e)=>{
                $('#noticeTable tbody').empty();
                $.each(e[0],(i,e)=>{
                    $('#noticeTable tbody').append(
                        `<tr>
                            <td>\${e.num}</td>
                            <td>\${e.subject}</td>
                            <td>\${e.writer}</td>
<!--                            <td>\${e.count}</td>-->
                            <td>\${new Date(e.writeday).toLocaleString()}</td>
                        </tr>`
                    );
                });

                $('#noticeTable tfoot>tr>td').empty();
                if(e[1][0]>10)
                    $('#noticeTable tfoot>tr>td').append(`<span class='pagenumber' onclick='Paging(\${e[1][0]-1})'>&lt;</span> `);

                let pages = "";
                for(let idx=e[1][0];idx<=e[1][2];idx++){

                    if(idx==e[1][1])
                        pages+=`<span class="currpage pagenumber">\${idx}</span> `;
                    else
                        pages+=`<span class="pagenumber" onclick='Paging(\${idx})'>\${idx}</span> `;
                    if(idx>=e[1][3]) break;
                }
                $('#noticeTable tfoot>tr>td').append(pages);

                if(e[1][2]<e[1][3])
                    $('#noticeTable tfoot>tr>td').append(`<span class='pagenumber' onclick='Paging(\${e[1][2]+1})'>&gt;</span>`);
            }
        });
    }
    $(()=>{
        let search = location.search.substring(1);
        console.log(search);
        if(search.length < 1) return;
        let numstr = JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"').replace(/&/g, '","').replace(/=/g,'":"') + '"}');
        readNotice(numstr.num);
    });
    SetAdminTitle("공지사항");
</script>