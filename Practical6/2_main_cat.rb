require_relative '2_feline'

#This class represents the "C" class mentioned in the assignment specifications
class Cat < Feline

	attr_accessor :cute

	def initialize(cute, whiskers, domesticated)
		super(whiskers, domesticated, false)#Sending false as the argument for mane, as no cat has a mane.
		@cute = cute	
	end

	def diet #Overridden from Feline, rather than Animal. This method has been over-ridden twice now.
		"I am a 'Your dinner when you aren't looking'-ivore!"
	end

	def play #A new method
		"*plays with cat toys*"
	end

	def sound #Overridden from Feline, rather than Animal. This method has been over-ridden twice now.
		"Meow!"
	end

	def move #Overridden from Feline, rather than Animal. This method has been over-ridden twice now.
		if self.hunger >= 100 then self.hunger -= 5 end 
	end

	def to_s #Adds to Feline classes to_s method
		super.to_s + ", Cute:#{self.cute}"
	end
end

@animal = Animal.new("Animal", "Grey", true, 4)
@feline = Feline.new(true, true, true)
@cat = Cat.new(true, true, true)

#Prints out animals to show their before state, using the inspect method from class Object.
#This will show the actual variables held by these instances, before they are set up with
#variables that inherited methods can use. If we use an inherited method before setting up
#the variables that the inherited method expects to find (In other words, the equivalent superclass variables),
#then the program will crash, as they do not exist yet for the subclass.
p @animal
p @feline
p @cat

#Print out animals to show their "before" state, using the to_s method.
#This state will show several uninitialised local instance variables for both the
#feline and cat instances, as they only exist in the to_s the first time they are called (Due to them
#being local, meaning that they stop existing once the method ends). Before this, they simply do not 
#exist at all. Inherited methods that call them will crash the program. These variables are included as
#once the equivalent variables to the Animal superclass are set up, they will be populated.
puts @animal
puts @feline
puts @cat


#Perform a series of actions with the animals to change their state...
puts "Animal eats..."
@animal.eat
puts "Animal moves..."
@animal.move
puts "Animal fights..."
@animal.fight

#Setup creates the subclasses equivalent instance variables to the superclasses, which the instance methods can then use.
#Without this step, the instance variables that exist in the superclass will not copy over into the subclass.
#Using inherited methods (move, fight and eat), that expect these superclass variables to exist, before the setup method is called 
#will result in an error (As they don't exist yet/are assigned nil).
@feline.setup("Felidae","Black", true, 4)

puts "Felidae moves..."
@feline.move
puts "Felidae fights..."
@feline.fight
puts "Felidae eats..."
@feline.eat


@cat.setup("Cat", "Grey", true, 4)
puts "Cat moves..."
@cat.move
puts "Cat moves..."
@cat.move
puts "Cat moves..."
@cat.move
puts "Cat eats..."
@cat.eat
puts "Cat fights..."
@cat.fight

#Here, we can see the effects that the methods are having on the state of each animal.
#What was once nil, is now populated.
puts @animal
puts @feline
puts @cat

#To prove how the process of inheritance works, we call several overridden methods
#to prove how their return values change with each subclass.

puts "\nRollcall!\n"
puts "Animal? '#{@animal.sound}'\n"
puts "Felidae? '#{@feline.sound}'\n"
puts "Cat? '#{@cat.sound}'\n"

puts "\nWho eats what?\n"
puts "Animal? '#{@animal.diet}'\n"
puts "Felidae? '#{@feline.diet}'\n"
puts "Cat? '#{@cat.diet}'\n"

@animal.eat
@feline.eat
@cat.eat
puts "\nWho uses up the most energry when moving?\n"
@animal.move
puts "*Animal moves*"
puts "Animal? '#{@animal.hunger} left in the tank!'\n"
@feline.move
puts "*Felidae moves*"
puts "Felidae? '#{@feline.hunger} left in the tank!'\n"
@cat.move
puts "*Cat moves*"
puts "Cat? '#{@cat.hunger} left in the tank!'\n"


#Lastly, we show how inheritance works downwards, but not upwards, using methods defined in the Feline and Cat subclasses.
#If the play method is used by either the Feline or Animal class, or if the Animal class attempts to use the scratch method,
#an error will be thrown and the program will crash.
puts "\nWho can scratch?\n"
puts "Felidae? #{@feline.scratch}"
puts "Cat? #{@cat.scratch}"

puts "\nWho can play?\n"
puts "Cat? #{@cat.play}"

#Uncomment the final line to receive the following error: 
#2_cat.rb:138:in `<main>': undefined method `play' for #<Animal:0x00000002d6d6a0> (NoMethodError)
#puts @animal.play