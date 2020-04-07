def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty?
    #add the student hash to the array
    students << {name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of input_students
  students
end
def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def print(names)
  names.each_with_index do |student, number| #number before the name of each student
    ##puts "#{number+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    puts student[:name] if student[:name][0].upcase == "A" #print the student whose name begins with "a" letter
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students =  input_students
print_header()
print(students)
print_footer(students)
