# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on "page:change", ->
  #rend la section list-todolist sortable
  $( ".content-todos-total" ).sortable
    axis: 'y'
    handle: '.handle-list'
    opacity: 0.5
    placeholder: "sortable-placeholder"
    start: ( event, ui ) ->
      ui.helper.addClass('being-sorted')
    stop: ( event, ui ) ->
      ui.item.removeClass('being-sorted')
    update: ->
      $.post( $(this).attr('data-todo-list-update-url') , $(this).sortable('serialize'),
      "jsonp" )
