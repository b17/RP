/**
 * Created with JetBrains WebStorm.
 * User: Andrew.Nazymko
 * Date: 6/20/13
 * Time: 12:26 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    initialize();

});
var map;
function initialize() {
    var mapOptions = {
        zoom: 8,
        center: new google.maps.LatLng(-34.397, 150.644),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

}

