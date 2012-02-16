class TryBackbone.Views.UsersIndex extends Backbone.View
  template: JST['users/index']

  events:
    'click #fb-logout': 'logoutFB'

  logoutFB: ->
    FB.logout()

  render: ->
    $(@el).html @template()
    this  
