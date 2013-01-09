jQuery ->
  if $('.chat').length > 0 && $('.chat .name').attr('data-person').length > 0

    es = new EventSource('/stream')
    es.onmessage = (e) -> $('#conversation').append(e.data + "\n")

    $("form").live 'submit', (e) ->
      $.post('/', {msg: $('.chat .name').attr("data-person") + ": " + $('#msg').val()})

      $('#msg').val('')
      $('#msg').focus()

      e.preventDefault()
