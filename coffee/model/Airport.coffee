module.exports = new class Airport
  
  store:
    'MEL':
      name: 'Melbourne Airport'
      country: 'au'
    'CBR':
      name: 'Canberra International Airport'
      country: 'au'
    'AKL':
      name: 'Auckland Airport'
      country: 'nz'
    'SIN':
      name: 'Singapore Changi Airport'
      country: 'sg'
    'HKG':
      name: 'Hong Kong International Airport'
      country: 'hk'
    'HND':
      name: 'Tokyo International Airport'
      country: 'jp'
    'KIX':
      name: 'Kansai International Airport'
      country: 'jp'
    'ICN':
      name: 'Incheon International Airport'
      country: 'kr'
    'JFK':
      name: 'John F. Kennedy International Airport'
      country: 'us'
    'LCY':
      name: 'London City Airport'
      country: 'gb'
    'PEK':
      name: 'Beijing Capital International Airport'
      country: 'cn'
    'SZX':
      name: 'Shenzhen Baoan International Airport'
      country: 'cn'
  
  find: (id)->
    if @store.hasOwnProperty id then @store[id] else null