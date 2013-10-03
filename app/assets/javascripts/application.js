// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

(function($) {

    GeoMap = function(el, options) {
        this.$el = $(el);
        this.options = options;
        options.center = new google.maps.LatLng(options.center.lat, options.center.lon);
        this.map = new google.maps.Map($(el)[0], options);
    };

    GeoMap.defaults = {
        zoom: 14,
        center: {lat: 0.0, lon: 0.0},
        mapTypeId: 'roadmap'
    };

    GeoMap.prototype.map = function() {
        return this.map;
    }

    $.fn.geoMap = function(options) {
        var args = arguments;
        return $(this).each(function() {
            var $this = $(this);
            var data = $(this).data('geomap');

            if (!data) {
                options = $.extend(GeoMap.defaults, options);
                data = new GeoMap($this, options);
                $this.data('geomap', data);
            } else {
                if (typeof options == 'string') {
                    return data[options].apply(this, args.slice(1));
                }
            }
        })
    }
})(jQuery);

$(function() {
    var map = $('#test-map').geoMap();
});