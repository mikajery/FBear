//=require backbone/models/blog

var BlogsCollection = Backbone.Collection.extend({
    model: BlogModel,
    url:   function () {
        return ''
    }
});