jQuery ->
  if $('.chat').length > 0 && $('#conversation').attr('data-person').length > 0

    person = $('#conversation').attr('data-person')

    greet = (person) ->
      console.log( 'Hello, ' + "#{person}" + '!' )

    greet(person)
