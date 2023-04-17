require 'todo_list'

RSpec.describe TodoList do
  context "#list" do
    it "returns an empty list when nothing added" do
      todo_list = TodoList.new
      expect(todo_list.list).to eq []
    end

    it "returns list when one task added" do
      todo_list = TodoList.new
      todo_list.add("Go to shops")
      expect(todo_list.list).to eq ["Go to shops"]
    end

    it "returns list when multiple tasks added" do
      todo_list = TodoList.new
      todo_list.add("Go to shops")
      todo_list.add("Go to bed")
      expect(todo_list.list).to eq ["Go to shops", "Go to bed"]
    end
  end

  context "#complete" do
    it "returns correct list after a task is marked complete" do
      todo_list = TodoList.new
      todo_list.add("Go to shops")
      todo_list.add("Go to bed")
      todo_list.complete("Go to shops")
      expect(todo_list.list).to eq ["Go to bed"]
    end

    it "fails when asked to complete a task that does not exist" do
      todo_list = TodoList.new
      todo_list.add("Go to bed")
      expect { todo_list.complete("Go to shops") }.to raise_error "No such task found"
    end
  end
end