/**
 * Created with JetBrains WebStorm.
 * User: Andrew.Nazymko
 * Date: 6/12/13
 * Time: 1:28 PM
 * To change this template use File | Settings | File Templates.
 */
$('document').ready(function () {
    //alert for test
    console.log("item_behaviour.js loaded and ready to use");
    init();
})
function init() {
    $(".item-info-container").click(flipp);
}

function flipp(e) {
    console.log(e)

}



