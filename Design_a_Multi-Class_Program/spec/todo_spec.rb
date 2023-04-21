require 'todo'

RSpec.describe Todo do
  it "constructs" do
    todo_1 = Todo.new("Eat pizza")
    expect(todo_1.read_task).to eq "Eat pizza"
  end
end