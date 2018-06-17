require 'active_record'

class User < ActiveRecord::Base

	has_many :books

	#Borrow multiple books (or just one) and add to users' list of currently borrowed books.
	def borrow_books(*books)
		books.each do |book|
			if self.books.include?(book)
				puts "#{self.name} has already checked this book out!"
			else
				self.books << book
			end
		end
	end

	#Return a book (Basically remove it from the users list of borrowed books).
	def return_book(book)
		if self.books.include?(book)
			puts "Returned #{book.title}"
			self.books.delete(book)
		else
			puts "#{self.name} could not return this book as they no longer have it!"
		end
	end

	def to_s
		"Name: #{self.name}, Age: #{self.age}"
	end

end