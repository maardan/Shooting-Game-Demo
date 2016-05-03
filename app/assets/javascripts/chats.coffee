# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# New Faye client and attaching it to the window object
window.client = new Faye.Client('/faye', {retry: 3})

jQuery ->
  $('#new_chat').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)

  try
    client.unsubscribe '/chats'
  catch
    console?.log "Can't unsubscribe."

# Subscribe the client to the /chats channel
  client.subscribe '/chats', (payload) ->
    $('#chats').find('.media-list').prepend(payload.message) if payload.message
