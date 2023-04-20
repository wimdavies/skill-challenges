class Todo
  def initialize(task)
    @task = task
    @doneness = false
  end

  def task
    @task
  end

  def mark_done!
    @doneness = true
  end

  def done?
    @doneness
  end
end