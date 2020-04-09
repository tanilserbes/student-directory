require 'csv'
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save file"
  puts "4. Load file"
  puts "9. Exit"
  puts " "
end

def process(selection)

  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit
  else puts "I don't know what you meant, try again"
    end
end

def input_students
  loop do
    puts "Please enter the names of the students"
    puts "To finish please enter 1234"
    name = STDIN.gets.chomp
    break if name == "1234"
    puts "Please, enter the cohort term"
    cohort = STDIN.gets.chomp
    students_array(name,cohort)
    puts "Now we have #{@students.count} students"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
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

  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    cvs_line = student_data.join(",")
    CSV.parse(cvs_line)
  end
  puts "File have been saved!"
end
  #File.open(@filename, "w") do |f2|
  #  @students.each do |student|
  #    student_data = [student[:name],student[:cohort]]
  #    cvs_line = student_data.join(",")
  #    f2.puts cvs_line
   #end
#end
  #puts "File have been saved!"
  #file = File.open(filename, "w")
  #@students.each do |student|
  #  student_data = [student[:name],student[:cohort]]
  #  cvs_line = student_data.join(",")
  #  file.puts cvs_line
  #end
  #file.close
  #puts "File have been saved!" #w14, 2.4

#end

def try_load_students
  @filename = ARGV.first
  return load_students("students.csv") if @filename.nil?  #w14 2.2
  if File.exists?(@filename)
    load_students(@filename)
    puts "Loaded #{@students.count} form #{@filename}"
  else
    puts "Sorry, #{@filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  select_file
  CSV.foreach(@filename) do |row1|
    name, cohort = row1
    students_array(name,cohort)
  end
end

  #File.open(@filename, "r") do |f1| #w14, 2.6
      #name, cohort = f1
      #students_array(name, cohort)
    #end
    #puts "File has been loaded!"
  #end
  #file = File.open(@filename, "r")
  #file.readlines.each do |line|
    #name, cohort = line.chomp.split(',')
    #students_array(name, cohort)
  #end
  #file.close
  #puts "File has been loaded!" #w14, 2.4
#end


def students_array(name, cohort) #w14, 2.1
   @students << {name: name, cohort: cohort.to_s}
end

def select_file #w14, 2.5
  file = Dir.glob("*csv")
  print file
  puts ""
  puts "Please type the files you'd like to select from below"
  @filename = STDIN.gets.chomp
end



try_load_students
interactive_menu
