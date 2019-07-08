@students = [] # an empty array accessible to all methods
def input_students
  puts 'Please enter the names of students: '
  puts 'To finish, just hit return twice'
  #get the first name
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    #add the students hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #gets another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when  "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else "I don't know what you meant, try again please"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts '-------------'
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} #{student[:cohort]} cohort"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open file for writing
  file = File.open("students.csv","w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu