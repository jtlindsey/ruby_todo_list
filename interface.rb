require "./todo_list.rb"

class Interface
  def initialize
    @todo_list = TodoList.new("")
    control_loop('2')
  end

  # def instructions
  #   puts 'Please select from the following:'
  #   puts '-' * 40
  #   puts 'Description'.ljust(30)                + 'Command'.rjust(10)
  #   puts 'Instructions'.ljust(30,'.')           + '1'.rjust(10)
  #   puts 'Create List'.ljust(30,'.')            + '2'.rjust(10)
  #   puts 'Add Item'.ljust(30,'.')               + '3'.rjust(10)
  #   puts 'Delete Item'.ljust(30,'.')            + '4'.rjust(10)
  #   puts 'Mark Item as Complete'.ljust(30,'.')  + '5'.rjust(10)
  #   puts 'Print List'.ljust(30,'.')             + '6'.rjust(10)
  #   puts 'Exit'.ljust(30,'.')                   + 'x'.rjust(10)
  #   puts '-' * 40    
  # end

  def instructions
    puts 'Please select from the following:'
    puts '-' * 40
    puts '* '+'Command/Description'.center(36)          + ' *'
    puts '* '+'1 -Instructions'.ljust(30,'.')           + '*'.rjust(8)
    puts '* '+'2 -Create List'.ljust(30,'.')            + '*'.rjust(8)
    puts '* '+'3 -Add Item'.ljust(30,'.')               + '*'.rjust(8)
    puts '* '+'4 -Delete Item'.ljust(30,'.')            + '*'.rjust(8)
    puts '* '+'5 -Mark Item as Complete'.ljust(30,'.')  + '*'.rjust(8)
    puts '* '+'6 -Print List'.ljust(30,'.')             + '*'.rjust(8)
    puts '* '+'x -Exit'.ljust(30,'.')                   + '*'.rjust(8)
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
      when '2'
        puts "Enter a name of your list."
        user_input = gets.chomp
        @todo_list = TodoList.new(user_input)
        puts "'#{user_input}' list created."
      when '3'
        puts "Enter the name of item you want added to your list."
        user_input = gets.chomp
        @todo_list.add_item(user_input)
      when '4'
        puts "Enter the name of item to remove."
        user_input = gets.chomp
        @todo_list.remove_item(user_input)
      when '5'
        puts "Enter the name of the item to mark complete"
        user_input = gets.chomp
        @todo_list.mark_complete(user_input)
      when '6' then puts @todo_list.print_list
      when 'x' then goodbye
      else
        puts 'Invalid Choice.'
        instructions
      end

      break if user_choice == 'x'
    end      
  end

  def goodbye
    puts "Thank you for using #{$program_name}!\nGoodbye.\n\n"
  end

end
$program_name = "The Ruby To-do List"
puts "\n* #{$program_name} *"
Interface.new