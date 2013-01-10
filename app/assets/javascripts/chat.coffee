jQuery ->
  if $('.chat').length > 0 && $('#conversation').attr('data-person').length > 0

    $('#msg').focus()

    es = new EventSource('/stream')
    es.onmessage = (e) -> $('#conversation').prepend(e.data + "<br><br>")

    $("form").live 'submit', (e) ->
      $.post('/', {msg: $('#conversation').attr("data-person") + ": " + $('#msg').val()})

      $('#msg').val('')
      $('#msg').focus()

      e.preventDefault()
