(function() {

  jQuery(function() {
    var greet, person;
    if ($('.chat').length > 0 && $('#conversation').attr('data-person').length > 0) {
      person = $('#conversation').attr('data-person');
      greet = function(person) {
        return console.log('Hello, ' + ("" + person) + '!');
      };
      return greet(person);
    }
  });

}).call(this);
