(function() {

  jQuery(function() {
    var es;
    if ($('.chat').length > 0 && $('.chat .name').attr('data-person').length > 0) {
      es = new EventSource('/stream');
      es.onmessage = function(e) {
        return $('#conversation').append(e.data + "\n");
      };
      return $("form").live('submit', function(e) {
        $.post('/', {
          msg: $('.chat .name').attr("data-person") + ": " + $('#msg').val()
        });
        $('#msg').val('');
        $('#msg').focus();
        return e.preventDefault();
      });
    }
  });

}).call(this);
