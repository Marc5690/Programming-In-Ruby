require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.cs.ucd.ie/About/"))
elements = doc.xpath('/')#Get all elements on the web page

puts "The full page:\n"
puts elements
puts "\n"
puts "\n"
puts "\n"

first_five = []#An array to hold the first five elements in the web page.
elements.each do |element| #Go through every element on the web page.
	element.traverse {|node| 
		if first_five.size < 5 then #We only want the first five elements. Add them to the first_five array.
			first_five << node
		end
	} 
end

#Print out some details on the elements 
puts "Type: " + first_five[0].name
puts first_five[0].inspect
puts "Content: " + first_five[0].to_s
puts "\n"
puts "Type: " + first_five[1].name
puts first_five[1].inspect
puts "Content: " + first_five[1].to_s
puts "\n"
puts "Type: " + first_five[2].name
puts first_five[2].inspect
puts "Content: " + first_five[2].to_s
puts "\n"
puts "Type: " + first_five[3].name
puts first_five[3].inspect
puts "Content: " + first_five[3].to_s
puts "\n"
puts "Type: " + first_five[4].name
puts first_five[4].inspect
puts "Content: " + first_five[4].to_s