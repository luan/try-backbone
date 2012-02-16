window.currentUser = undefined

window.TryBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  updateUser: (response) ->
    if response.status is 'connected'
        FB.api '/me', (user) ->
          window.currentUser = user
          
          FB.api '/me/picture', (path) ->
            window.currentUser.picture = path
            $.event.trigger 'userStatusChanged', window.currentUser
          window.currentUser.accessToken = response.authResponse.accessToken
    else
      window.currentUser = false
      $.event.trigger 'userStatusChanged', window.currentUser

  init: ->
    new TryBackbone.Routers.Users
    Backbone.history.start pushState: true

    window.fbAsyncInit = =>
      FB.init
        appId: '249511985086492'
        status: true
        cookie: true
        xfbml: true

      FB.Event.subscribe 'auth.authResponseChange', @updateUser
      FB.getLoginStatus @updateUser

$ ->
  TryBackbone.init()

  js = document.createElement 'script'

  $(js).attr
    id: 'facebook-jssdk'
    async: true
    src: "//connect.facebook.net/en_US/all.js"

  $('head').append js
