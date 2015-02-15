require "./todo_list.rb"

class Interface
  def initialize
    @menu_choices = [
      'Menu',
      'Create List',
      'Add Item',
      'Delete Item',
      'Mark Item as Complete',
      'Print List'
    ]
    @todo_list = TodoList.new("")
    control_loop('2')
  end

  def menu
    i=0
    puts "\nPlease select from the following:\n" + '-' * 40
    puts '* '+'Command/Description'.center(36) + ' *'
    @menu_choices.each do |choice| i+=1;
      puts '* ' + i.to_s + ' ' + choice.ljust(30,'.') + '*'.rjust(6)
    end
    puts '* '+'x Exit'.ljust(32,'.') + '*'.rjust(6) + "\n" +'-' * 40 
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
      when '1' then menu
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
        menu
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