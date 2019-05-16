def input_students
  puts "Please enter the names of the students & their data"
  puts "To finish, just hit return twice"
  students = []
  puts "Name:"
  name = gets.chomp
  while !name.empty? do
    puts "Nemisis:"
    nemisis = gets.chomp
    puts "Favourite colour:"
    color = gets.chomp
    students << {name: name, cohort: :november, nemisis: nemisis, color: color}
    puts "Now we have #{students.count} students"
    puts "Name:"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----"
end

def print(students)
  index = 0
  students.each_with_index do |student, index|
    index = students.index(student) + 1
    puts "#{index}. #{student[:name]} \
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