module.exports = new class Member
  
  store: [
    {username: "test", password: "123"}
  ]
  
  ### returns the user id ###
  register: (username, password, email, phone, gender)->
    @store.push
      username: username
      password: password
      email: email
      phone: phone
      gender: gender
    @store.length - 1
    
  findByUsername: (username)->
    for user in @store
      return user if user.username is username
    null