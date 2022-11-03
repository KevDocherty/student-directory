# first, we print the list of students
def students_hard_coded
  students = [
    {name: "Dr. Hannibal Lecter", cohort: :november, hobies: "darts, farting"},
    {name: "Darth Vader", cohort: :november, hobies:  "darts, farting"},
    {name: "Nurse Ratched", cohort: :november, hobies:  "darts, farting"},
    {name: "Michael Corleone", cohort: :november, hobies:  "darts, farting"},
    {name: "Alex DeLarge", cohort: :november, hobies:  "darts, farting"},
    {name: "The Wicked Witch of the West", cohort: :november, hobies: "darts, farting"},
    {name: "Terminator", cohort: :november, hobies: "darts, farting"},
    {name: "Freddy Krueger", cohort: :november, hobies: "darts, farting"},
    {name: "The Joker", cohort: :november, hobies:  "darts, farting"},
    {name: "Joffrey Baratheon", cohort: :november, hobies:  "darts, farting"},
    {name: "Norman Bates", cohort: :november, hobies:  "darts, farting"}
  ]
  puts "Here are our students: "
  puts students
  return students
end

def input_students
  puts "Here enter the names and cohort of a student"
  puts "To finish, just hit <return> twice"
  # create an empty array
  students = []
  while true do
    puts "Please enter the name of a student"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "And, their cohort?"
    cohort = gets.chomp.to_sym()
    if cohort.empty?
      cohort = "nov".to_sym()
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  end
  return students
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
  students.each_with_index do |student, index|
  # index = 0
  # until index == students.length
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
    # student_details = "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort) - hobies: #{students[index][:hobies]}"
    #student_details = "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)}"
    # puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort) - hobies: #{students[index][:hobies]}"
    # puts student_details.center(75)
    # index += 1
  end
end

def print_footer(students)
  puts "\n"
  puts "Overall, we have #{students.count} great students!".center(75)
end

students = students_hard_coded
#students = input_students
student_subset = subset_students(students)
print(student_subset)
print_footer(student_subset)

