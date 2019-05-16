# store student names in array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Kruger",
"The Joker",
"Joffrey Barathron",
"Norman Bates"
]

def print_header
  puts "The students of Villains Academy"
  puts "-----"
end

def print(names)
  names.each { |student| puts student }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print(students)
puts
print_footer(students)