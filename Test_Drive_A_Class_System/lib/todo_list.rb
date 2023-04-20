class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    @todos << todo
  end

  def incomplete
    @todos.select do |todo|
      todo.done? == false
    end
  end

  def complete
    @todos.select do |todo|
      todo.done? == true
    end
  end

  def give_up!
    @todos.each do |todo|
      todo.mark_done!
    end  
  end
end