class AddNotesToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :notes, :text
  end
end
