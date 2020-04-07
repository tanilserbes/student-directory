def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #hobbie = gets.chomp #added hobbies ex.5
  #while the name is not empty, repeat this code
  while !name.empty?
    #add the student hash to the array
    students << {name: name, cohort: :november }
    #students << {name: name, cohort: :november, hobbies: :hobbie } #added hobbies ex.5
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
    #hobbie = gets.chomp #added hobbie ex.5
  end
  #return the array of input_students
  students
end
def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def print(names)
  #names.each_with_index do |student, number| #number before the name of each student
    #puts "#{number+1}. #{student[:name]} (#{student[:cohort]} cohort)" #exercises 0, 1
    #puts student[:name] if student[:name][0].upcase == "A" #print the student whose name begins with "a" letter, ex. 2
    #puts student[:name] if student[:name].gsub(/\s+/, "").length < 12 #  print the students whose name is shorter than 12 characters. ex 3
  #end

  #=begin # ex.4 prints all students using while
  #loop_number = 0
  #while names.length > loop_number
  #  puts names[loop_number][:name]
  #  loop_number += 1
  #end
  #=end

end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students =  input_students
print_header()
print(students)
print_footer(students)
