// Generated by CoffeeScript 1.10.0
(function() {
  var Member;

  module.exports = new (Member = (function() {
    function Member() {}

    Member.prototype.store = [
      {
        username: "test",
        password: "123"
      }
    ];


    /* returns the user id */

    Member.prototype.register = function(username, password, email, phone, gender) {
      this.store.push({
        username: username,
        password: password,
        email: email,
        phone: phone,
        gender: gender
      });
      return this.store.length - 1;
    };

    Member.prototype.findByUsername = function(username) {
      var i, len, ref, user;
      ref = this.store;
      for (i = 0, len = ref.length; i < len; i++) {
        user = ref[i];
        if (user.username === username) {
          return user;
        }
      }
      return null;
    };

    return Member;

  })());

}).call(this);
