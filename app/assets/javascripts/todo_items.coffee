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
    handle: '.handle'
    start: ( event, ui ) ->
      #console.log $(this).find(".todo_item").first()
      #$(this).find(".todo_item").first().css("background-color", "red")
      console.log ui.helper
      ui.helper.addClass('being-sorted')
    stop: ( event, ui ) ->
      ui.item.removeClass('being-sorted')

				update: ->
						$.post($(this).data('update-url'), $(this).sortable('serialize'), "jsonp")
      console.log( $(this).sortable('serialize') );


  $( ".section.group-todos" ).disableSelection();

		#fait apparaitre la div id="task-form" sous le todo pour lequel on a appuyé sur le bouton
		# create todo
  $( ".add-todo-button > a" ).click (event) ->
    $( ".add-todo-button > a" ).show()
    $( '#task-form' ).remove()
    $(this).parents().append( "<div id='task-form' style='display:none;'></div>")
    $(this).hide()

# permet d'afficher le bouton new todo quand on click sur cancel dans la form trix
  $( "div.add-todo-button" ).click (event) ->
    test = $(this).find("#form-cancel > a").attr('id')
    if event.target.id is test
      event.preventDefault()
      $( '#task-form' ).remove()
      $( ".add-todo-button > a" ).show()

  #permet de cocher la check box d'un todoitem
  $( ".todos" ).click (event)->
    if $(event.target).hasClass( "filled-in" )
      $target = $(this).find("input[type=checkbox]")
      if $target.prop( "checked") is true
        $target.prop( "checked", false)
      else
        $target.prop( "checked", true )
