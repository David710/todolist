
var clickNewTodo = function() {
  //var $NewTodos = $(".bloc-todos").find( "label.new-todo" );
  var $NewTodos = $(".bloc-todos").find( "label.new-todo" );
  $NewTodos.off('click');
  $( "label.new-todo" ).click ( function ( event ) {
      console.log("function.js clickNewTodo");
      console.log(event.target);

     if ( $( event.target ).hasClass( "filled-in" ) &&  $( event.target ).hasClass( "new-todo" ) )
      {
        $target = $( this ).parent().find( "input[type=checkbox]" );
        console.log("target = " + $target)
        if ( $target.prop( "checked") == true ) {
          $target.prop( "checked", false);
        }
        else {
          $target.prop( "checked", true );
        };
      };
   });
};
