#This class represents the "A" class mentioned in the assignment specifications
class Animal

	#Health and hunger are represented numerically, with 100 meaning as healthy as possible 
	#or well-fed, and 0 representing starvation or near-death 
	attr_accessor :name, :colour, :tail, :legs, :hunger, :health
	
	def initialize(name, colour, tail, legs)
		@name = name
		@colour = colour
		@tail = tail
		@legs = legs
		@hunger = 100
		@health = 100
	end

	def sound #There is no text that would accurately describe what an "animal sound" would sound like.
		      #So for the sake of having a placeholder, this method returns elipses.
		"..."
	end

	def move
		if self.hunger >= 100 then self.hunger -= 20 end 
	end

	def diet #Rather than say "An 'animal' eats nothing", we set the default to the most prevalent diet type, Herbivore.
		"I am a Herbivore!"
	end

	def eat
		self.hunger = 100
		if self.health <= 100 then self.health += 10 end 
	end

	def fight
		if self.health > 0 then self.health -= 25 end 
	end

	def to_s #This to_s method is over-ridden and added to in subclasses by using the "super" keyword
		"Name:#{self.name}, Colour:#{self.colour}, Tail:#{self.tail}, Legs:#{self.legs}, Hunger:#{self.hunger}, Health:#{self.health}"
	end
end