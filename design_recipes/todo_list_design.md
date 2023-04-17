# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a 
> list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them
> disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class TodoList
  def initialize
    # ...
  end

  def add(task) # task is a string representing a task
    # returns nothing
  end

  def list 
    # returns a list of tasks as strings
    # except any tasks marked as complete
  end

  def mark_complete(task)
    # returns nothing
    # fails if task does not exist in list 
  end
end

```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

# 1 empty list when nothing added
todo_list = TodoList.new
todo_list.list # => []

# 2 
todo_list = TodoList.new
todo_list.add("Go to shops")
todo_list.list # => ["Go to shops"]

# 3
todo_list = TodoList.new
todo_list.add("Go to shops")
todo_list.add("Go to bed")
todo_list.list # => ["Go to shops", "Go to bed"]

# 4
todo_list = TodoList.new
todo_list.add("Go to shops")
todo_list.add("Go to bed")
todo_list.complete("Go to shops")
todo_list.list # => ["Go to bed"]

# 5 
todo_list = TodoList.new
todo_list.add("Go to bed")
todo_list.complete("Go to shops") # fails "No such task found"

```

```ruby
# EXAMPLE

# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
