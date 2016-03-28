class TodoItemsController < ApplicationController
  
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
  end


  def new
    @todo_list = TodoList.find(params[:todo_list_id])
    respond_to do |format|
       format.html
       format.js
     end
  end

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    #@last = @todo_list.todo_items.maximum("position")
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    #@todo_item.position = @last + 1

    respond_to do |format|
      format.html { redirect_to todo_list_path(@todo_list) }
      format.js
    end
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

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
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

    respond_to do |format|
      format.html { redirect_to todo_list_path(@todo_list) }
      format.js
    end
  end

  private
    def todo_item_params
      params.require(:todo_item).permit(:description, :notes)
    end
end
