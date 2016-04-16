class TodoList < ActiveRecord::Base
  has_many :todo_items
  acts_as_list
end
