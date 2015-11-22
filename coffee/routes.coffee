routes =
  '/'                         : 'IndexController@index'
  '/hotel/(.+)'               : 'HotelController@hotel_details'
  '/member'                   : 'MemberController@index'
  '/member/register'          : 'MemberController@register'
  '/member/register.do/(.+)'  : 'MemberController@register'
  '/member/login.do/(.+)'     : 'MemberController@login'
  '/member/logout'            : 'MemberController@logout'
  '/flight'                   : 'FlightController@index'

module.exports =
  run: ->
    $(window).on 'hashchange', ->
      $('#loader').fadeIn 250
      ### reset content ###
      path = if location.hash.startsWith '#!/' then location.hash.slice 2 else '/'
      for route in Object.keys routes
        regex = new RegExp('^' + route + '$')
        # console.log 'DEBUG>> ', path, '+', regex, '=', regex.test path
        continue if not regex.test path
        args = regex.exec path
        ### remove first item (path) from args ###
        args.shift()
        [controller, method] = routes[route].split '@'
        ### require the controller and pass the params ###
        controller = require 'controller/' + controller
        try
          controller[method].apply window, args
          $('#loader').fadeOut 250
          return
        catch e
          console.log e
          ### ignore to show 404 ###
      ### show 404 for unknown path ###
      render('404').into '#content'
      $('#loader').fadeOut 250