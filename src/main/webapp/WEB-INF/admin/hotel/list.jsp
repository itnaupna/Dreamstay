<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<%--<script type="text/javascript" src="/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>--%>
<div id="partHotel">
  <div id="toolbarHotel">
    <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/icon_add.png" onclick="if(confirm('신규 호텔을 등록하시겠습니까?'))ClickAddHotelBtn();">
    <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/icon_detail.png" onclick="$('#detailHotel').toggle(200);loadHotel(-1);">
  </div>
  <c:forEach items="${hDto}" var="dto">
    <div class="itemHotel" onclick="loadHotel(${dto.num})">
      <div class="thumbsHotel">
        <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/${dto.photo}?type=f&w=80&h=80">
      </div>
      <div class="summaryHotel">
        <div class="minititleHotel">
          호텔명: ${dto.name}
        </div>
        <div class="miniaddressHotel">
          주소: ${dto.addr}
        </div>
      </div>
    </div>
  </c:forEach>
</div>
<div id="partRoom">
  <div id="lstRoomTitle">
    호텔을 선택하세요.
  </div>
  <div id="lstRoomWrapper">
    <div id="detailHotel" style="display:none;">
      <form id="formHotel" enctype="multipart/form-data">
        <input type="hidden" name="num" id="detailHotelNum">
        <table class="table table-bordered">
          <caption style="font-size:0.8rem;caption-side: top;">
            <span style="float:left;">
              <span class="spanbtn"  onclick="if(confirm('Save the modify value?'))updateHotel();">저장</span>
              <span class="spanbtn" onclick="$('#detailHotel').hide(200);">취소</span>
            </span>
            <span style="float:right;">값을 수정하려면 더블클릭하세요.</span>
          </caption>
          <tr>
            <td rowspan="3" style="width:160px;vertical-align: middle;">
              <img src="" id="detailHotelImg" style="width:160px;height:120px;" onclick="changePhoto();">
              <input type="file" name="file" style="display:none" accept="image/*">
            </td>
            <td id="detailHotelName">
              <div class="form-floating">
                <input type="text" class="form-control" name="name" placeholder="_" readonly required>
                <label class="form-label">이름</label>
              </div>
            </td>
          </tr>
          <tr>
            <td id="detailHotelAddr">
              <div class="form-floating">
                <input type="text" class="form-control" name="addr" placeholder="_" readonly required>
                <label class="form-label">주소</label>
              </div>
            </td>
          </tr>
          <tr>
            <td id="detailHotelPhone">
              <div class="form-floating">
                <input type="text" class="form-control" placeholder="_" name="phone" readonly>
                <label class="form-label">연락처</label>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="2" id="detailHotelMemo">
              <div class="form-floating">
                <textarea class="form-control" placeholder="_" name="memo" readonly></textarea>
                <label class="form-label">추가설명</label>
              </div>
            </td>
          </tr>
        </table>
      </form>
    </div>
    <div id="lstRoom">
      <div id="summaryRoom">
        <%--
        호텔별 방 현황 요약
        방 전체 표시
        추가 할수도 있는것들 : 오늘날짜에 사용중인 방, 예약잡힌 방, 예약이 잡히지 않은 방 등등...
         --%>
        <span>등록된 객실 : <span id="summaryRoomTotal">999</span></span>
        <span>가용 객실 : <span id="summaryRoomCurrent">999</span></span>
        <span>미사용 객실 : <span id="summaryRoomReservation">999</span></span>
        <span  class="spanbtn" id="addRoom" onclick="$('#formRoom').show(200);$('#detailHotel').hide(200);">추가</span>
        <!--Remain : <span id="summaryRoomRemain"></span>-->
      </div>
      <form id="formRoom" style="display:none;">
        <table class="table" style="width:100%">
          <caption style="caption-side: top;">
            <label>
              <input type="checkbox" name="islock"> 미사용 객실
            </label>
            <span style="float:right;">내용을 입력하려면 필드를 더블클릭하세요.</span>

          </caption>
          <tr>
            <td colspan="2" style="width:50%;">
              <div class="form-floating">
                <input id="roomtype" type="text" class="form-control" name="roomtype" placeholder="_" list="roomtypedatalist" required readonly>
                <label class="form-label">객실 타입</label>
                <datalist id="roomtypedatalist">
                  <option>Eong</option>
                </datalist>
              </div>
            </td>
            <td colspan="2" style="width:50%;">
              <div class="form-floating">
                <input type="number" class="form-control" name="roomprice" placeholder="_" required readonly>
                <label class="form-label">1박 요금</label>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="3" style="width:75%;">
              <div class="form-floating">
                <input type="text" class="form-control" name="roommemo" placeholder="_" readonly>
                <label class="form-label">객실 설명</label>
              </div>
            </td>
            <td style="width:25%;vertical-align: middle">
              <div style="display:flex;justify-content: space-around">
                <span class="spanbtn" onclick="UploadRoom();">저장</span>
                <span  class="spanbtn" onclick="$('#formRoom').hide(200);">취소</span>
              </div>
            </td>
          </tr>
        </table>
      </form>

      <div id="lstRoomItems" style="margin:5px 0px;">
        <table style="width:100%;table-layout: fixed;" class="table">
          <thead>
          <tr style="background-color:#e9ddb8">
            <th style="width:20%;">객실타입</th>
            <th style="width:15%;">1일요금</th>
            <th style="width:45%;">객실 설명</th>
            <th style="width:20%;">상세정보</th>
          </tr>
          </thead>
          <tbody>

          <%--          <tr>--%>
          <%--            <td>TypeEong</td>--%>
          <%--            <td>1,500,000</td>--%>
          <%--            <td>애옹이들이 애옹하는 객실입니다. 정말 편안하고 즐거운 객실이죠.</td>--%>
          <%--            <td>상세정보 삭제</td>--%>
          <%--          </tr>--%>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<div id="mdlBackground" style="display:none;">
  <div id="mdlContent">
    <form action="writeroom" method="post">
      <div id="mdlTitle">
        아기다리고기다리던 888번 객실 상세정보
      </div>
      <div id="mdlBtnToolbar">
        <span onclick="submitContents();">
          💾
        </span>
        &nbsp;&nbsp;
        <span onclick="dismissMdl();">
          ✖
        </span>
      </div>
      <textarea name="roomdetail" id="mdltextarea" required="required" style="width: 100%; height: 700px; visibility: hidden;"></textarea>
      <input type="hidden" id="frmNum" name="num">
      <input type="hidden" id="frmHotelNum" name="hotelnum">
      <input type="hidden" id="frmRoomPhoto" name="roomphoto">
    </form>
    <!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
    <script type="text/javascript">
      let oEditors;
      function showMdl(num,hotelnum,roomdetail,roomphoto){

        $('#frmNum').val(num);
        $('#frmHotelNum').val(hotelnum);
        $('#frmRoomPhoto').val(roomphoto);
        initEditor(roomdetail,roomphoto);
        $('#mdlTitle').text(num+"번 객실 상세정보");
        $('#mdlBackground').fadeIn(0.3);

      }
      function dismissMdl(istrue){
        if(istrue || confirm('저장하지 않은 내용은 모두 사라집니다. 창을 닫으시겠습니까?')){
          $('#mdlBackground').fadeOut(0.3);
          $('iframe').remove();
          $('#mdltextarea').val('');
        }
      }
      function initEditor(roomdetail,roomphoto){
        $('#mdltextarea').val(roomdetail);
        oEditors = [];
        nhn.husky.EZCreator.createInIFrame({

          oAppRef: oEditors,

          elPlaceHolder: "mdltextarea",

          sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
          fOnAppLoad : function(){
            //로드가 완료되면?
            //roomphoto가 null이 아니면 값을 넣어준다.
            console.log("로딩완료?");
            console.log(roomphoto);

            if(roomphoto!==undefined)
              $.each(roomphoto.split(","),(i,e)=>{
                $('iframe').contents().find('#lst_img').append(
                        $('<option>').text(e)
                );
              });
          },
          fCreator: "createSEditor2"

        });
      }
      //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
      function submitContents() {
        oEditors.getById["mdltextarea"].exec("UPDATE_CONTENTS_FIELD", [ ]);
        $('#frmRoomPhoto').val($('iframe').contents().find('#lst_img option').map(function(){return $(this).text();}).get().join(','));
        let data = $('#mdlContent form').serialize();
        try {
          $.ajax({
            url:'writeroom',
            type:'post',
            data:data,
            dataType:'json',
            success:(e)=>{
              if(e){
                alert('객실 상세정보를 저장하였습니다.');
                dismissMdl(true);
              } else{
                alert('객실 상세정보 작성을 실패하였습니다.');
              }
            }
          });
          //$('#mdlContent form')[0].submit();
          // console.log(save);
        } catch(e) {
          console.log("err",e);
        }

      }
    </script>
  </div>
