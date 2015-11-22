# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on "page:change", ->
  #donne le focus à la barre de saisie des todos
#  $( "#todo_item_description" ).focus()

  #fait appraitre la forme de saisie "edit" et lui donne le focus
  $( ".link_edit" ).click (event) -> 
    $form = $(this).parents(".todos").children(".form_edit")
    $form.fadeToggle()
    $input = $form.children("form").children("div").children("div").children("input")
    $input.focus()

  #fait apparaitre les icones delete et edit qd on passe la sourie sur le todo
  $( ".todos" ).mouseenter (event) -> 
    $(this).children(".wrap_menu").css("display", "inline-block")

  $( ".todos" ).mouseleave (event) -> 
    $(this).children(".wrap_menu").css("display", "none")
				
  $( ".section.group-todos" ).sortable
    axis: "y"
				update: ->
						$.post($(this).data('update-url'), $(this).sortable('serialize'))
  
  $( ".section.group-todos" ).disableSelection();


#    $(this).parents(".todos").children(".wrap_menu").fadeOut( 100 )
#	  event.preventDefault()
#    $( ".form_edit" ).fadeToggle()
#    $( "#todo_item_description" ).focus()
		
