# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on "page:change", ->
  $( "#todo_item_description" ).focus()
  console.log( "ready!" )
  $( ".link_edit" ).click (event) -> 
    $form = $(this).next()
    $form.fadeToggle()
    console.log( $form )
#	  event.preventDefault()
#    $( ".form_edit" ).fadeToggle()
#    $( "#todo_item_description" ).focus()
		
