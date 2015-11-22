module.exports = new class HotelController
    
  hotel_details: (id)->
    Hotel = require 'model/Hotel'
    Hotel.update id,
      name: 'Century Hotel @ ' + (+new Date/1000|0)
      rating: 3
    hotel = Hotel.find id
    if hotel isnt null
      renderer = render 'hotel/details'
      .data
        'hotel_id': id
        'hotel_name': hotel.name
        'hotel_rating': '★'.repeat(hotel.rating)
    else
      renderer = render '404'
    renderer.into '#content'