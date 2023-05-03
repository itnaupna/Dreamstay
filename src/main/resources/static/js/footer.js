// 스크롤 테스트 1

// 스크롤 마지막 지점 찾기
// $(".main").scroll(function() {
//     var scroll = $(".main").scrollTop();
//     console.log(scroll); // main scroll 위치
//     var documentHeight = $(document).height();
//     console.log(documentHeight); // 문서전체 높이
//     var windowHeight = $(".main").height();
//     console.log(windowHeight); // main 높이
//
//     // 푸터를 보이도록 설정
//     if (scroll + windowHeight === documentHeight) {
//         $('.footer').css('display','block');
//     }
//
//     // 푸터를 다시 hidden으로 설정
//     if (scroll === 0) {
//         $('.footer').css('display','none');
//     }
// });


// 스크롤 테스트 2
$(document).ready(function (){
    // main 의 이 높이구하기
    var mainHeight = $(".main").height();
    // console.log(mainHeight);
    //스크롤시 나타날 footer 숨기기
    $(".footer").hide();
    // main 스크롤기능 작동
    // 스크롤이 main height 값을 넘었을 때 = 윈도우 스크롤 값이 mainHeight 의 높이와 >=
    $(".main").scroll(function(){
        var rollIt = $(this).scrollTop() >= mainHeight;
        // console.log(rollIt);
       if(rollIt) {
           $(".footer").show().css({"position": "block","display":"block"});
       }
           else{
               $(".footer").hide();
       }
    });
});

// dropdwon_list script

$(document).ready(function() {
    // 드롭다운 리스트 클릭시
    // active 활성화 하면서  aria-expanded  == true 로 ..
    $('.dropdown_list').click(function(event) {
        // 클릭 이벤트 버블링 막음
        event.stopPropagation();
        // 다른 dropdown  list : active , aria-expanded 요소 false 처리
        $('.dropdown_list').not(this).removeClass('active').attr('aria-expanded', 'false');
        $(this).toggleClass('active');
        var expanded = $(this).attr('aria-expanded') === 'true' || false;
        $(this).attr('aria-expanded', !expanded);
        $('.item_list').not($(this).children('.item_list')).slideUp(300);
        $(this).children('.item_list').slideToggle(300);
    });

    // 다른 곳을 클릭하면 드롭다운 닫는 코드
    $(document).click(function() {
        $('.dropdown_list').removeClass('active').attr('aria-expanded', 'false');
        $('.item_list').slideUp(300);
    });
});






