/**
 * Created with JetBrains WebStorm.
 * User: patronus
 * Date: 17.06.13
 * Time: 19:38
 * To change this template use File | Settings | File Templates.
 */

const MINIMUM_TITLE_LENGTH = 6;


$(document).ready(function () {
    updateBGandTitle();
    long_term();
    addSortableTable();
    initialize();
    removeButton();
    addButton();


    addNewButton();
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
function addSortableTable() {
    $('#st_id').dataTable({
        "bFilter": true,
        "bSearchable": true,
        "navIndex": false

    });

    $("#st_id_length").css("display", "none")
    $(".dataTables_paginate").css("display", "none")
}

function long_term() {
    $(".nav-button").on("click", function () {
        showSelectedContentPage.call(this);
        updateBGandTitle();
    });

    showSelectedContentPage.call($(".nav-button.selected"));


}
function updateBGandTitle() {
    $(".page-name")[0].innerText = $($(".selected"))[0].innerText;

}
function showSelectedContentPage() {
    $(".nav-button").each(function () {
        $(this).removeClass("selected");
        //def-part - attribute with target content id
        var id = $(this).attr("data-defpart");
        $("#" + id + " div").addClass("gone");
        $("#" + id).addClass("gone");
    });
    $(this).addClass("selected");
    var id = $(this).attr("data-defpart");
    $("#" + id).removeClass("gone");
    $("#" + id + " div").removeClass("gone");
}

function removeButton() {
    $(".remove-info-block").on('click', function () {
        var parent = $(this).parent().parent()[0];
        parent.remove();
    })
}

function addButton() {
    $(".add-info-block").on("click", function () {
        var copy = $("#new-item-desc-pattern").clone();
        copy.removeClass("gone");
        copy.removeAttr("id");
        $("#desc-bot-border").before(copy);
        removeButton()
    });
}
function tracker(e) {
    var $btn = $("#btn-publish");
    if ((e).value.length < MINIMUM_TITLE_LENGTH) {
        if (!$btn.hasClass("unavailable")) {
            $btn.addClass("unavailable");
        }
    } else {
        if ($btn.hasClass("unavailable")) {
            $btn.removeClass("unavailable");
        }
    }
}

function addNewButton() {
    $(".add-button").on("click", function () {
        $(".nav-button").each(function () {
            if ("announce-part" == $(this).attr("data-defpart")) {
                $(this).addClass("selected")
            } else {
                $(this).removeClass("selected");
            }

            $("#announce-part").removeClass("gone")
            $("#announce-part div").removeClass("gone")
            $("#my-my-announces-part").addClass("gone")
        });
    });
}

//                          *********!Bugged!*********
//function announceList() {
//    $(".announces-list-element").on("mouseover", function () {
//        $(".announces-list-element").each(function () {
//            $(this).removeClass("element-hover");
//        });
//        $(this).addClass("element-hover");
//
//    });
//}