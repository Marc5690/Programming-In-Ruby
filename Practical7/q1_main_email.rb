
class EmailCheck

	def self.isSpam?(email, spamFilter)#One email to check for spammy-ness, and one filter to apply to the email.
		#Spam score relfects how 'spammy' an email is. With 10 being genuine spam, and 0 being a genuinely regular email.
		spam_score = 0
		
		if spamFilter.is_a?(Array) && email.is_a?(Array) #Check to sanitise inputs. We want two arrays. 
			spamFilter.each do |spam| #Go through each filter-word.
				@regexp = Regexp.new(spam) #Create a new Regular Expression based on the filter.
				spam_score += (email.to_s.scan(@regexp).size) #Search through the email for the spam word and increment 
				                                              #the spam score with the number of matches.
			end
		else
			puts "You must enter a string followed by an array of spam words."#If we don't get two arrays as parameters, let the user know.
		end
		
		if spam_score > 10 then spam_score = 10 end # If the spam score ends up greater than ten, 
			                                        # reduce it back to ten (So we can grade its spammy-ness out of ten).
		
		"Spam score is #{spam_score}/10" #Print something meaningful out for the user.
	end
end

spam1 = "Todoist Oct 21 (1 overdue) Hi marc.laffan OVERDUE 1 day(s) ago  	Studying	Inbox ● View in Todoist... KARMA TREND  You are a beginner. Your karma is 96. Todoist Karma Help
Get our Free Apps: Android	iPhone	iPad Windows	Mac OS	Chrome
Help your team get things done faster:  Todoist For Business If you no longer wish to receive Todoist emails, click here to unsubscribe."

spam2 = "Todoist Oct 22 (1 overdue) Hi marc.laffan OVERDUE 2 day(s) ago  	Studying	Inbox ● View in Todoist... KARMA TREND  You are a beginner. Your karma is 96. Todoist Karma Help
Get our Free Apps: Android	iPhone	iPad Windows	Mac OS	Chrome
Help your team get things done faster:  Todoist For Business If you no longer wish to receive Todoist emails, click here to unsubscribe."

spam3 = "Todoist Oct 25 (1 overdue) Hi marc.laffan OVERDUE 5 day(s) ago 	Studying	Inbox ● View in Todoist... KARMA TREND  You are a beginner. Your karma is 93. Todoist Karma Help
Get our Free Apps: Android	iPhone	iPad Windows	Mac OS	Chrome
Help your team get things done faster:  Todoist For Business If you no longer wish to receive Todoist emails, click here to unsubscribe."

spam4 = "Todoist Oct 23 (1 overdue) Hi marc.laffan OVERDUE 3 day(s) ago  	Studying	Inbox ● View in Todoist... KARMA TREND  You are a beginner. Your karma is 96. Todoist Karma Help
Get our Free Apps: Android	iPhone	iPad Windows	Mac OS	Chrome
Help your team get things done faster:  Todoist For Business If you no longer wish to receive Todoist emails, click here to unsubscribe."

spam5 = "Todoist Oct 24 (1 overdue) Hi marc.laffan OVERDUE 4 day(s) ago 	Studying	Inbox ● View in Todoist... KARMA TREND  You are a beginner. Your karma is 96. Todoist Karma Help
Get our Free Apps: Android	iPhone	iPad Windows	Mac OS	Chrome
Help your team get things done faster:  Todoist For Business If you no longer wish to receive Todoist emails, click here to unsubscribe."

email1 = "Atlassian - Hi Marc, We've created a new Atlassian ID for you using this email address:
marclaffan@gmail.com
Atlassian ID is your key to all things Atlassian. Click here to learn more about what you can access with your Atlassian ID.
Please click below to activate your account:"

email2 = "Bitbucket - You recently entered a new email address for the user marcla. Please confirm your email by clicking the button below."

email3 = "Derick Bailey - Fun With Higher Order Functions In JavaScript
JavaScript is often referred to as a language with functional programming capabilities because of it's 'higher order functions' - a term that may sound fancy, off-hand, but turns out to be simple in practice: A higher order function is a function that can return another function. It's a bit like a opening a present and [...]
Read The Complete Blog Post: Fun With Higher Order Functions In JavaScript"

email4 = "Codingame - Hi, Great to have you on board!
Your CodinGame account has successfully been created. We hope you'll enjoy the platform as much as we do :)
Keep Coding! The CodinGame team"

email5 = "Big Moose Saloon - Hi, You received this email because the topic 'Your favorite Android app?'' in the Android forum has received a reply from member Minh Thang since your last visit.
You may use the following URL to read the messages. You will not get more notifications until you read the topic.
http://www.coderanch.com/forums/posts/list/652755#3041008
If you no longer want to receive notifications for this topic, please access the URL
http://www.coderanch.com/forums/posts/unwatch/652755
Remember: your username is: Marc Laffan"

spam1Array = spam1.split
spam2Array = spam2.split
spam3Array = spam3.split
spam4Array = spam4.split
spam5Array = spam5.split

email1Array = email1.split
email2Array = email2.split
email3Array = email3.split
email4Array = email4.split
email5Array = email5.split

spam = [spam1Array,spam2Array,spam3Array,spam4Array,spam5Array]
email = [email1Array,email2Array,email3Array,email4Array,email5Array]
spamWords = ["Todoist", "marc.laffan","1","Android","KARMA"]

puts "Testing spam..."
#Try out the isSpam? method for our spam emails:
spam.each do |spam| puts EmailCheck.isSpam?(spam, spamWords)  end

puts "Testing regular email..."
#Try out the isSpam? method for out regular emails:
email.each do |email| puts EmailCheck.isSpam?(email, spamWords)  end
