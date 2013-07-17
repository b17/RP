$(document).ready(function () {
    $(".tag-home div").on("click", function () {
        if ($(this).hasClass("selected-tag")) {
            $(this).removeClass("selected-tag");
        } else {
            $(this).addClass("selected-tag");
        }
    });
});