require "./todo_item.rb"

class TodoList
  attr_reader :name, :todo_items

  def initialize(name)
    @name = name
    @todo_items = []
  end

  def add_item(name)
    todo_items.push(TodoItem.new(name))
  end

  def remove_item(name)
    x = ""
    todo_items.each do |item|  
      if item.name == name
        todo_items.delete(item)
        x = "Item Removed."
      end
    end
    puts x == "Item Removed." ? "Item Removed." : "Item Not Found.";
  end

  # def remove_item(name)
  #   index = 0
  #   found = false
  #   todo_items.each do |todo_item|
  #     if todo_item.name == name
  #       found = true
  #     end
  #     if found
  #       break
  #     else
  #       index += 1
  #     end
  #   end
  #   if found
  #     todo_items.delete_at(index)
  #     return true
  #   else
  #     return false
  #   end
  # end

end

todo_list = TodoList.new("Homework")
todo_list.add_item("math")
todo_list.add_item("history")

puts todo_list.inspect
todo_list.remove_item("math")

puts todo_list.inspect