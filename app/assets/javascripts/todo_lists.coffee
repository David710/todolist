# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on "page:change", ->
  #rend la section list-todolist sortable
  $( ".content-todos-total" ).sortable
    axis: 'y'
    handle: '.handle-list'
    update: ->
      #console.log $(this).attr('data-todo-list-update-url')
      $.post( $(this).attr('data-todo-list-update-url') , $(this).sortable('serialize'),
      "jsonp" )
