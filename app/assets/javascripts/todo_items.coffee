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

#rend la section de todos sortable				
  $( ".section.group-todos" ).sortable
    axis: "y"
				update: ->
						$.post($(this).data('update-url'), $(this).sortable('serialize'))
  
  $( ".section.group-todos" ).disableSelection();
		
		#fait apparaitre la div id="task-form" sous le todo pour lequel on a appuyé sur le bouton
		# create todo
		$( ".add-todo-button > a" ).click ->
    $( ".add-todo-button > a" ).show()			
    $( '#task-form' ).remove()			
    $(this).parents().append( "<div id='task-form' style='display:none;'></div>")			
		  $(this).hide()


#    $(this).parents(".todos").children(".wrap_menu").fadeOut( 100 )
#	  event.preventDefault()
#    $( ".form_edit" ).fadeToggle()
#    $( "#todo_item_description" ).focus()
		
