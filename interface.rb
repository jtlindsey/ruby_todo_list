require './todo_list.rb'

class Interface
  def initialize
    @todo_list = TodoList.new("Homework")
    control_loop('2')
  end

  def instructions
    puts 'Please select from the following:'
    puts '-' * 40
    puts 'Description'.ljust(30)                + 'Command'.rjust(10)
    puts 'Instructions'.ljust(30,'.')           + '1'.rjust(10)
    puts 'Create List'.ljust(30,'.')            + '2'.rjust(10)
    puts 'Add Item'.ljust(30,'.')               + '3'.rjust(10)
    puts 'Delete Item'.ljust(30,'.')            + '4'.rjust(10)
    puts 'Mark Item as Complete'.ljust(30,'.')  + '5'.rjust(10)
    puts 'Print List'.ljust(30,'.')             + '6'.rjust(10)
    puts 'Exit'.ljust(30,'.')                   + 'x'.rjust(10)
    puts '-' * 40    
  end

  def control_loop(start=nil)
    user_choice = ''
    loop do user_choice != 'x'
      if start == nil
      print 'Enter Command (or x to exit): '
      user_choice = gets.chomp.to_s.downcase
      else
        user_choice = start
        start = nil
      end

      case user_choice
      when '1' then instructions
      when '2' #create list
        puts "Enter a name of your list."
        user_input = gets.chomp
        @todo_list = TodoList.new(user_input)
        puts "'#{user_input}' created."
      when '3' #add item
        puts "Enter the name of item you want added to your list."
        user_input = gets.chomp
        @todo_list.add_item(user_input)

      when '4' #delete item

      when '5' #mark item as complete

      when '6' #print list

      when 'x' then goodbye
      else
        puts 'Invalid Choice.'
        instructions
      end

      break if user_choice == 'x'
    end      
  end

  def goodbye
    puts "Thank you for using the Ruby To-do list!\nGoodbye!\n\n"
  end

end

puts "\n* The Ruby To-do List *"
Interface.new