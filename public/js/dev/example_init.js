/**
 * Created with JetBrains WebStorm.
 * User: patronus
 * Date: 15.06.13
 * Time: 15:19
 * To change this template use File | Settings | File Templates.
 */
images = [
    'img/dev/img-tag-gag/images_0.jpg',
    'img/dev/img-tag-gag/images_1.jpg',
    'img/dev/img-tag-gag/images_2.jpg',
    'img/dev/img-tag-gag/images_3.jpg',
    'img/dev/img-tag-gag/images_4.jpg'
];

tag_names = [
    'Sacura',
    'Nature',
    'Ants',
    'Freedom',
    'Forest'
];

$(document).ready(function () {
    console.log("here");
    $(".tag-home div").each(function () {
        var number = Math.round(Math.random() * (images.length - 1));
        img = images[number];
        tag = tag_names[number];
        $(this).css('background-image', 'url(' + img + ')');
        $(this).find(".tag-name").append(tag);
    });


});