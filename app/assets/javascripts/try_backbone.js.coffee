window.TryBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  currentUser: null
  updateUser: (response) ->
    if response.status is 'connected'
        uid = response.authResponse.userID
        accessToken = response.authResponse.accessToken
        console.log
          facebook:
            uid: uid
            token: accessToken
      else if response.status is 'not_authorized'
        console.log 'logged in, not authorized'
      else
        console.log 'not logged in'

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
