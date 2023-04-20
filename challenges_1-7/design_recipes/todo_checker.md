# {{PROBLEM}} todo_checker Design

## 1. Describe the Problem

>As a user
>So that I can keep track of my tasks
>I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

checked = todo_checker(text)

text: a string (e.g. "#TODO")
checked: a boolean (e.g. true)

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
todo_checker("") => false
todo_checker("#TODO") => true
todo_checker("#todo") => false
todo_checker("TODO") => false
todo_checker("#ToDo") => false
todo_checker("#TODO: make tea") => true
todo_checker("#TODOmaketea") => true
todo_checker("make tea #TODO") => true
todo_checker() throws an error
todo_checker(123) throws an error
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._