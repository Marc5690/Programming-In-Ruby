require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'pp' 

#Before making changes to the methods in the sixdegrees program, I extracted the
#"find_films_by_actor" method and placed it in this file so I could run it
#independently of the main application, in order to prevent flooding wikipedia with traffic.

#The methods in the main application have also been changed to fulfill the assignment requirements (and was fully commented),
#but I kept this file here in order to show the work done for this assignment, as well as to prove that the code works, without
#requiring the main application to be run.

out = []

doca = Nokogiri::HTML(open("http://webcache.googleusercontent.com/search?q=cache:-cipgLforFYJ:https://en.wikipedia.org/wiki/Saoirse_Ronan+&cd=1&hl=en&ct=clnk&gl=ie",:allow_redirections => :safe))

	puts "Entering find_films_by_actor with }."
	table = doca.search('//table[@class="wikitable sortable jquery-tablesorter"]').first
	regexp = Regexp.new('a href=(.*)title=')
	all_links = table.to_s.scan(regexp)
    all_links.each do |link|
 		out << link.to_s.tr("_"," ") end
 	
puts out
