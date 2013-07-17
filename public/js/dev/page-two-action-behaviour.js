$(document).ready(function () {
    console.log("here");
    $("#go-to-announce").on('click', function () {
        console.log("click 1");
        var $announce = $("#announce-list");
        var $map = $("#map");


        $announce.addClass("visible-r");
        $announce.removeClass("hidden-r");
        $map.removeClass("visible-r");
        $map.addClass("hidden-r");
    });

    $("#go-to-map").on('click', function () {
        console.log("click 2");
        var $announce = $("#announce-list");
        var $map = $("#map");


        $announce.removeClass("visible-r");
        $announce.addClass("hidden-r");
        $map.addClass("visible-r");
        $map.removeClass("hidden-r");
    });


});