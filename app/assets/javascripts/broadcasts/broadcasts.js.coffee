$ ->
  $.ajaxSetup beforeSend: (xhr) ->
    token = $("meta[name='csrf-token']").attr("content")
    xhr.setRequestHeader "X-CSRF-Token", token

  $('body').on 'click', '.hide_broadcast', ->
    $id = $(@).data('id')
    $.ajax
      method: 'delete'
      url: "broadcasts/broadcasts/#{$id}"
