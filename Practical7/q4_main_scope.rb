class Scope

	#public_method is public by default
	def public_method
		puts "Public method!"
		#Here, we are calling a private method.
		#This is allowed, as the context for the call is internal.
		private_method
	end

	def private_method
		puts "Private method!"	
		#Here, we are calling a protected method.
		#This is allowed, as the context for the call is internal.
		protected_method
	end

	def protected_method
		puts "Protected method!"
	end

	#This method is used to distinguish protected scope against private scope
	#The purpose is to show that one instance can access anothers protected methods,
	#but not their private methods.
	def private_vs_protected_argument_method(scope)
		"Protected method of passed object says: " + scope.protected_method_string
		#The below line will result in an error, as we cannot call another instances
		#protected methods.
		#"Private method of pass object: " + scope.private_method_string
	end

	def private_method_string
		"Private method string!"	
	end

	def protected_method_string
		"Protected method string!"
	end

	#Class-level scoped methods worked in paralell to instance methods.
	#They can call each other the same way that the instance methods can, but the instance methods
	#cannot explicitly call class method (Such as using "class_public_method" in the "public_method" method)
	#and class methods cannot call instance methods.
	def self.class_public_method
		class_private_method
		"Class public method!"
	end

	private
	def self.class_private_method
		class_protected_method
		"Class private method!"
	end

	protected
	def self.class_protected_method
		"Class protected method!"
	end

	public :public_method#, :self.class_public_method
	private :private_method_string, :private_method#, :self.class_private_method
	protected :protected_method_string, :protected_method#, :self.class_protected_method

end

scope1 = Scope.new

#A public instance method, which calls the private instance method.
#The private instance method then calls the protected instance method.
puts scope1.public_method

#Below are out-of-scope method calls. These cannot be called externally, but can be called
#from within the class itself, by other methods.
#scope.private_method
#scope.protected_method

#Class-level scope examples
puts Scope.class_public_method
puts Scope.class_private_method
puts Scope.class_protected_method
puts "\n"

#However, we can also simply ignore scope(If required) using send:
print scope1.send :protected_method
print scope1.send :private_method#This should print both the contents of protected_method and private_method,
								 #as private_method calls protected_method.
puts "\n"						 

#Lastly, a demonstration of distinction between private and protected methods.
#We use one instance to call another instances protected methods. This cannot be done with
#the instances private methods.
scope2 = Scope.new
puts scope2.private_vs_protected_argument_method(scope1)