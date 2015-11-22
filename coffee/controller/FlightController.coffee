module.exports = new class FlightController
  
  index: (id)=>
    Flight = require 'model/Flight'
    flights = Flight.all()
    render 'flight/index'
    .with
      flights: flights
      Airport: require 'model/Airport'
    .into '#content'