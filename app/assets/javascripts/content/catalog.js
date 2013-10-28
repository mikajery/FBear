//= require backbone/views/goods

Catalog = new Backbone.Marionette.Application();

Catalog.addRegions({
    mainRegion: "[data-region=goods]"
});

CatalogRouter = Backbone.Router.extend({
    routes: {
        "*actions": "category"
    }
});

var goodsCollection = new GoodsCollection();

goodsView = new GoodsView({
    collection: goodsCollection
});

var columize = function(collection) {
    var wrap = $('<div>').addClass('showroom-col');
    $('[data-region=goods]').append(collection.wrap(wrap));

//    $('[data-region=goods]').append();
}

var fetch = function(collection) {
    goodsCollection.fetch({
        data: {
            collection: collection
        },
        type: "POST",
        remove: true,
        success: function() {
            goodsView.render();
        },
        error: function(model, xhr, options) {
            console.error(xhr);
        }
    })

}

Catalog.addInitializer(function (options) {
    var catalogRouter = new CatalogRouter();


    catalogRouter.on(
        'route:category',
        function (collection) {
            fetch(collection)
        }
    );

    Catalog.mainRegion.show(goodsView);
});

$(function() {
    Catalog.start();
    Backbone.history.start();
})