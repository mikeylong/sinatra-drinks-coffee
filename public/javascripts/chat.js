(function() {

  jQuery(function() {
    var es;
    if ($('.chat').length > 0 && $('#conversation').attr('data-person').length > 0) {
      $('#msg').focus();
      es = new EventSource('/stream');
      es.onmessage = function(e) {
        return $('#conversation').prepend(e.data + "\n");
      };
      return $("form").live('submit', function(e) {
        $.post('/', {
          msg: $('#conversation').attr("data-person") + ": " + $('#msg').val()
        });
        $('#msg').val('');
        $('#msg').focus();
        return e.preventDefault();
      });
    }
  });

}).call(this);
