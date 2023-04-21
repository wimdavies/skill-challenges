class TodoList
  def initialize
    @todos = []
  end

  def add(todo)
    @todos << todo
  end

  def list_todos
    @todos
  end
end