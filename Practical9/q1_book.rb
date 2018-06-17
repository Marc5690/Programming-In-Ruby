require 'active_record'

class Book < ActiveRecord::Base
	
	belongs_to :borrower, :class_name => 'User', :foreign_key => 'user_id'

	def to_s #Find the current borrower of this book using a Finder method.
		@user = User.find_by_id(self.user_id) ? User.find_by_id(self.user_id) : ""
		"Title: #{self.title}, Borrowed: #{self.borrowed_when}, Due: #{self.due_back}"
	end
end