</div>

<style>
  #mdlTitle{
    position:absolute;
    background-color:#ecd2a9;
    font-size:1.5rem;
    top:0px;
    left:0px;
    right:0px;
    height:50px;
    padding-left:25px;
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
  #lstRoomItems > table > tbody > tr:hover{
    background-color: rgba(243, 219, 190, 0.74);
    /*cursor:pointer;*/
  }
  #lstRoomItems>table td{
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    text-align: center;
  }
  #lstRoomItems>table th{
    text-align: center;
  }
  #detailHotelImg{
    border:1px solid;
  }
  /*table caption span:first-child:hover{*/
  /*  text-decoration: underline;*/
  /*  cursor:pointer;*/
  /*}*/
  #toolbarHotel {
    position: absolute;
    top: 0px;
    right: 0px;
    background-color: #efedea;
    padding:5px;
    border-bottom-left-radius: 5px;
  }
  #toolbarHotel>img{
    width:24px;
    height:24px;
    cursor:pointer;
  }
  #toolbarHotel>img:hover{
    width:26px;
    height:26px;
    transition: all ease 0.2s;
  }
  #lstRoomTitle{
    margin: -15px 0px 10px -15px;
    padding:5px;
    font-size: 1.5rem;
    background-color: #ecd2a9;
    width:calc(100% + 30px);
    height:3rem;
    text-align: center;
  }
  .thumbsHotel{
    width: 80px;
    height:80px;
    border:1px solid #e3dddd;
    border-radius: 0.825rem;
    margin-right:10px;
  }
  .thumbsHotel>img{
    width: 100%;
    height: 100%;
    border-radius: inherit;
  }
  .adminmain{
    display:inline-flex;
    justify-content: left;
  }
  .itemHotel{
    border-radius: 0.825rem;
    border-left: 0.25rem solid rgba(219,195,150,0.48) !important;
    box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15) !important;
    transition: box-shadow 0.1s ease;
    padding:10px;
    width:100%;
    height:100px;
    display:inline-flex;
    margin-bottom:10px;
    align-items: center;

  }
  .itemHotel:hover{
    box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.9) !important;
    cursor: pointer;
  }
  #partHotel,#partRoom{
    border-radius:0.825rem;
    border:0.25rem solid #dbc396 !important;
    padding:15px;
    overflow-y:auto;
    width:45%;
    height:100%;
    position:relative;
    overflow-x:hidden;
  }
  #partHotel{
    margin-right:10px;
  }
  #partRoom table input,#partRoom table textarea{
    border:none !important;
    outline:none !important;
    padding:0px;
    resize:none;
  }
  #partRoom table input:focus:read-only, #partRoom table textarea:focus:read-only{
    box-shadow: none !important;

  }
  #partRoom table input:focus:not(:read-only),#partRoom table textarea:focus:not(:read-only){
    box-shadow: 0 0 5px rgb(152,129,34) !important;

  }
  #lstRoomItems tr{
    /*max-height:41px;*/
    height:47px;
    vertical-align: middle;
  }

  #summaryRoom {
    display:flex;
    justify-content: space-between;
    background-color: #e7e7e7;
    padding:10px;
    border-radius: 0.375rem;
  }

  #addRoom {
    font-size:0.8rem;
  }
  .spanbtn {
    cursor:pointer;
    text-decoration: underline;

  }
  .spanbtn:hover{
    font-weight: bolder;
  }
  #partRoom marquee{
    background-color:transparent !important;
    /*font-size:.7rem;*/
  }
  .summaryHotel, #partRoom{
    /*font-size:.7rem;*/
    /*color:gray;*/
    /*font-weight: 700 !important;*/
  }
