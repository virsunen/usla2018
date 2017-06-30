
$(window).resize(function () {
    handle_events_top();
    if ($(window).width() >= 600) {
        var nav_sel = $(".event_nav_btn_sel");
        if ($(".cal_prog_schedules").is(':visible')) {
            $(".events").fadeOut(900);
        } else {
            $(".events").fadeIn(900);
        }

        $(".calendar").fadeIn(900);
    } else {
        if ($(".calendar").is(':visible') && $(".events_nav_btn_sel").attr("id") == "cal") {
            $(".events").fadeOut(100);
        } else if ($(".events_nav_btn_sel").attr("id") == "events") {
            $(".events").fadeIn(900);
            $(".calendar").fadeOut(900);
        }
    }

});

$(window).load(function () {
    handle_events_top();


});


$(document).ready(function () {

    $(".cal_item").click(function (e) {
        // Fade out events and load day's programs and events
        e.preventDefault();
        if (toggleCal("#ps" + this.id)) {
            $(this).css("background-color", "rgba(255, 241, 0, 0.97)");
        } 

    });

    $(".history_btn").click(function (e) {
        e.preventDefault();
        toggleSlide(".fp_history", this);
    });

    $(".closeCalDay").click(function (e) {
        e.preventDefault();
        var parentId = $(this).parent().id;
        toggleCal(parentId);
    });



    $(".events_nav_btn").click(function (e) {
        e.preventDefault();
        toggleCalEvents(this);

    

    });
    $(".events_nav_btn_sel").click(function (e) {
        e.preventDefault();
        toggleCalEvents(this);
    });

    $(".image_link").click(function (e) {
        $(".overlay_img_container").hide();
        $(".overlay_img").attr('src', this.id);
        $(".overlay_img_container").fadeIn(1000);
    });

    $(".overlay_img_btn").click(function (e) {

        $(".overlay_img_container").fadeOut(1000);
    });
});

function toggleSlide(theDiv, theClass) {
    if ($(theDiv).css("display") == "none") {
       
        $(theDiv).slideDown(270, function () {
            $("#" + theClass.id + "_up").fadeIn(0);
            $("#" + theClass.id + "_down").fadeOut(0);
      
        });
    } else {

        $(theDiv).slideUp(270, function () {
            $("#" + theClass.id + "_up").fadeOut(0);
            $("#" + theClass.id + "_down").fadeIn(0);

   
        });
    }
  
}

function handle_events_top() {
    if ($(window).width() <= 880) {
        if (window.location.href.indexOf("events") !== -1) {
            $(".page_title").css("display", "none");
            $(".html_content").css("margin-top", "48px");

        } else {
            $(".page_title").css("display", "block");
            $(".html_content").css("margin-top", "0px");
        }
    } else {
        $(".page_title").css("display", "none");
        $(".html_content").css("margin-top", "0px");
    }
}

function toggleCalEvents(theItem) {

    if ($(theItem).attr('class') == "events_nav_btn") {
       
        if (theItem.id == "cal") {

            $(".events").fadeOut(500, function () {
                $(".calendar").fadeIn(500);
            });

  
        } else {
            $(".calendar").fadeOut(500, function () {
                $(".events").fadeIn(500);
            });
     
        }

        var sel = $(".events_nav_btn_sel");
        var un_sel = $(".events_nav_btn");

        sel.removeClass("events_nav_btn_sel");
        sel.addClass("events_nav_btn");
        un_sel.removeClass("events_nav_btn");
        un_sel.addClass("events_nav_btn_sel");

    }
}

function toggleCal(theId) {
    if ($(theId).css("display") == "none") {

        $(theId).fadeOut(1000, function () {
            $(".cal_prog_schedules").css("display", "none");
        });
        if ($(theId).height() > $(".html_content").height() - $("footer").height()) {

            $(".html_content").height($(theId).height() + $("footer").height() + 60);
        }

        $(theId).fadeIn(1200, function () {
         
        });
        $(".events").fadeOut(1000);
        $(".cal_item").css("background-color", "rgba(255, 255, 255, 0.92)");
     
        return true;
        // Fade In Event and fade out programs and events
    } else {
        $(".cal_item").css("background-color", "rgba(255, 255, 255, 0.92)");
        $(".cal_prog_schedules").fadeOut(1200, function () {
            $(".cal_prog_schedules").css("display", "none");

            $(".html_content").height("100%");
           
        });
        if ($(window).width() > 600) {
            $(".events").fadeIn(500);
        }
      
        return false;
    }
}

function openMenu() {
    var menu = document.getElementsByClassName("nav_bar");
    menu[0].style.display = 'inline';
}

function closeMenu() {
    var menu = document.getElementsByClassName("nav_bar");
    menu[0].style.display = 'none';
}
