$ ->
  
  console.log( "Hello, " + $('.user_name').attr("user") + "!" )
  
  es = new EventSource('/stream')
  es.onmessage = (e) -> $('#chat').append(e.data + "\n")

  $("form").live 'submit', (e) ->
    $.post('/', {msg: $('.user_name').attr("user") + ": " + $('#msg').val()})

    $('#msg').val('')
    $('#msg').focus()

    e.preventDefault()
