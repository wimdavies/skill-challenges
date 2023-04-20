## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

```ruby
text_time = reading_time(text)

text = a given string (e.g. "Like this string here")
text_time: float numeral fraction of a minute  (e.g. 0.0005)
```
_Include the name of the method, its parameters, return value, and side effects._

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

reading_time("") => 0.0
reading_time("text") => 0.005
reading_time("text " * 200) => 1.0
reading_time("texttexttext") => 0.005
reading_time(nil) throws an error
reading_time(666) throws an error

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

