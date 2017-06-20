
$(window).resize(function () {

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



$(document).ready(function () {

    $(".cal_item").click(function (e) {
        // Fade out events and load day's programs and events

        if (toggleCal("#ps" + this.id)) {
            $(this).css("background-color", "rgba(255, 241, 0, 0.97)");
        } 

    });

    $(".closeCalDay").click(function (e) {
        var parentId = $(this).parent().id;
        toggleCal(parentId);
    });



    $(".events_nav_btn").click(function (e) {

        toggleCalEvents(this);

    

    });
    $(".events_nav_btn_sel").click(function (e) {

        toggleCalEvents(this);
    });


});

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
