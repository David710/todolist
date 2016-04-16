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
    @todo_lists = TodoList.order("position")
  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy

    redirect_to todo_lists_path
  end

  def sort
#    @todo_list = TodoList.find(params[:id])
    params[:todo_list].each_with_index do |id, index|
#      TodoList.update_all( { position: index + 1 }, { id: id } )
      @mylist= TodoList.find(id)
      @mylist.position = index + 1
      @mylist.save
    end
    render nothing: true
  end


  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
