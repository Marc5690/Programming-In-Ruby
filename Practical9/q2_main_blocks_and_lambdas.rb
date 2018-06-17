#This program is used to demonstrate blocks, lambdas, closures and yield, while also simulating a banking system.

#Number of applicants that have been rejected and approved for financial assitance.
@rejected = 0
@approved = 0

#Cash and debt variables used to determine whether the banking system should provide financial assistance
#to the applicant. These are gradually changed.
cash = 10000
debt = 5000

#Method to determine what is printed to the screen when an applicant has been processed.
def give_loan?(cash, debt)
	puts "Applicant has #{cash} euros in cash and #{debt} euros in debt\n"
	yield
	puts "That's #{@rejected} applicants rejected and #{@approved} applicants approved.\n"
	puts "Goodbye!\n"
end

#Lambda to determine whether an applicant should be approved or rejected.
#If the applicant has more debt than cash, give_loan? is called with a rejection message 
#and the @rejected variable is incremented.
liquidity_test = lambda do |cash,debt|
				if(cash>=debt) then
					@approved += 1
					give_loan?(cash, debt) {puts "Sure, loan them.\n"}
				elsif(debt>cash) then
					@rejected += 1
					give_loan?(cash, debt) {puts "We don't want to take the risk.\n"}
				else
					puts "Go back to the ATM!\n"
				end
			end

#Loop applicants ten times, incrementing the debt each time by 1000 euros.
10.times {
	puts "A new applicant!\n"
	liquidity_test.call(cash, debt)
	debt += 1000
}