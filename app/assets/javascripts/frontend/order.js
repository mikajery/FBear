var Order = function (el) {
    var delivery_types = el.find('input[data-delivery-type]'),
        payment_types = function () {
            return el.find('[data-payment-type]')
        },
        address_view = $('[data-view=address]'),
        payment_view = $('[data-view=payment]'),
        delivery_view = el.find('[data-order=delivery-price]'),
        total_view = el.find('[data-order=total]'),
        map_view = function () {
            return el.find('[data-order=map]').first()
        },
        address_region = el.find('[data-layout=address]'),
        payment_region = el.find('[data-layout=payment]'),
        address = function () {
            return el.find('[data-order=address]').first()
        },
        address_wrap = function () {
            return el.find('[data-order=address-wrap]').first()
        },
        form = el.find('form'),
        submit_btn = el.find('[data-order=submit]'),
        delivery_price = false,
        delivery_fields = function () {
            return el.find('[data-delivery-calc]')
        },

        city = function () {
            return templates['address_and_payment'].find('[data-cart-kladr=city]').first()
        },

        street = function () {
            return templates['address_and_payment'].find('[data-cart-kladr=street]').first()
        },

        building = function () {
            return templates['address_and_payment'].find('[data-cart-kladr=building]').first()
        },

        site = function () {
            return templates['address_and_payment'].find('[data-cart-kladr=site]').first()
        },

        region = function () {
            return templates['address_and_payment'].find('[data-address=region]').first()
        },

        zip = function () {
            return templates['address_and_payment'].find('[data-address=zip]').first()
        },
//        site = function() { return el.find('[data-cart-kladr=building]').first() },

        delivery_type = false,
        params_to_save = ['country', 'city', 'region', 'zip', 'street', 'street_number', 'site', 'comment'],
        templates = {},
        data = {}
        ;

    var showPayment = function () {
        var template = _.template(payment_view.html());
        payment_region.html(template());

        payment_region.find('input[type=radio]').each(function () {
            new iRadio($(this));
        });

        payment_types().each(function () {
            if ($.inArray($(this).data('payment-type'), order_options.delivery_types[delivery_type].payment_types) < 0)
                $(this).remove();
        })
    };

    var showMap = function (search, show) {
        address().html(show);
        map_view().css('top', address_wrap().outerHeight());
        new StaticMap(map_view(), search);
    };

    form.submit(function (e) {
        if (delivery_price === false) {
            e.preventDefault();
            return false;
        }
    });

    var showDeliveryPriceLoading = function () {
        delivery_view.html($('<div>').addClass('b-loading'));
    }

    var showDeliveryPriceError = function (errors) {
        var icon = $('<div>').addClass('b-loading-error');
        delivery_view.html(icon);
    }

    var requestDeliveryPrice = function () {
        showDeliveryPriceLoading();

        $.post(el.data('delivery-path'), form.serialize())
            .error(function (r) {
                showDeliveryPriceError(r.errors);
            })
            .success(function (r) {
                delivery_price = r.price / 1;
                enableForm();
                calculate();
            });
    };

    var getDeliveryPrice = function () {
        var errors = [];

        delivery_fields().each(function () {
            if ($(this)[0].checkValidity() === false)
                errors.push(1);
        });

        if (errors.length == 0)
            requestDeliveryPrice();
    };

    var disableForm = function () {
        submit_btn.attr('disabled', true);

        delivery_fields().off('change').on('change', function () {
            disableForm();
            getDeliveryPrice();
        });
    };

    var enableForm = function () {
        submit_btn.removeAttr('disabled');
    };

    var applyParams = function () {
        $.each(data, function (i) {
            form
                .find('[name="' + i + '"]')
                .val(data[i])
//                .trigger('change')
            ;
        });
    };

    var saveParams = function () {
        var params = form.serializeArray();
        $.each(params, function (i) {
            if (!params[i].name) return false;
            var name = params[i].name;
            var param = /^cart\[([^\]]+)\]/.exec(name);
            if (param && $.inArray(param[1], params_to_save) >= 0) data[name] = params[i].value
        });
    };

    var setRegionAndZip = function (kladr) {
        if (!kladr) return;

        if (kladr.parents.length > 0) {
            var parent = kladr.parents[0];
            var region_name = [parent.name];

            if (parent.type != 'Город')
                region_name.push(parent.typeShort)
            region().val(region_name.join(' '));
        }

        if (kladr.zip) zip().val(kladr.zip);
    };

    var updateAddress = function () {
        var full_address = [],
            search_address = [];


        if (zip().val()) full_address.push(zip().val());
        if (region().val() && region().val() != city().val()) full_address.push(region().val());
        if (city().val()) {
            var _city = street().kladr('current')
                    ? city().kladr('current').typeShort + '&nbsp;' + city().kladr('current').name
                    : city().val()
                ;

            search_address.push(city().val());
            full_address.push(_city);
        }
        if (street().val()) {
            var _street = street().kladr('current')
                    ? street().kladr('current').typeShort + '&nbsp;' + street().kladr('current').name
                    : street().val()
                ;

            search_address.push(street().val());
            full_address.push(_street);
        }

        if (building().val()) {
            full_address.push(building().val());
            search_address.push(building().val());
        }

        showMap(search_address.join(', '), full_address.join(', '));
    };


    var initKladrs = function () {
        new Kladr(city(), 'city');
        new Kladr(street(), 'street');
        new Kladr(building(), 'building');

        city().on('kladr_select kladr_check',function (e, obj) {
            street().kladr('parentType', $.kladr.type.city);
            building().kladr('parentType', $.kladr.type.city);

            if (obj) {
                street().kladr('parentId', obj.id);
                building().kladr('parentId', obj.id);
            }

            setRegionAndZip(obj);
            updateAddress();
        })

        street().on('kladr_select kladr_check',function (e, obj) {
            building().kladr('parentType', $.kladr.type.street);

            if (obj) {
                building().kladr('parentId', obj.id);
            }

            setRegionAndZip(obj);
            updateAddress();
        })

        building().on('kladr_select kladr_check change',function (e, obj) {
            setRegionAndZip(obj);
            updateAddress();
        })

        site().on('kladr_select kladr_check change',function () {
            updateAddress();
        })

        region().on('change',function () {
            updateAddress();
        })
    };

    var showAddress = function () {
        var template = _.template(address_view.html()),
            _initTemplate = false
        ;

        if (!templates['address_and_payment'])
        {
            templates['address_and_payment'] = $(template());
            _initTemplate = true;
        }

        address_region.append(templates['address_and_payment']);

        if (_initTemplate) {
            address_region.find('select').each(function () {
                new FancySelect($(this));
            });
            initKladrs();
        };



        applyParams();
        updateAddress();
    };

    var resetRegions = function () {
        $.each(templates, function(i) {
            templates[i].detach();
        });

        payment_region.empty();
    }

    var selectDeliveryType = function (el) {
        delivery_type = el.val();

        saveParams();
        resetRegions();
        showPayment();

        if (order_options.delivery_types[delivery_type].layout == 'address_and_payment')
            showAddress();

        if (el.data('delivery-calculate')) {
            delivery_price = false;
            disableForm();
        }
        else {
            enableForm();
            delivery_price = order_options.delivery_types[delivery_type].price;
        }

        calculate();
    };

    form.find(':input').on('change', function () {
        data = form.serializeArray();
    });

    var calculate = function () {
        var total_price = order_options.items_price;

//        if (order_options.delivery_types[delivery_type])
//            console.log(order_options.delivery_types[delivery_type]);

        if (delivery_price !== false) {
            delivery_view.html(delivery_price.money(0, ' ', '', ' р.'));
            total_price += delivery_price;
        }
        else
            delivery_view.html('—');

        total_view.html(total_price.money(0, ' ', '', ' р.'))
    };

    var tooltips = function () {
        el.find('[data-toggle=tooltip]')
    };

    delivery_types.click(function () {
        selectDeliveryType($(this));
    });

    delivery_types.each(function () {
        $(this).closest('div.radio-label').find('[data-order=popover]').popover({
            html: true,
            title: 'Условия доставки',
            trigger: 'hover',
            content: order_options.delivery_types[$(this).val()].conditions,
            animation: true
        })
    })

    calculate();
//    showMap('Москва, ул. Дубининская, 57');
}

$(document).on('ready page:load', function () {
    $('[data-type=order]').each(function () {
        new Order($(this));
    });
});