
// // dropdwon_list script
$(document).ready(function() {
    // 드롭다운 리스트 클릭시
    // active 활성화 하면서  aria-expanded  == true 로 ..
    $('.dropdown_list').click(function(event) {
        // 클릭 이벤트 버블링 막음
        event.stopPropagation();
        // 다른 dropdown  list : active , aria-expanded 제거
        $('.dropdown_list').not(this).removeClass('active').attr('aria-expanded', 'false');
        // 클릭한 리스트 토글
        $(this).toggleClass('active');
        var expanded = $(this).attr('aria-expanded') === 'true' || false;
        $(this).attr('aria-expanded', !expanded);
        $('.itemlist').not($(this).children('.itemlist')).slideUp(300);
        $(this).children('.itemlist').slideToggle(300);
    });

    // 다른 곳을 클릭하면 드롭다운 닫는 코드
    $(document).click(function() {
        $('.dropdown_list').removeClass('active').attr('aria-expanded', 'false');
        // slide 처리
        $('.itemlist').slideUp(300);
    });
});
