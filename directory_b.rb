COHORTS = ["March", "April", "May", "June", "November"]
@students = []

def input_students
  puts "Please enter the names of the students & their data"
  puts "To finish, just hit return twice"
  puts "Name:"
  name = STDIN.gets.strip
  while !name.empty? do
    student_info = get_more_data
    @students << {name: name, cohort: student_info[0], nemisis: student_info[1], color: student_info[2]}
    puts "Now we have #{@students.count} students"
    puts "Name:"
    name = STDIN.gets.strip
  end
end

def get_more_data
  puts "Cohort:"
  unparsed_cohort = STDIN.gets.strip
  cohort = parse_cohort_input(unparsed_cohort)
  puts "Nemisis:"
  nemisis = STDIN.gets.strip.downcase.to_sym
  puts "Favourite colour:"
  color = STDIN.gets.strip.downcase.to_sym
  [cohort, nemisis, color]
end

def parse_cohort_input(input)
  if input == ""
    input = Time.now.strftime("%B")
  end
  until COHORTS.include? input
    puts "Cohort '#{input}' not valid. Make sure to enter full month name eg 'June':"
    puts "Active cohorts: #{COHORTS.join(", ")}"
    input = STDIN.gets.strip
  end
  cohort = input.capitalize.to_sym
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----".center(50,'*^~±§±~^*')
end

def print_student_list
  grouped_students = {}
  @students.each do |element|
    if !grouped_students.include? element[:cohort]
      grouped_students.store(element[:cohort], [])
    end
    grouped_students[element[:cohort]] << element[:name]
  end
  grouped_students.each do |cohort, name|
    puts cohort
    puts name
    puts
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student."
  else
    puts "Overall, we have #{@students.count} great students."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  if @students.count > 0
    print_header
    print_student_list
    puts
  end
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
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
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
