$ ->
  $('body').on 'click', '.hide_broadcast', ->
    $id = $(@).data('id')
    $broadcast = $(@).closest('.broadcast')
    $.ajax
      method: 'delete'
      url: "broadcasts/broadcasts/#{$id}"
      success: ->
        $broadcast.hide()

  $('body').on 'click', '.new_broadcasts', ->
    $.ajax
      method: 'get'
      url: 'broadcasts/broadcasts'
