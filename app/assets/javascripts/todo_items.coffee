# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on "page:change", ->

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
      ui.helper.addClass('being-sorted')
    stop: ( event, ui ) ->
      ui.item.removeClass('being-sorted')
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'), "jsonp")


	#fait apparaitre la div id="task-form" sous le todo pour lequel on a appuyé sur le bouton
	# create todo
  $( ".add-todo-button > a" ).click (event) ->
    $( ".add-todo-button > a" ).show()
    $( '#task-form' ).remove()
    $(this).parents().append( "<div id='task-form' style='display:none;'></div>")
    $(this).hide()

	#fait apparaitre la div id="task-form-edit" sous le todo pour lequel on a appuyé sur le bouton
	# edit
  $( ".edit_tag > a" ).click (event) ->
    $( ".edit_tag > a" ).show()
    $( '#task-form-edit' ).remove()
    $( "<div id='task-form-edit' style='display:none;'></div>" ).insertAfter( $(this).parents("div.todo_item") )
    $(this).hide()



  # permet d'afficher le bouton new todo quand on click sur cancel dans la form trix
  $( "div.add-todo-button" ).click (event) ->
    $target = $(this).find("#form-cancel > a").attr('id')
    if event.target.id is $target
      event.preventDefault()
      $( '#task-form' ).remove()
      $( ".add-todo-button > a" ).show()

  # permet de cocher la check box d'un todoitem
  $( ".todos" ).click (event)->
    event.preventDefault()
    if $(event.target).hasClass( "filled-in" )
      $target = $(this).find("input[type=checkbox]")
      if $target.prop( "checked") is true
        $target.prop( "checked", false)
      else
        $target.prop( "checked", true )


  #cache la forme de saisie edit quand on click sur cancel
  $( "div.group-todos" ).click ( event ) ->
    $target = $( this ).find( "#task-form-edit #cancel-button-edit" ).attr( 'id')
    if event.target.id is $target
      event.preventDefault()
      $( '#task-form-edit' ).remove()
      $( ".edit_tag > a" ).show()
