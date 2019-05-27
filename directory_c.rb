@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts "Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student_to_list(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def add_student_to_list(name, cohort)
  @students << {name: name, cohort: cohort}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def retrieve_filename
  puts "Enter a file name (eg. 'students.csv'):"
  STDIN.gets.chomp
end

def save_students
  filename = retrieve_filename
  File.open(filename, "w") do |file|# open the file for writing
    @students.each do |student|   # iterate over the array of students
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Number of students saved to file: #{@students.count}."
end


def try_load_students
  if ARGV.first != nil
    filename = ARGV.first # first argument from the command line
  else ARGV.empty?
    filename = "students.csv"
  end
  load_students(filename)
end

def load_students(filename = retrieve_filename)
  if File.exists?(filename)
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student_to_list(name, cohort.to_sym)
      end
    end
    puts "Students were loaded"
  else
    puts "Unable to load students (#{filename} does not exist)"
  end
end


try_load_students
interactive_menu