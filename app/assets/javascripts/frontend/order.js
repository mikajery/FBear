var Order = function(el) {
    var delivery_types = el.find('input[data-delivery-type]'),
        payment_types = function() { return el.find('[data-payment-type]')},
        address_view = $('[data-view=address]'),
        payment_view = $('[data-view=payment]'),
        delivery_view = el.find('[data-order=delivery-price]'),
        total_view = el.find('[data-order=total]'),
        address_region = el.find('[data-layout=address]'),
        payment_region = el.find('[data-layout=payment]'),
        form = el.find('form'),
        submit_btn = el.find('[data-order=submit]'),
        delivery_price = false,
        delivery_fields = function() { return el.find('[data-delivery-calc]')},
        delivery_type = false
    ;

    var showPayment = function() {
        var template = _.template(payment_view.html());
        payment_region.html(template());

        payment_region.find('input[type=radio]').each(function() {
            new iRadio($(this));
        });

        payment_types().each(function() {
            if ($.inArray($(this).data('payment-type'), order_options.delivery_types[delivery_type].payment_types) < 0)
                $(this).remove();
        })
    };

    form.submit(function(e) {
        if (delivery_price === false) {
            e.preventDefault();
            return false;
        }
    });

    var showDeliveryPriceLoading = function() {
        delivery_view.html($('<div>').addClass('b-loading'));
    }

    var showDeliveryPriceError = function(errors) {
        var icon = $('<div>').addClass('b-loading-error');
        delivery_view.html(icon);
    }

    var requestDeliveryPrice = function() {
        showDeliveryPriceLoading();

        $.post(el.data('delivery-path'), form.serialize())
            .error(function(r) {
                showDeliveryPriceError(r.errors);
            })
            .success(function(r) {
                delivery_price = r.price/1;
                enableForm();
                calculate();
            });
    };

    var getDeliveryPrice = function() {
        var errors = [];

        delivery_fields().each(function() {
            if ($(this)[0].checkValidity() === false)
                errors.push(1);
        });

        if (errors.length == 0)
            requestDeliveryPrice();
    };

    var disableForm = function() {
        submit_btn.attr('disabled', true);

        delivery_fields().off('change').on('change', function() {
            disableForm();
            getDeliveryPrice();
        });
    };

    var enableForm = function() {
        submit_btn.removeAttr('disabled');
    };

    var showAddress = function() {
        var template = _.template(address_view.html());
        address_region.html(template());
        FancySelect(el.find('select'));
    };

    var resetRegions = function() {
        address_region.empty();
        payment_region.empty();
    }

    var selectDeliveryType = function(el) {
        delivery_type = el.val();

        resetRegions();
        showPayment();

        if (order_options.delivery_types[delivery_type].layout == 'address_and_payment')
            showAddress();

        if (el.data('delivery-calculate'))
        {
            delivery_price = false;
            disableForm();
        }
        else
        {
            enableForm();
            delivery_price = order_options.delivery_types[delivery_type].price;
        }

        calculate();
    };

    var calculate = function() {
        var total_price = order_options.items_price;

//        if (order_options.delivery_types[delivery_type])
//            console.log(order_options.delivery_types[delivery_type]);

        if (delivery_price !== false)
        {
            delivery_view.html(delivery_price.money(0, ' ', '', ' р.'));
            total_price += delivery_price;
        }
        else
            delivery_view.html('—');

        total_view.html(total_price.money(0, ' ', '', ' р.'))
    };

    var tooltips = function() {
        el.find('[data-toggle=tooltip]')
    };

    delivery_types.click(function() {
        selectDeliveryType($(this));
    });

    delivery_types.each(function() {
        $(this).closest('div.radio-label').find('[data-order=popover]').popover({
            html: true,
            title: 'Условия доставки',
            trigger: 'hover',
            content: order_options.delivery_types[$(this).val()].conditions,
            animation: true
        })
    })

    calculate();
}

$(document).on('ready page:load', function() {
    $('[data-type=order]').each(function() {
        new Order($(this));
    });
});