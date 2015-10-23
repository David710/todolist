class TodoItemsController < ApplicationController
  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to todo_list_path(@todo_list)
  end
 
  private
    def todo_item_params
      params.require(:todo_item).permit(:description)
    end
end
