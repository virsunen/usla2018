$(window).load(function () {


    $(".v_container").hide();
    $(".v_thumbnails").hide();
    if ($(window).width() <= 1080) {
        $(".v_thumbnails").fadeIn(500, function () {
        });
    } else {
        $(".v_thumbnails").fadeIn(500, function () {

            $(".v_container").fadeIn(500, function () {

            });
        });
       
    }


    resizeThumbnails();
});


$(window).resize(function () {

    if (window.location.href.indexOf("gallery") !== -1) {
        resizeThumbnails();
        if ($(window).width() <= 1080) {
            showCloseBtn();
            if ($(".v_thumbnails").css("display") == "none" || $(".v_container").css("display") != "none") {
                checkHeader();
            } else {
                showThumbnails();
            }

        } else {
            showThumbnails();
            hideCloseBtn();
            $(".v_container").fadeIn(300);

        }
    }

});

$(document).ready(function () {

    $(".thumb_btn").click(function (e) {
        if ($(".v_container").css("display") == "none") {
            $(".v_container").fadeIn(300);
        }
        $(".v_thumb_image").css('border-color', 'rgba(0, 0, 0, 0.77)');
        $(this).parent().find(".v_thumb_image").css('border-color', 'rgba(255, 241, 0, 0.97)');
        checkHeader();

        hideThumbnails();
        $(".v_container img").hide().attr('src', this.id).fadeIn(1000);

    });


  
    $(".v_close_btn").click(function (e) {
        hideImage();
        showThumbnails();
        $(".v_thumb_image").css('border-color', 'rgba(0, 0, 0, 0.77)');
        $(".header").css({ "display": "block" });
    });


});

function resizeThumbnails() {
    var the_width = $(window).width() <= 1080 ? $(".thumb_img img").width() : 100;

    $(".thumb_img_sel img").css({
        'height': the_width + "px"
    });
    $(".thumb_img img").css({
        'height': the_width + "px"
    });
}

function hideImage() {

    $(".v_container").fadeOut(500, function () { $(this).hide(); $(".v_thumbnails").fadeIn(500);});
}

function hideThumbnails() {
    if ($(window).width() <= 1080) {
        $(".v_thumbnails").fadeOut(500);
    }
}
function showThumbnails() {
    $(".v_thumbnails").fadeIn(240);
}
function hideCloseBtn() {
    $(".v_close_div").css('display', 'none');
}

function showCloseBtn() {
    $(".v_close_div").css('display', 'block');
}

function checkHeader() {
    if ($(window).width() <= 1080) {

           
        $(".header").css({ "display": "none" });
  
    } else {
        $(".header").css({ "display": "block" });
    }

}
