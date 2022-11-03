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
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
  # puts "Will print students whose name begins with a given letter: "
  # letter = gets.chomp
  students.each_with_index do |student, index|
    # if student[:name][0] == letter
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    # end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students!"
end

students = input_students
puts "Input the first letter of the names of interest (blank if interested in all students): "
letter = gets.chomp
puts "Input the maximum length of name of interest (blank if interested in all students): "
name_length = gets.chomp.to_i
puts name_length
puts name_length.class
if !letter.empty? 
  student_subset = []
  students.each do |student|
    if student[:name][0] == letter
      student_subset << student
    end
  end
  print(student_subset)
  print_footer(student_subset)
elsif name_length > 0
  student_subset = []
  students.each do |student|
    if student[:name].length <= name_length
      puts student[:name].length
      student_subset << student
    end
  end
  print(student_subset)
  print_footer(student_subset)
else
  print(student_subset)
  print_footer(student_subset)
  print(students)
  print_footer(students)
end
