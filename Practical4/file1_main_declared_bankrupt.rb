require 'csv'
require_relative 'bank'
require_relative 'developer'

#This file should be run in the format "ruby file1_main_declared_bankrupt.rb bank_data.csv" in order to run.
#The bank_data.csv file is required for this project.

CSV.foreach(ARGV[0]) do |bank| 
	Bank.new_bank(bank[0].to_i,bank[1].to_i,bank[2].to_i,bank[3].to_i,bank[4],bank[5],bank[6].to_s)
end

$bank_list.each do |bank| puts bank.to_s end

developers = Array.new

jr = Developer.new_developer("Johnny Ronan",0,30000000,[$bank_list[0], $bank_list[1]], true)
bm = Developer.new_developer("Brendan Murtagh",0,100000000,[$bank_list[2]], true)
ml = Developer.new_developer("Michael Lowry",20000000,20000,[$bank_list[0], $bank_list[1],$bank_list[2]], false)
ab = Developer.new_developer("Aaron Brennan",0,69000000,[$bank_list[2]], true)
cd = Developer.new_developer("Conor Delaney",30000000,100000,[$bank_list[1]], false)

developers << jr
developers << bm
developers << ml
developers << ab
developers << cd

#Iterate through each developer, checking their solvency.
#The is_developer_solvent? method will move loans based on whether the
#developer is solvent or not. From there, we go through each of the banks that the
#developer owes money to and see if the bank is still solvent, as the developers
#voiding of their loans may force the bank to move loans to NAMA, based on Basil rules
developers.each do |developer| developer.is_developer_solvent?
	puts developer
	developer.owes_banks.each do |bank| 
		if bank.is_insolvent 
			then  bank.make_solvent 
		else 
			puts "#{bank.name} is still solvent." 
		end
	end
end