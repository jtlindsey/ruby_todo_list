class TodoItem
  attr_reader :name

  def initialize(name)
    @name = name
    @complete = false
  end

  def to_s
    if complete?
      puts "Complete Items\n"
      "[X] #{name}"
    else
      puts "Incomplete Items\n"
      "[ ] #{name}"
    end
  end

  def complete?
    @complete
  end

  def mark_complete! #modify internally
    @complete = true
  end

  def mark_incomplete!
    @complete = false
  end

end