require 'todo'

RSpec.describe Todo do
  describe "#task" do
    it "returns task as string" do
      todo_1 = Todo.new("Eat your greens")
      expect(todo_1.task).to eq "Eat your greens"
    end

    it "returns another task as string" do
      todo_1 = Todo.new("Do your homework")
      expect(todo_1.task).to eq "Do your homework"
    end    
  end

  context "#done? returns false" do
    it "when a todo is still incomplete" do
      todo_1 = Todo.new("Do your homework")
      expect(todo_1.done?).to eq false
    end
  end

  describe "#mark_done!" do
    it "marks a todo as done" do
      todo_1 = Todo.new("Do your homework")
      todo_1.mark_done!
      expect(todo_1.done?).to eq true
    end
  end
end