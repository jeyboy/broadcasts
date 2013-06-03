# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('body').on 'click', '.hide_broadcast', ->
    $id = $(@).data('id')
    alert($id)
    $.ajax
      url: '#'

  $('body').on 'click', '.new_broadcasts', ->
    alert('new')
    $.ajax
      url: '#'
