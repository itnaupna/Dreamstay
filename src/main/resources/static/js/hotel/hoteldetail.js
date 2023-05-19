$(function() {
    $('.hoteldetail_slidebox').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '#hoteldetail_selectbox',
        autoplay: true,            // 자동 스크롤 사용 여부
        autoplaySpeed: 1000
    });
    $('#hoteldetail_selectbox').slick({
        slidesToShow: 8,
        slidesToScroll: 1,
        asNavFor: '.hoteldetail_slidebox',
        dots: true,
        centerMode: true,
        focusOnSelect: true,
    });

    $('.detail_room_slickSlider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.detail_room_photo',
        autoplay: true,            // 자동 스크롤 사용 여부
        autoplaySpeed: 1000
    });
    $('.detail_room_photo').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.detail_room_slickSlider',
        dots: true,
        centerMode: true,
        focusOnSelect: true,
    });
});