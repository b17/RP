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
    $(".item-container").on('click', function (e) {
        if (hasClass(this, rotation_in)) {
            $(this).removeClass(rotation_in);
        } else {
            $(this).addClass('animated ' + rotation_in);
        }

        var val = e.currentTarget;

        $(this).animate();
        window.setTimeout(function () {
            console.log(val);
            console.log("Animation changing");
            $(val).children("div").each(function () {
                console.log(this);
                if ($(this).hasClass("visible-r")) {
                    $(this).removeClass("visible-r").addClass("hidden-r");
                } else {
                    $(this).removeClass("hidden-r").addClass("visible-r");
                }
            });
        }, 1000);

        $(this).on('transitionend webkitTransitionEnd MSTransitionEnd oTransitionEnd', function () {
            $(this).removeClass(rotation_in);
        });

    });
});

function hasClass(elem, klass) {
    return (" " + elem.className + " " ).indexOf(" " + klass + " ") > -1;
}