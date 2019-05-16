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

#print the list of students
puts "The students of Villains Academy"
puts "-----"
students.each { |student| puts student }


#print the total number of students
puts "\nOverall, we have #{students.count} great students."