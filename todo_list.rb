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

  def find_item(name, action="")
    found_item = "Item not found"
    todo_items.each do |item|  
      if item.name == name
        case action
        when 'Delete'
          todo_items.delete(item)
          found_item = item.name
          puts "#{name} removed successfully."
        when 'Mark Complete'
          # complete
        when "other"
          #do
        end
        found_item = item.name
      end
    end

    if found_item == "Item not found"
      puts "'#{name}' not found."      
    end
  end

  def remove_item(name)
    find_item(name, 'Delete')
  end

  def mark_complete(name)
    find_item(name, 'Mark Complete')
  end

end

todo_list = TodoList.new("Homework")
todo_list.add_item("math")
todo_list.add_item("history")

puts todo_list.inspect
todo_list.remove_item("math")

puts todo_list.inspect