class TryBackbone.Views.UsersIndex extends Backbone.View
  template: JST['users/index']

  events:
    'click #fb-logout': 'logoutFB'
    'userStatusChanged': 'userStatusChanged'
    'click #friends-link': 'friendsFB'

  userStatusChanged: (event, currentUser) =>
    console.log currentUser
    @render()

  logoutFB: (event) =>
    event.preventDefault()
    FB.logout()

  friendsFB: (event) ->
    event.preventDefault()
    view = new TryBackbone.Views.UsersFriends()
    $("#friends-list").html(view.render().el)

  render: ->
    $(@el).html @template()
    FB.XFBML.parse() if FB?
    this
