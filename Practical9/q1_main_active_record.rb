require 'active_record'
require_relative 'q1_book'
require_relative 'q1_user'
require_relative 'q1_database'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3",:database => "database")


@db = Database.new #Create database object and set up table schema
Database.up

#Create data for database.
Book.create(:title => 'The War Of Art', :borrowed_when => '11-11-2014', :due_back => '11-11-2015')
Book.create(:title => "World War Z", :borrowed_when => '10-03-2014', :due_back => '10-03-2015')
Book.create(:title => "Head First Ruby", :borrowed_when => '09-04-2014', :due_back => '09-04-2015')
User.create(:name => 'Marc Laffan', :age => '25')
User.create(:name => 'Ruby', :age => '20')
User.create(:name => "Bill", :age => '18')
User.create(:name => "Bob", :age => '19')

#Use Finder methods to retrieve records.
@marc = User.find_by_name("Marc Laffan")
@wwz = Book.find_by_title("World War Z")
@hfr = Book.find_by_title("Head First Ruby")

#Conditional queries based on age and overdue books.
@young_people = User.where("age < 19")
@old_people = User.where("age >= 19")
@overdue = Book.where("due_back > DATE()")

#Borrow the books "World War Z" and "Head First Ruby" with the "Marc Laffan" user.
@marc.borrow_books(@wwz,@hfr)

puts "#{@marc.name} has borrowed book(s) #{@marc.books.each do |book| '#{book.to_s}' end}"
puts "\n"

@marc.return_book(@hfr)

puts "#{@marc.name} has returned #{@hfr}"
puts "\n"

puts "#{@marc.name} currently has borrowed book(s) #{@marc.books.each do |book| '#{book.to_s}' end}"
puts "\n"

puts "The youth of today:\n"
puts @young_people
puts "\n"

puts "And the older crowd:\n"
puts @old_people
puts "\n"

puts "Overdue books:\n"
puts @overdue

Database.down