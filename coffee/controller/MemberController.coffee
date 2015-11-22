module.exports = new class HotelController
  
  index: ->
    if null isnt localStorage.getItem 'User' # render member index if logged in
      render('member/index').into '#content'
    else # else render register page
      render('member/login').into '#content'
      
  login: (data)->
    form = JSON.parse atob data
    Member = require 'model/Member'
    mem = Member.findByUsername form.username
    if null is mem or mem.password isnt form.password
      alert 'Incorrect username or password'
      location.hash = '#!/member'
    else
      localStorage.setItem 'User', mem.username
      location.hash = '#!/'
      
  logout: ->
    localStorage.removeItem 'User'
    location.hash = '#!/'
    
  register: (data)->
    if not data
      render('member/register').into '#content'
    else
      form = JSON.parse atob data
      for attr of form
        console.log attr + ': ' + form[attr]
      alert 'Registration success'
      location.hash = '#!/member'