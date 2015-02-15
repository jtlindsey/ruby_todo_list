require "./todo_item.rb"

class TodoList
  attr_reader :name, :todo_items, :complete_items, :incomplete_items

  def initialize(name)
    @name = name
    @todo_items = []
    @complete_items = []
    @incomplete_items = []
  end

  def add_item(name)
    todo_items.push(TodoItem.new(name))
  end

  def find_item(name, action="")
    found_item = false
    todo_items.each do |item|  
      if item.name == name
        found_item = true
        case action
        when 'Delete'
          todo_items.delete(item)
          puts "#{name} removed successfully."
        when 'Mark Complete'
          item.mark_complete!
          puts "#{name} marked complete."
        end
      end
    end
    puts "'#{name}' not found." if found_item == false
  end

  def remove_item(name)
    find_item(name, 'Delete')
  end

  def mark_complete(name)
    find_item(name, 'Mark Complete')
  end

  def print_list
    todo_items.each do |todo_item|
      complete_items << todo_item if todo_item.complete?
      incomplete_items << todo_item unless todo_item.complete?
    end
    puts "\n#{name} List - all items"
    puts "-" * 30
    puts "Incomplete Items"
    incomplete_items.each {|item| puts item}    
    puts "\nComplete Items"
    complete_items.each {|item| puts item}
    puts "-" * 30
  end

end

# todo_list = TodoList.new("Homework")
# todo_list.add_item("math")
# todo_list.add_item("history")
# todo_list.add_item("art")
# todo_list.mark_complete("history")

# puts todo_list.print_list