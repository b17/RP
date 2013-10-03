$(function() {

    $.extend($.validator.defaults, {
        highlight: function(elem, errorClass, validClass) {
            $(elem).closest('div.control-group').removeClass(validClass).addClass(errorClass);
        },

        unhighlight: function(elem, errorClass, validClass) {
            $(elem).closest('div.control-group').removeClass(errorClass).addClass(validClass);
        },
        errorElement: 'span',
        validClass: 'success'
    });

    // this staff just for adding help-inline text to error label
    // You should find better solution.
    $.validator.prototype.showLabel = function( element, message ) {
        var label = this.errorsFor( element );
        if ( label.length ) {
            // refresh error/success class
            label.removeClass( this.settings.validClass ).addClass( this.settings.errorClass );
            // replace message on existing label
            label.html(message);
        } else {
            // create label
            label = $("<" + this.settings.errorElement + ">")
                .attr("for", this.idOrName(element))
                .addClass(this.settings.errorClass)
                .html(message || "");
            label.addClass('help-inline'); // here it is.
            if ( this.settings.wrapper ) {
                // make sure the element is visible, even in IE
                // actually showing the wrapped element is handled elsewhere
                label = label.hide().show().wrap("<" + this.settings.wrapper + "/>").parent();
            }
            if ( !this.labelContainer.append(label).length ) {
                if ( this.settings.errorPlacement ) {
                    this.settings.errorPlacement(label, $(element) );
                } else {
                    label.insertAfter(element);
                }
            }
        }
        if ( !message && this.settings.success ) {
            label.text("");
            if ( typeof this.settings.success === "string" ) {
                label.addClass( this.settings.success );
            } else {
                this.settings.success( label, element );
            }
        }
        this.toShow = this.toShow.add(label);
    };


    $('form.validate').each(function() {
        $(this).validate({
            submitHandler: function(form) {
                form.submit();
            }
        });
    });

    $('.validate__email').each(function() {
        var opts = {
            email: true
        };
        var message = $(this).attr('data-email-message');
        if (message) {
            opts.messages = {
                email: message
            };
        }
        $(this).rules('add', opts);
    });

    $('.validate__maxlength').each(function() {
        var opts = {
            maxlength: $(this).attr('data-maxlength-length') || 255
        };
        var message = $(this).attr('data-maxlength-message');
        if (message) {
            opts.messages = {
                maxlength: message
            };
        }
        $(this).rules('add', opts);
    });

    $('.validate__minlength').each(function() {
        var opts = {
            minlength: $(this).attr('data-minlength-length') || 1
        };
        var message = $(this).attr('data-minlength-message');
        if (message) {
            opts.messages = {
                minlength: message
            };
        }
        $(this).rules('add', opts);
    });

    $('.validate__user__login').each(function() {
        var el = this;
        var opts = {
            remote: {
                url: $.Validation.url.user,
                type: "post",
                data: {
                    login: function() {
                        return $(el).val();
                    }
                }
            }
        };
        var message = $(this).attr('data-user-login-message');
        if (message) {
            opts.messages = {
                remote: message
            }
        }
        $(el).rules('add', opts);
    });

    $('.validate__required').each(function() {
        var opts = {
            required: true
        };
        var message = $(this).attr('data-required-message');
        if (message) {
            opts.messages = {
                required: message
            };
        }
        $(this).rules("add", opts);
    });
});