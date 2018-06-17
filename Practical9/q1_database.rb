require 'active_record'

class Database

	def initialize#Create connection when database object is created.
		ActiveRecord::Base.establish_connection(:adapter => "sqlite3",:database => "database")
	end

	def self.up#Set up database tables.
		ActiveRecord::Schema.define do
 			create_table :users do |table|
 				table.column :name, :string
 				table.column :age, :integer
 			end

 			create_table :books do |table|
 				table.column :title, :string
 				table.column :borrowed_when, :datetime
 				table.column :due_back, :datetime
 				table.belongs_to :user, index: true
 			end
 		end
 	end

 	def self.down#Tear down database tables.
 		ActiveRecord::Schema.define do
 			drop_table :books
 			drop_table :users
 		end
 	end

end