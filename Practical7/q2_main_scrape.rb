require 'nokogiri'
require 'open-uri'

#The purpose of this file is to find all h1,h2,h3 and h4 tags in the file found at "http://www.ucd.ie".
doc = Nokogiri::HTML(open("http://www.ucd.ie"))
headers = []
header_contents = ['h1','h2','h3','h4'] #Create an array of the elements we want to find.

header_contents.each do |header|  
	content = doc.xpath('//' + header) #Iterate through each tag and find them in the web page.
	content.each do |element| headers << header + " " + element.text() end #Add each element to the headers array and prefix with the type of element.
end

puts headers #Print results