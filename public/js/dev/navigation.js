$('document').ready(function () {
    _init();

});
function _init() {
    $(".clickable-div-like-button").on("click", function () {
        $("#nav-group .clickable-div-like-button").each(function () {
            $(this).removeClass("selected-button")
        });
        $(this).addClass("selected-button");
    })
}