module.exports = new class Hotel
  
  store:
    '13456':
      name: 'Shangri-la oriental hotel'
      rating: 5
  
  find: (id)->
    if @store.hasOwnProperty id then @store[id] else null
    
  update: (id, attrs = {})->
    if @store.hasOwnProperty id
      for attr of attrs
        @store[id][attr] = attrs[attr]