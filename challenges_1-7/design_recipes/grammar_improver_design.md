# {{PROBLEM}} grammar_improver Method Design

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a > suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

boolean_return = grammar_improver(text)

text = a string (e.g. "Grammatically correct.")
boolean_return = a boolean (e.g. true)

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

grammar_improver("") => false
grammar_improver("Grammatically correct.") => true
grammar_improver("Grammatically correct!") => true
grammar_improver("Grammatically correct?") => true
grammar_improver("Grammatically correct/") => false
grammar_improver("grammatically correct") => false
grammar_improver("grammatically correct.") => false
grammar_improver("grammatically correct!") => false
grammar_improver("grammatically correct?") => false
grammar_improver("grammatically correct/") => false
grammar_improver() throws an error "Input must be a string"
grammar_improver(7) throws an error "Input must be a string"


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._