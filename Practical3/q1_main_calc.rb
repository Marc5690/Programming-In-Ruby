#1) Define a programe that has three separate files, each with its own set of 
#methods. In the first file there should be a fairly big method that makes use of 
#two other methods that are to be found in the other two files.  REM to use 
#require_relative to get access to the other files and experiment a bit 
#with including and excluding the require_relative statements
require_relative 'q1_divide'
require_relative 'q1_multiply'

class MainCalc

	def calculate(num1,num2) #This is the method that uses methods in the Divide and Multiply classes to manipulate numerical calculations
		print "The divided result of #{num1} and #{num2} is: #{Divide.division(num1,num2)}\n"
        print "The multiplied result of #{num1} and #{num2} is: #{Multiply.multiple(num1,num2)}"
	end

end

@calc = MainCalc.new #To prove that this works, simply run this file. It should create a MainCalc object and run the calculate method.
@calc.calculate(2,2)