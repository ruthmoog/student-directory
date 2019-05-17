COHORTS = ["March", "April", "May", "June", "November"]

def input_students
  puts "Please enter the names of the students & their data"
  puts "To finish, just hit return twice"
  students = []
  puts "Name:"
  name = gets.strip
  while !name.empty? do
    student_info = get_more_data
    students << {name: name, cohort: student_info[0], nemisis: student_info[1], color: student_info[2]}
    puts "Now we have #{students.count} students"
    puts "Name:"
    name = gets.strip
  end
  puts student_info
  students
end

def get_more_data
  puts "Cohort:"
  unparsed_cohort = gets.strip
  cohort = parse_cohort_input(unparsed_cohort)
  puts "Nemisis:"
  nemisis = gets.strip.downcase.to_sym
  puts "Favourite colour:"
  color = gets.strip.downcase.to_sym
  [cohort, nemisis, color]
end

def parse_cohort_input(input)
  if input == ""
    input = Time.now.strftime("%B")
  end
  until COHORTS.include? input
    puts "Cohort '#{input}' not valid. Make sure to enter full month name eg 'June':"
    puts "Active cohorts: #{COHORTS.join(", ")}"
    input = gets.strip
  end
  cohort = input.capitalize.to_sym
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----".center(50,'*^~±§±~^*')
end

def print(students)
  grouped_students = {}
  students.each do |element|
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

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student."
  else
    puts "Overall, we have #{students.count} great students."
  end
end

students = input_students
if students.count > 0
  print_header
  print(students)
  puts
end
print_footer(students)

