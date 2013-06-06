$ ->
  $('body').on 'click', '.hide_broadcast', ->
    $id = $(@).data('id')
    $broadcast = $(@).closest('.broadcast')
    $.ajax
      method: 'delete'
      url: "/broadcasts/close_broadcast/#{$id}"
      success: ->
        $broadcast.hide()

  $('body').on 'click', '.new_broadcasts', ->
    $.ajax
      method: 'post'
      url: '/broadcasts/broadcasts_list'
