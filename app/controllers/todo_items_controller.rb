class TodoItemsController < ApplicationController
  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to todo_list_path(@todo_list)
  end
  
  def destroy
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.destroy
    redirect_to todo_list_path(@todo_list)
  end
  
  def completed
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.done == true
      @todo_item.update_attribute(:done, false)
    else
      @todo_item.update_attribute(:done, true)
    end
    
    redirect_to todo_list_path(@todo_list)
  end
  
  def edit
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
    
    respond_to do |format|
      format.html { redirect_to todo_list_path(@todo_list) }
      format.js
    end

  end
  
  def update
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.reload
 
    @todo_item.update(todo_item_params)
    redirect_to todo_list_path(@todo_list)
  end
  
  private
    def todo_item_params
      params.require(:todo_item).permit(:description)
    end
end
