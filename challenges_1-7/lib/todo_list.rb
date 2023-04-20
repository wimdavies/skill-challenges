class TodoList
  def initialize
    @list = []
  end

  def add(task)
    @list << task
  end

  def list
    @list
  end

  def complete(task)
    fail "No such task found" unless @list.include? task
    @list.delete(task)
  end
end