</style>
<script>
  $('#lstRoomItems tbody')
          .on('mouseenter','tr',(e)=>{
            let dest = $($($(e.target).parent()).children()[2]);
            let tmp = dest.text();
            let c = dest.clone().css({display:'inline',width:'auto',visibility:'hidden',position:'absolute'}).appendTo('body');
            if(c.width() > dest.width())
              dest.html('<marquee behavior="alternate" scrollamount="5" class="form-control" style="border:none;margin:0px;padding:0px;">'+tmp+'</marquee>');
            c.remove();
          })
          .on('mouseleave','tr',(e)=>{
            let dest = $($($(e.target).parent()).children()[2]);
            let tmp = dest.text();
            dest.html(tmp);
          });
  $('#roomtype').on({
    'dblclick':(e)=>{
      $('#roomtypedatalist').empty().append($('<option/>').text('기존 객실 타입 검색 중...'));
      $.ajax({
        url:'./hotel/getroomtype/' + $('#detailHotelNum').val(),
        dataType:'json',
        success:(e)=>{
          $('#roomtypedatalist').empty();
          $.each(e,(i,e)=>{
            console.log(e);
            $('#roomtypedatalist').append($('<option/>').text(e));
          });
        },
        fail:(e)=>{
          console.log("error");
          $('#roomtypedatalist').empty().append($('<option/>').text('검색에 실패하였습니다.'));
        }
      })
    }
  });
  $('#partRoom table input,#partRoom table textarea').on({
    'dblclick':(e)=>{
      $(e.target).removeAttr('readonly').css({
        'resize':'vertical',
        'max-height':'15rem',
        'transition':''
      });
    },
    'blur':(e)=>{
      $(e.target).attr({'readonly':true});
      $(e.target).css({
        'resize':'none',
        'max-height':'10rem'
      });
    }
  });
  $('#detailHotelMemo>textarea').on({
    'input':(e)=>{
      $(e.target).css({
        'height':e.target.scrollHeight + "px"
      });
      console.log(e.target.scrollHeight);
    }
  }); //FIXME : Textarea 높이 자동조절. 이유는 모르겠는데 갑자기 동작안함.
  function UploadRoom() {
    let data = new FormData($('#formRoom')[0]);
    data.set('islock',data.get('islock') === 'on' ? 1 : 0);
    $.ajax({
      url:'./hotel/uploadroom/' + $('#detailHotelNum').val(),
      data:data,
      enctype:'multipart-form-data',
      type:'post',
      processData: false,
      contentType: false,
      success:(e)=>{
        if(e>0){
          loadHotel($('#detailHotelNum').val());
        }else{
          alert('객실추가에 실패하였습니다. 다시 시도해주세요.');
        }
      }

    })
  }
  function ClickAddHotelBtn() {
    $('#lstRoomTitle').text('신규 호텔 등록');
    $('#lstRoom').hide(200);
    $('#detailHotel').hide(200,()=>{
      $('#detailHotel input').val('');
      $('#detailHotel textarea').text('');
      $('#detailHotelImg').attr('src','');
      $('#detailHotelNum').val('0');
    });
    $('#detailHotel').show(200);
  }
  function changePhoto() {
    let tempvar = $('input[type="file"]')[0].files;
    $('input[type="file"]').click();
    $('input[type="file"]').on({
      'change':(e)=>{
        if(e.target.files.length===0){
          //Cancel
          //Restore previous selection.
          e.target.files = tempvar;
        }else{
          //Ok
          var reader = new FileReader();
          reader.onload = function(e) {
            $("#detailHotelImg").attr("src", e.target.result);
          }
          reader.readAsDataURL($(e.target)[0].files[0]);
        }
      }
    });
  }
  function updateHotel(){
    let data = new FormData($('#formHotel')[0]);
    $.ajax({
      url:'./hotel/update',
      enctype:'multipart-form-data',
      type:'post',
      processData:false,
      contentType:false,
      data:data,
      success:(e)=>{
        //TODO : 새로고침이 아니라 최신정보 바로 띄우게 수정해야함.
        if(e>0){

          location.reload();
        }else{
          alert('호텔 추가에 실패하였습니다. 다시 시도해주세요.');
        }
      }
    })
  }
  function loadHotel(hotelnum){
    $('#lstRoomTitle').text("Loading Hotel info...");
    $('#lstRoomWrapper').hide(100,()=>{
      $.ajax({
        url:'./hotel/' + hotelnum,
        dataType:'json',
        success:(e)=>{
          console.log(e[0].memo);

          $('input[type="file "]').val(null);
          $('#lstRoomTitle').text('hotel\'s room');
          //https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/6ce87bf1-d4e6-4129-b9c7-1ed036ab9f82
          $('#detailHotelImg').attr('src','https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/'+e[0].photo+'?type=f&w=160&h=120&faceopt=false');
          $('#detailHotelNum').val(e[0].num);
          $('#detailHotelName input').val(e[0].name);
          $('#detailHotelAddr input').val(e[0].addr);
          $('#detailHotelPhone input').val(e[0].phone);
          $('#detailHotelMemo textarea').val(e[0].memo==null ? '' : e[0].memo);
          $('#summaryRoomTotal').text(e[1].length);
          $('#lstRoom').show(200);
          $('#lstRoomItems tbody').empty();
          $.each(e[1],(idx,e)=>{
            $('#lstRoomItems tbody').append(
                    $('<tr>').append(
                            $('<td>').text(e.roomtype),
                            $('<td>').text(e.roomprice.toLocaleString('ko-KR')),
                            $('<td>').text(e.roommemo == null ? '내용없음' : e.roommemo),
                            $('<td>').append(
                                    $('<div>').append(
                                            $('<span>').text('상세정보').addClass('spanbtn')
                                                    .on({
                                                      'click':(f)=>{
                                                        showMdl(e.num,e.hotelnum,e.roomdetail,e.roomphoto);
                                                      }
                                                    }),
                                            $('<span>').text('삭제').addClass('spanbtn')
                                                    .on({
                                                      'click':(f)=>{
                                                        if(confirm('이 객실을 삭제하시겠습니까?')) DeleteRoom(f.target,e.num);
                                                      }
                                                    })
                                    ).css({
                                      'display':'flex',
                                      'justify-content':'space-around'
                                    })
                            )
                    )
            );
            //$('#lstRoomItems').append('<br/>');
          });
          $('#lstRoomTitle').text(e[0].name);
          // console.log(e);
        },fail:(e)=>{
          $('#lstRoomTitle').text("Failed to load info.")
        }
      });
    }).show(100);
  }
  function DeleteRoom(t,roomnum){
    $.ajax({
      url:'./hotel/deleteroom/' + roomnum,
      type:'post',
      success:(e)=>{
        if(e>0){
          loadHotel($('#detailHotelNum').val());
          //$($(t).parents('tr')).remove();
        }else{
          alert('객실 삭제에 실패하였습니다. 다시 시도해주세요.');
        }
      }
    })
  }
</script>

