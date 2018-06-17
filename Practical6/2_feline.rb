require_relative '2_animal'

#This class represents the "B" class mentioned in the assignment specifications
class Feline < Animal

	attr_accessor :whiskers, :domesticated, :mane

	def initialize(whiskers, domesticated, mane)
		@whiskers = whiskers
		@domesticated = domesticated
		@mane = mane
	end

	def diet #Overridden from Animal
		"I am a Carnivore!"
	end

	def sound #Overridden from Animal
		#Please note that the majority of class feline in the animal kingdom
		#actually roars, rather than meows. The reason for the sound functionality being
		#overwritten here is due to the majority of subclasses of class feline (tiger, lion, lynx, etc)
		#will roar, rather than meow.
		"Roar!"
	end

	def scratch #New method, inherited by class Cat
		"*scratches with claws*"
	end

	def move #Overridden from Animal
		if self.hunger >= 100 then self.hunger -= 15 end 
	end

	def setup(name, colour, tail, legs)
		self.name = name
		self.colour = colour
		self.tail = tail
		self.legs = legs
		self.hunger = 100
		self.health = 100
	end

	def to_s #Adds to Animal classes to_s method
		super.to_s + ", Whiskers: #{self.whiskers} Domesticated:#{self.domesticated}, Mane:#{self.mane}"
	end
end