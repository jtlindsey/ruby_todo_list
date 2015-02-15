require './todo_list.rb'

class Interface
  def initialize
    todo_list = TodoList.new("Homework")
    control_loop
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
    puts 'Exit'.ljust(30,'.')                   + 'x'.rjust(10)
    puts '-' * 40    
  end

  def control_loop
    user_choice = ''
    loop do user_choice != 'x'
      print 'Enter Command (or x to exit): '
      user_choice = gets.chomp.to_s.downcase

      case user_choice
      when '1' then instructions
      when '2' #create list

      when '3' #add item

      when '4' #delete item

      when '5' #mark item as complete

      when 'x' then goodbye
      else
        puts 'Invalid Choice.'
        instructions
      end

      break if user_choice == 'x'
    end      
  end

  def goodbye
    puts "Thank you for using the Ruby todo list!\nGoodbye!\n\n"
  end

end

puts "The Ruby To-do List."
Interface.new