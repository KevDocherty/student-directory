@students = []
@DefaultFile = "students.csv"

def print_menu
  puts "1. Input the students"
  puts "2. Display the students"
  puts "3. Save the list to a file"
  puts "4. Load the students from a file"
  puts "9. Exit"
  puts "\n"
end

def show_students
  print_header
  print_students
  print_footer
end

def get_filename
  puts "Enter the filename including its extension: "
  #filename = gets.chomp
  @DefaultFile = gets.chomp
  #return filename
end

def save_students
  #filename = get_filename
  filename = @DefaultFile
  #file = File.open(@DefaultFile, "w")
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      new_line = student_data.join(", ")
    #file.puts csv_line
      #File.write(filename, new_line + "\n", mode: 'a')
      csv << new_line
    #File.write(filename, "\n")
    end
  #file.close
  #File.foreach(filename) do 
   # @students.each do |student|
      #student_data = [student[:name], student[:cohort]]
      #new_line = student_data.join(", ")
      #File.write(filename, new_line,mode: 'a')
      #filename.puts csv_line
    #end
  #end
  end
  puts "Students successfully added to file.\n"
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

#def load_students(filename = "students.csv")
def load_students(filename = @DefaultFile)
  #file = File.open("students.csv", "r")
  #if filename.nil?
  #userChoice = get_filename
  #end
  #if !userChoice.nil?
  #  filename = userChoice
  #end
  #file = File.open(filename, "r")
    #file.readlines.each do |line|
      #name, cohort = line.chomp.split(',')
      ##@students << {name: name, cohort: cohort.to_sym}
      #add_students(name, cohort)
    #end
  #file.close'''
  #File.foreach(filename) { |line|
  File.foreach(filename) do |line| 
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  if @students.length > 0
    puts "Students successfully loaded from file\n"
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  #return if filename.nil? # exit out of method if no filename provided
  if filename.nil?
    filename = @DefaultFile
  end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}\n\n"
  else
    puts "\nSorry #{filename} doesn't exist!\n\n"
    #puts DefaultFile
    #load_students(DefaultFile)
    #puts "Students loaded from #{filename}\n"
    #exit
    return
  end
end

def process(selection)
  case selection
    when "1"
      #@students = input_students
      input_students
    when "2"
      show_students
    when "3"
      get_filename
      save_students
    when "4"
      get_filename
      load_students
    when "9"
      exit
    else
      puts "I don't recognise that choice - try again"
  end
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
    puts "\n"
  end
end

def students_hard_coded
  students = [
    {name: "Dr. Hannibal Lecter", cohort: :november, hobies: "darts, farting"},
    {name: "Darth Vader", cohort: :june, hobies:  "darts, farting"},
    {name: "Nurse Ratched", cohort: :november, hobies:  "darts, farting"},
    {name: "Michael Corleone", cohort: :november, hobies:  "darts, farting"},
    {name: "Alex DeLarge", cohort: :june, hobies:  "darts, farting"},
    {name: "The Wicked Witch of the West", cohort: :november, hobies: "darts, farting"},
    {name: "Terminator", cohort: :november, hobies: "darts, farting"},
    {name: "Freddy Krueger", cohort: :november, hobies: "darts, farting"},
    {name: "The Joker", cohort: :june, hobies:  "darts, farting"},
    {name: "Joffrey Baratheon", cohort: :november, hobies:  "darts, farting"},
    {name: "Norman Bates", cohort: :june, hobies:  "darts, farting"}
  ]
  puts "\nHere are our students: "
  puts students
  return students
end

def input_students
  puts "Here enter the names and cohort of a student"
  puts "To finish, just hit <return> twice"
  # create an empty array
  #students = []
  while true do
    puts "Please enter the name of a student"
    name = STDIN.gets.chomp
    if name.empty?
      break
    end
    puts "And, their cohort?"
    #cohort = STDIN.gets.chomp.to_sym()
    cohort = STDIN.gets.chomp
    if cohort.empty?
      #cohort = "nov".to_sym()
      cohort = "nov"
    end
    # add the student hash to the array
    #@students << {name: name, cohort: cohort}
    add_students(name, cohort)
    if @students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
  end
  #return students
end

def subset_students
  puts "Input the first letter of the names of interest (blank if interested in all students): "
  letter = STDIN.gets.chomp
  puts "Input the maximum length of name of interest (blank if interested in all students): "
  name_length = STDIN.gets.chomp.to_i
  
  student_subset = @students
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
  #puts "The students of Villains Academy".center(75)
  puts "\nThe students of Villains Academy"
  puts "--------------------------------"
end

def print_students
  # puts "Will print students whose name begins with a given letter: "
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    #puts "\n"
  end
  puts "\n"
end

def print_students_by_cohort
  cohorts = []
  @students.each do |student|
    cohort = student[:cohort].to_s
    if !cohorts.include? cohort
      cohorts << cohort
    end
  end

  cohorts.each do |cohort|
    puts "This is the #{cohort} cohort:"
    puts "-----------------------------"
    @students.each do |student|
      if student[:cohort].to_s == cohort
        #puts student[:name].center(75)
        puts student[:name]
      end
    end
    puts "\n"
  end
end

def print_footer
  puts "\n"
  puts "Overall, we have #{@students.count} great students!"
  puts "\n"
end

#students = students_hard_coded
#students = input_students
#student_subset = subset_students(students)
#print(student_subset)
#print_students_by_cohort(student_subset)
#print_footer(student_subset)

require 'csv'
try_load_students
interactive_menu
