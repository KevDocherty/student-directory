# first, we print the list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit <return> twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code...
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
  ]
end

def subset_students(students)
  puts "Input the first letter of the names of interest (blank if interested in all students): "
  letter = gets.chomp
  puts "Input the maximum length of name of interest (blank if interested in all students): "
  name_length = gets.chomp.to_i
  
  student_subset = students
  if !letter.empty?
    student_subset = subset_by_first_letter(student_subset, letter)
  end
  if name_length > 0
    student_subset = subset_by_name_length(student_subset, name_length)
  end
  return student_subset
end

def subset_by_first_letter(students, letter)
  student_subset = []
  students.each do |student|
    if student[:name][0] == letter
      student_subset << student
    end
  end
  student_subset
end

def subset_by_name_length(students, name_length)
  student_subset = []
  students.each do |student|
    if student[:name].length <= name_length
      student_subset << student
    end
  end
  student_subset
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
  # puts "Will print students whose name begins with a given letter: "
  # students.each_with_index do |student, index|
  index = 0
  until index == students.length
    # puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students!"
end

students = input_students
student_subset = subset_students(students)
print(student_subset)
print_footer(student_subset)

