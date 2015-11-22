module.exports = new class IndexController
    
  index: ->
    render 'index'
    .into '#content'