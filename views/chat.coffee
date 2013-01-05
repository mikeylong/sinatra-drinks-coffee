jQuery ->
  console.log( "Hello, " + $('.user_name').text() + "!" )
  
  es = new EventSource('/stream')
  es.onmessage = (e) -> $('#chat').append(e.data + "\n")

  $("form").live 'submit', (e) ->
    $.post('/', {msg: $('.user_name').text() + ": " + $('#msg').val()})

    $('#msg').val('')
    $('#msg').focus()

    e.preventDefault()
