###
# require modules
# @http://stackoverflow.com/a/19625245/3896501
###
window.require = (url)->
  url += '.js'
  require.cache = [] if not require.cache
  exports = require.cache[url]
  if !exports # not cached
    try
      exports = {}
      # load synchronously
      X = new XMLHttpRequest
      X.open 'GET', 'js/' + url, no
      X.send()
      throw new Error X.statusText if X.status isnt 200
      module = 
        id: url
        uri: url
        exports: exports
      fn = new Function 'require', 'exports', 'module', X.responseText
      fn require, exports, module
      require.cache[url] = exports = module.exports
    catch err
      throw new Error 'Error loading module ' + url + ': ' + err.message
  exports
  
window.render = (view)->
  view += '.html'
  render.cache = [] if not render.cache
  html = render.cache[view]
  if !html # not cached
    try
      # load synchronously
      X = new XMLHttpRequest
      X.open 'GET', 'html/' + view, no
      X.send()
      throw new Error X.statusText if X.status isnt 200
      render.cache[view] = html = X.responseText
    catch err
      throw new Error 'Error loading view ' + view + ': ' + err.message
  ### export render object ###
  exports =
    _objs: {}
    _data: {}
    with: (objects)->
      @_objs = objects
      @
    data: (data)->
      @_data = data
      @
    into: (selector)->
      ### replace data strings ###
      for repl in Object.keys @_data
        html = html.replace '{{' + repl + '}}', @_data[repl]
      ### call scripts with passed objects ###
      postInsert = []
      div = document.createElement 'div'
      div.innerHTML = html
      scripts = div.getElementsByTagName 'script'
      i = scripts.length
      while i--
        ### eval the function with passed objects ###
        args = Object.keys @_objs
        vals = args.map ((k)-> @_objs[k]), @
        args.push scripts[i].innerHTML
        fn = Function.bind.apply Function, [null].concat args
        postInsert.push [new fn, vals]
        ### remove <script> node from tree ###
        scripts[i].parentNode.removeChild scripts[i]
      $(selector).html div.innerHTML
      postInsert.forEach (s, i)->
        s[0].apply window, s[1]
        
$.fn.serializeBase64 = ->
  form = {}
  $.each $(this).serializeArray(), (i, field)->
    form[field.name] = field.value or ''
  btoa JSON.stringify form

$(document).ready ->
  Routes = require 'routes'
  Routes.run()
  ### trigger hashchange for view ###
  $(window).trigger 'hashchange'