def input_students
  puts "Please enter the names of the students: "
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.gsub("\n", "")
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.gsub("\n", "")
  end
  # return the array of students
  students
end

students = input_students

def print_header(students)
  return if students.empty?
  puts "The students of my cohort at Makers Academy"
  puts '-------------'
end

def print(students)
  return if students.empty?
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
    return if students.empty?
    puts "Overall, we have #{students.count} great students"
end

