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

  $( ".todos" ).mouseenter (event) -> 
    $(this).children(".wrap_menu").css("display", "inline-block")
    console.log( "coucou" )

  $( ".todos" ).mouseleave (event) -> 
    $(this).children(".wrap_menu").css("display", "none")
    console.log( "yo" )

#    $(this).parents(".todos").children(".wrap_menu").fadeOut( 100 )
#	  event.preventDefault()
#    $( ".form_edit" ).fadeToggle()
#    $( "#todo_item_description" ).focus()
		
