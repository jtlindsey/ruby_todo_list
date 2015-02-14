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

puts todo_item
puts todo_item.mark_complete!
puts todo_item
puts todo_item.mark_incomplete!
puts todo_item
