$('#fullpage').fullpage({
    // fullpage.js options go here
    anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
    menu: '#menu',
    scrollingSpeed: 1000,
    css3:false,
    afterLoad: function(anchorLink, index) {
        if (anchorLink === 'firstPage' || anchorLink === '4thpage') {
            $('.header').css({
                'background': 'transparent',
                'color':'#fff',
            });
        } else {
            $('.header').css({
                'background': '#fff',
                'color':'#000'
            });

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
