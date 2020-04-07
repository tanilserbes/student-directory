def input_students
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  puts "Enter the student name"
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty?
    puts "Enter student's hobbie"
    hobbie = gets.chomp#added hobbies ex.5,7
    hobbie != "" ? hobbie.to_sym : hobbie = :no_hobbie #EX 7
    #add the student hash to the array
    #students << {name: name, cohort: hobbie }
    puts "Is there any mistake in your last student, this is last exit before the bridge!" #EX 7
    puts "Do you wanna (C)hange or (K)eep it. Press C or. K" #EX 7
    input = gets.chomp #EX 7
    if input == "K" #EX 7
      students << {name: name, cohort: :november, hobbie: hobbie } #added hobbies ex.5 #EX 7
      if students.count > 1 #EX NUM 9
       puts "Now we have #{students.count} students"
      else
        puts "Now we have #{students.count} student"
      end
    end #EX 7

    #get another name from the user
    puts "Enter the student name"
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
  #names.each_with_index do |student, number| #number before the name of each student
    #puts "#{number+1}. #{student[:name].center(10)} (#{student[:cohort]} cohort)" #exercises 0, 1 # center() method try  ex. 6
    #puts student[:name] if student[:name][0].upcase == "A" #print the student whose name begins with "a" letter, ex. 2
    #puts student[:name] if student[:name].gsub(/\s+/, "").length < 12 #  print the students whose name is shorter than 12 characters. ex 3
    #puts "#{number+1}. #{student[:name].center(10)} #{student[:cohort]} cohort #{student[:hobbie]} " # EX 7
  #end

  #=begin # ex.4 prints all students using while
  #loop_number = 0
  #while names.length > loop_number
  #  puts names[loop_number][:name]
  #  loop_number += 1
  #end
  #=end
number =0
  names.map do |student|
    if student[:hobbie ] == 'basket'
      puts "#{number+1}. #{student[:name].center(10)} (#{student[:cohort]} cohort)" #ex num8 instead of cohort, ordered in  hobbies
      number += 1
    end
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
