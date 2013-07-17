$(document).ready(function () {

    //Initiliaze
    var rotation = [
        'flipped-vertical-bottom',              //0
        'flipped-vertical-top',                 //1
        'flipped-horizontal-left',              //2
        'flipped-horizontal-right',             //3
        'flipped-vertical-bottom-180',          //4
        'flipped-vertical-top-180',             //5
        'flipped-horizontal-left-180',          //6
        'flipped-horizontal-right-180',         //7
        'flipped-vertical-bottom-90',           //8
        'flipped-vertical-top-90',              //9
        'flipped-horizontal-left-90',           //10
        'flipped-horizontal-right-90'];         //11

    var rotation_in = rotation[10];
    $(".rotation-class-listener").on('click', function (e) {
        var val = $(e.currentTarget).parent().parent();
        if (hasClass(val, rotation_in)) {
            $(val).removeClass(rotation_in);
        } else {
            $(val).addClass('animated ' + rotation_in);
        }
        console.log(val);

        $(val).animate();
        window.setTimeout(function () {

            $(val).find(".optional").each(function () {
                console.log("->", this);
                if ($(this).hasClass("visible-r")) {
                    $(this).removeClass("visible-r").addClass("hidden-r");
                } else {
                    $(this).removeClass("hidden-r").addClass("visible-r");
                }
            });
        }, 900);

        $(val).on('transitionend webkitTransitionEnd MSTransitionEnd oTransitionEnd', function () {
            $(val).removeClass(rotation_in);
        });

    });
});

function hasClass(elem, klass) {
    return (" " + elem.className + " " ).indexOf(" " + klass + " ") > -1;
}