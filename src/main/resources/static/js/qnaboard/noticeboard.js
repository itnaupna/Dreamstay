$(".noticeboard_subjectbox").click(function() {
    let num = $(this).attr("value");
    let target = $(this);
    if($(this).next().is(":visible")) {
    } else {
        $(".noticeboard_subjectbox").not($(this)).next().slideUp();
        $.ajax({
            url: "/notice/viewcount",
            data: {"num": num},
            type: "post",
            success: function(data) {
                target.find('span.noticeboard_viewcnt').text(data);
            }
        });
    }
    $(this).next().slideToggle();
});

$("#noticeboard_searchbtn").click(function() {
    searchValue = $("#noticeboard_search").val();
    location.href = "/notice/noticeboard?search=" + searchValue;
});

$("#noticeboard_search").keyup(function(e) {
    if(e.which === 13) {
        $("#noticeboard_searchbtn").click();
    }
});