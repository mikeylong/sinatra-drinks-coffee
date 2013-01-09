jQuery ->
  if $('.chat').length > 0 && $('.chat .name').attr('data-person').length > 0
  
    console.log( "Hello, " + $('.chat .name').attr("data-person") + "!" )
  
    es = new EventSource('/stream')
    es.onmessage = (e) -> $('#conversation').append(e.data + "\n")

    $("form").live 'submit', (e) ->
      $.post('/', {msg: $('.chat .name').attr("data-person") + ": " + $('#msg').val()})

      $('#msg').val('')
      $('#msg').focus()

      e.preventDefault()
