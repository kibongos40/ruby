class Task
  attr_accessor :title, :description, :due_date, :completed

  def initialize(title, description, due_date)
    @title = title
    @description = description
    @due_date = due_date
    @completed = false
  end

  def mark_as_completed
    @completed = true
  end

  def to_s
    "[#{completed ? 'X' : ' '}] #{@title} - #{@description} (Due: #{@due_date})"
  end
end

class TodoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def display_tasks
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

=begin
    TODO: Add more methods as needed
    Like: remove_task, mark_task_as_completed, etc
=end
end

# Create a new todo list
todo_list = TodoList.new

# Function to prompt user for task details and create a new task
def create_task
  puts "Enter task title:"
  title = gets.chomp

  puts "Enter task description:"
  description = gets.chomp

  puts "Enter due date (YYYY-MM-DD):"
  due_date = gets.chomp

  Task.new(title, description, due_date) # Learnt that Ruby can return the value of the last evaluated statement
end

# Prompt user to create tasks
loop do
  puts "Do you want to create a new task? (yes/no)"
  choice = gets.chomp.downcase

  break if choice != "yes"

  task = create_task
  todo_list.add_task(task)
end

# Display tasks
puts "Tasks:"
todo_list.display_tasks
