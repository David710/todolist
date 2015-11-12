# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on "page:change", ->
  $( "#todo_item_description" ).focus()
  console.log( "ready!" )
  $( ".link_edit" ).click (event) -> 
    $form = $(this).parents(".todos").children(".form_edit")
    $form.fadeToggle()
    console.log( $form )
  $( "label" ).mouseenter (event) -> 
    $(this).parents(".todos").children(".wrap_menu").css("display", 'inline-block').fadeIn(500)
    console.log( "coucou" )
  $( "label" ).mouseleave (event) -> 
    $(this).parents(".todos").children(".wrap_menu").delay( 800 ).fadeOut(800).css("display", 'inline-block')
		
	
	

#    $(this).parents(".todos").children(".wrap_menu").fadeOut( 100 )
#	  event.preventDefault()
#    $( ".form_edit" ).fadeToggle()
#    $( "#todo_item_description" ).focus()
		
