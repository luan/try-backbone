class TryBackbone.Views.UsersFriends extends Backbone.View
  template: JST['users/friends']

  render: ->
    FB.api '/me/friends?fields=name,picture,link', (response) =>
      $(@el).html @template(friends: response)
    this
