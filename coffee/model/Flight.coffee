module.exports = new class Hotel
  
  store:
    'FK689':
      carrier: 'Fukien Airways'
      departure:
        time: '13:30'
        airport: 'HKG'
      arrival:
        time: '18:00'
        airport: 'HND'
    'CX911':
      carrier: 'Cathay Paficif'
      departure:
        time: '07:45'
        airport: 'KIX'
      arrival:
        time: '13:30'
        airport: 'ICN'
    'BA69':
      carrier: 'British Airways'
      departure:
        time: '08:30'
        airport: 'JFK'
      arrival:
        time: '22:30'
        airport: 'LCY'
    'PF64':
      carrier: 'Pacific Fly'
      departure:
        time: '10:30'
        airport: 'PEK'
      arrival:
        time: '18:00'
        airport: 'SZX'
    'SA456':
      carrier: 'Singapore Airlines'
      departure:
        time: '15:45'
        airport: 'SIN'
      arrival:
        time: '21:00'
        airport: 'HKG'
    'SA789':
      carrier: 'Singapore Airlines'
      departure:
        time: '14:00'
        airport: 'SIN'
      arrival:
        time: '23:45'
        airport: 'AKL'
    'VA80':
      carrier: 'Virgin Australia'
      departure:
        time: '05:45'
        airport: 'MEL'
      arrival:
        time: '11:00'
        airport: 'CBR'
  
  find: (id)->
    if @store.hasOwnProperty id then @store[id] else null
  
  all: ->
    @store