require 'todo_list'
require 'todo'

RSpec.describe "todo integration" do
  it "adds todos to a list" do
    todo_list = TodoList.new
    todo_1 = Todo.new("Wash the dog")
    todo_2 = Todo.new("Wash the dishes")
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_list.list_todos # => [todo_1, todo_2]
  end
end