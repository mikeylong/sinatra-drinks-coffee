jQuery ->
  if $('.chat').length > 0 && $('.chat .name').attr('data-person').length > 0

    person = $('.chat .name').attr('data-person')

    greet = (person) ->
      console.log( 'Hello, ' + "#{person}" + '!' )

    greet(person)