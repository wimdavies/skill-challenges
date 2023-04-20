require 'todo'
require 'todo_list'

RSpec.describe 'integration' do
  context "#adds some todos" do
    it "and returns them as incomplete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Eat your greens")
      todo_2 = Todo.new("Do a barrel roll")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end
  end

  context "when there is one complete todo" do
    it "#complete returns that todo" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Eat your greens")
      todo_list.add(todo_1)
      todo_1.mark_done!
      expect(todo_list.complete).to eq [todo_1]
    end
  end

  context "when some are marked as done" do
    it "#incomplete returns the remaining todos" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Eat your greens")
      todo_2 = Todo.new("Do a barrel roll")
      todo_3 = Todo.new("Be a monkey")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_1.mark_done!
      expect(todo_list.incomplete).to eq [todo_2, todo_3]
    end

    it "#complete returns only completed todos" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Eat your greens")
      todo_2 = Todo.new("Do a barrel roll")
      todo_3 = Todo.new("Be a monkey")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_1.mark_done!
      expect(todo_list.complete).to eq [todo_1]
    end
  end

  context "#give_up! marks all as complete" do
    it "and returns all as completed" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Eat your greens")
      todo_2 = Todo.new("Do a barrel roll")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo_1, todo_2]
    end

    it "#incomplete returns empty" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Eat your greens")
      todo_2 = Todo.new("Do a barrel roll")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.incomplete).to eq []
    end
  end
end