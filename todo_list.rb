require "./todo_item.rb"

class TodoList
  attr_reader :name, :todo_items

  def initialize(name)
    @name = name
    @todo_item = []
  end
end

todo_list = TodoList.new("Homework")
todo_item = TodoItem.new("read math chapter 4")

puts todo_list.inspect
puts todo_item.inspect
