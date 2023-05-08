//btn 메뉴 dropdown 접고 펴기 이벤트, footer랑 이벤트 동일해서 주석처리하고 footer랑 같이 사용! (출동시 수정)
 $(function(){

    var dropdownBtn = document.querySelector('.resvBtn .btn_opener');
    var dropdownList = document.querySelector('.resvBtn .dropdown_list');

    dropdownBtn.addEventListener('click', function() {
    dropdownList.classList.toggle('open');
 });

   dropdownList.addEventListener('mouseleave', function() {
   dropdownList.classList.remove('open');
 });

 });

    // btnMenu 접고 펴기
    $(function(){
    var isMenuClick = false;

    $('.btnMenu').on('click', function() {
    isMenuClick = !isMenuClick;

    if (isMenuClick) {
    // menulist 펴기, header 배경색, btn 기울기 변경
    $('.btnMenulist').slideDown(300);
    $('.header').css('background', '#fff');
    $('.btnMenu').css('transform', 'translateY(0) rotate(45deg)');
    } else {
    $('.btnMenulist').slideUp(300);
    $('.header').css('background', 'transparent');
    $('.btnMenu').css('transform', 'translateY(0) rotate(0deg)');
    }
});

    // btnMenuClose (X버튼으로 닫기)
    $(".btnMenuClose").on('click', function() {
        $('.btnMenulist').slideUp(400);
        $('.header').css({
            'background': 'transparent',
        });

    });
});
