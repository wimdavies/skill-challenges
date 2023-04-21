require 'todo_list'

RSpec.describe TodoList do
  it "initially is empty" do
    todo_list = TodoList.new
    expect(todo_list.list_todos).to eq []
  end
end