<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="lstHotel">
  <div id="toolbarHotel">
    <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/icon_add.png">
    <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/icon_detail.png">
  </div>
  <c:forEach items="${hDto}" var="dto">
    <div class="itemHotel" onclick="loadHotel(${dto.num})">
      <div class="thumbsHotel">
        img
      </div>
      <div class="summaryHotel">
        <div class="minititleHotel">
            ${dto.name}
        </div>
        <div class="miniaddressHotel">
            ${dto.addr}
        </div>
      </div>
    </div>
  </c:forEach>
</div>
<div id="lstRoom">
  <div id="lstRoomTitle">
    호텔을 선택하세요.
  </div>
  <div id="detailHotel">
    <table class="table table-bordered">
      <caption style="text-align:right;font-size:0.8rem;caption-side: top;">
        DblClick to edit value.
      </caption>
      <tr>
        <td rowspan="3" style="width:160px;vertical-align: middle;">
          <img src="" id="detailHotelImg" style="width:160px;height:120px;">
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
  </div>
  <div id="summaryRoom">
    Total : <span id="summaryRoomTotal"></span><br/>
    Current : <span id="summaryRoomCurrent"></span><br/>
    Reservation : <span id="summaryRoomReservation"></span><br/>
    Remain : <span id="summaryRoomRemain"></span>
  </div>
  <div id="lstRooms">

  </div>
</div>

<style>
  #toolbarHotel {
    position: absolute;
    top: 0px;
    right: 0px;
    background-color: navajowhite/*#1c1c1c*/;
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
    background-color:skyblue;
    width:calc(100% + 30px);
    height:3rem;
    text-align: center;
  }
  .thumbsHotel{
    width: 80px;
    height:80px;
    border:1px solid black;
    margin-right:10px;
  }
  .adminmain{
    display:inline-flex;
    justify-content: left;
  }
  .itemHotel{
    border:1px solid black;
    border-radius:15px;
    padding:10px;
    width:100%;
    height:100px;
    display:inline-flex;
    margin-bottom:10px;
    align-items: center;

  }
  #lstHotel,#lstRoom{
    border:1px solid gray;
    border-radius:15px;
    padding:15px;
    overflow-y:auto;
    width:45%;
    height:100%;
    position:relative;
    overflow-x:hidden;
  }
  #lstHotel{
    margin-right:10px;
  }
  table input, table textarea{
    border:none !important;
    outline:none !important;
    padding:0px;
    resize:none;
  }
  table input:focus:read-only, table textarea:focus:read-only{
    box-shadow: none !important;

  }
  table input:focus:not(:read-only), table textarea:focus:not(:read-only){
    box-shadow: 0 0 5px rgb(152,129,34) !important;

  }
</style>
<script>
  $('table input,table textarea').on({
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
        'max-height':'10rem',
        'transition':''
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
  });

  function loadHotel(hotelnum){
    $('#lstRoomTitle').text("Loading Hotel info...");
    $.ajax({
      url:'./hotel/' + hotelnum,
      dataType:'json',
      success:(e)=>{
        console.log(e);
        $('#lstRoomTitle').text('hotel\'s room');
        $('#detailHotelName input').val(e[0].name);
        $('#detailHotelImg').attr('src','https://kr.object.ncloudstorage.com/dreamsstaybucket/'+e[0].photo);
        $('#detailHotelAddr input').val(e[0].addr);
        $('#detailHotelPhone input').val(e[0].phone);
        $('#detailHotelMemo textarea').text(e[0].memo);
        $('#summaryRoomTotal').text(e[1].length);
        $('#lstRooms').empty();
        $.each(e[1],(idx,e)=>{
          $('#lstRooms').append(e.hotelnum + ' ' + e.roomtype + ' ' + e.roomprice);
          $('#lstRooms').append('<br/>');
        });
        // console.log(e);
      },fail:(e)=>{
        $('#lstRoomTitle').text("Failed to load info.")
      }
    });
  }
</script>