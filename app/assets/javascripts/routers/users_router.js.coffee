class TryBackbone.Routers.Users extends Backbone.Router
  routes:
    '': 'index'
    ':id': 'show'

  index: ->
    view = new TryBackbone.Views.UsersIndex()
    $('#container').html view.render().el

  show: (id) ->
    alert "User: #{id}"
