class TodoListsController < ApplicationController
  def new
  end
  
  def show
    @todo_list = TodoList.find(params[:id])
  end
  
  def create
    @todo_list = TodoList.new(todo_list_params)

    @todo_list.save
    redirect_to @todo_list
  end
  
  def index
    @todo_lists = TodoList.all
  end
  
  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
 
    redirect_to todo_lists_path
  end
  
  def sort
    @todo_list = TodoList.find(params[:id])
    
    params[:todo_item].each_with_index do |id, index|
      @mytodo = @todo_list.todo_items.find(id)
      @mytodo.position = index + 1
      @mytodo.save
    end
#    render nothing: true

   render :text => @mytodo.inspect

  end
  
  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
