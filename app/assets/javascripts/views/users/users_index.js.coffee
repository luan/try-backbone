class TryBackbone.Views.UsersIndex extends Backbone.View
  template: JST['users/index']

  events:
    'click #fb-logout': 'logoutFB'
    'userStatusChanged': 'userStatusChanged'

  userStatusChanged: (event, currentUser) =>
    console.log currentUser
    @render()

  logoutFB: (event) =>
    event.preventDefault()
    FB.logout()

  render: ->
    $(@el).html @template()
    FB.XFBML.parse() if FB?
    this  
