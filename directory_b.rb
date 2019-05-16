def input_students
  puts "Please enter the names of the students & their data"
  puts "To finish, just hit return twice"
  students = []
  puts "Name:"
  name = gets.chomp
  while !name.empty? do
    student_info = get_more_data
    students << {name: name, cohort: :november, nemisis: student_info[0], color: student_info[1]}
    puts "Now we have #{students.count} students"
    puts "Name:"
    name = gets.chomp
  end
  students
end

def get_more_data
  puts "Nemisis:"
  nemisis = gets.chomp
  puts "Favourite colour:"
  color = gets.chomp
  [nemisis, color]
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----".center(50,'*^~±§±~^*')
end

def print(students)
  index = 0
  students.each_with_index do |student, index|
    index = students.index(student) + 1
    puts "#{index}. #{student[:name].ljust(20)} \
    (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
puts
print_footer(students)