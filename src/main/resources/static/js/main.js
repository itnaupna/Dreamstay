$('#fullpage').fullpage({
    // fullpage.js options go here
    anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
    menu: '#menu',
    scrollingSpeed: 1000,
    css3:false,
    afterLoad: function(anchorLink, index) {
            if (anchorLink === 'secondPage') {

                //header 배경색
                $('.header').addClass('white_header').removeClass('black_header');
                //header 로그인, 회원가입, 예약확인 색깔
                $('.header li a').addClass('black_li').removeClass('white_li');
                // hotel logo image
                $('.logo').addClass('black_logo').removeClass('white_logo');
                // 3줄 버튼 이미지
                $('.header .btnMenu').addClass('black_btnMenu').removeClass('white_btnMenu');
                // 상품찾기 돋보기 이미지
                $('.topUtil .hotelFind').addClass('black_find').removeClass('white_find');
                //reserve 버튼
                $('.btn_opener').addClass('black_btn_opener').removeClass('white_btn_opener');

            } else {

                //header 배경색
                $('.header').addClass('white_header').removeClass('black_header');
                //header 로그인, 회원가입, 예약확인 색깔
                $('.header li a').addClass('white_li').removeClass('black_li');
                // hotel logo image
                $('.header .logo').addClass('white_logo').removeClass('black_logo');
                // 3줄 버튼 이미지
                $('.header .btnMenu').addClass('white_btnMenu').removeClass('black_btnMenu');
                // 상품찾기 돋보기 이미지
                $('.topUtil .hotelFind').addClass('white_find').removeClass('black_find');
                //reserve 버튼
                $('.btn_opener').addClass('white_btn_opener').removeClass('black_btn_opener');

            }
    }

});


$(function (){
    $(".page4_box_logo").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").fadeOut(600, function () {
            $(".bg_imgs04").css("background-image", "url(" + src + ")");
            $(".bg_imgs04").fadeIn(600);

        });
    });
});
