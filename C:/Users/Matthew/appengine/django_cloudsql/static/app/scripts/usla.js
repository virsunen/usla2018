$(document).ready(function () {

    $(".cal_prog_btn").click(function (e) {


        if ($("#ps" + this.id).css("display") == "none") {
            $("#ps" + this.id).css("display", "inline");


        } else {
            $("#ps" + this.id).css("display", "none");
        }


    });








});

function openMenu() {
    var menu = document.getElementsByClassName("nav_bar");
    menu[0].style.display = 'inline';
}

function closeMenu() {
    var menu = document.getElementsByClassName("nav_bar");
    menu[0].style.display = 'none';
}
