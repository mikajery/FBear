var Order = function(el) {
    var delivery_types = function() { return el.find('[data-delivery-type]') },
        payment_types = function() { return el.find('[data-payment-type]')},
        address_view = $('[data-view=address]'),
        payment_view = $('[data-view=payment]'),
        total_view = el.find('[data-order=total]'),
        address_region = el.find('[data-layout=address]'),
        payment_region = el.find('[data-layout=payment]'),
        delivery_type = false
    ;

    var showPayment = function() {
        var template = _.template(payment_view.html());
        payment_region.html(template());
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

        calculate();
    };

    var calculate = function() {
        var total_price = order_options.items_price;

        if (order_options.delivery_types[delivery_type])
            total_price += order_options.delivery_types[delivery_type].price;

        total_view.html(total_price.money(0, ' ', '', ' р.'))
    };

    var tooltips = function() {
        el.find('[data-toggle=tooltip]')
    };

    delivery_types().on('click', function() {
        selectDeliveryType($(this));
    });

    delivery_types().each(function() {
        console.log($(this).find('[data-order=popover]'));
        $(this).closest('li').find('[data-order=popover]').popover({
            html: true,
            title: 'Условия доставки',
            trigger: 'hover',
            content: order_options.delivery_types[$(this).val()].conditions,
            animation: true
        })
    })

    calculate();
}

$(function() {
    $('[data-type=order]').each(function() {
        new Order($(this));
    });
});