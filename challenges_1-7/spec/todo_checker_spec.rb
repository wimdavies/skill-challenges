require 'todo_checker'

RSpec.describe "todo_checker method" do
  it "given an empty string, returns false" do
    result = todo_checker("")
    expect(result).to eq false
  end

  it "given '#TODO', returns true" do
    result = todo_checker("#TODO")
    expect(result).to eq true
  end

  it "given '#todo', returns false" do
    result = todo_checker("#todo")
    expect(result).to eq false
  end

  it "given 'TODO', returns false" do
    result = todo_checker("TODO")
    expect(result).to eq false
  end

  it "given '#ToDo', returns false" do
    result = todo_checker("#ToDo")
    expect(result).to eq false
  end

  it "given a valid string with '#TODO' as a header, returns true" do
    result = todo_checker("#TODO: make tea")
    expect(result).to eq true
  end

  it "given a valid string without spaces, returns true" do
    result = todo_checker("#TODOmaketea")
    expect(result).to eq true
  end

  it "given a valid string in unanticipated format, returns true" do
    result = todo_checker("make tea #TODO")
    expect(result).to eq true
  end

  it "throws an error when not given an argument" do
    expect { todo_checker(nil) }.to raise_error "Error: you must input text"
  end

  it "throws an error when given a non-string" do
    expect { todo_checker(123) }.to raise_error "Error: you must input a string"
  end
end