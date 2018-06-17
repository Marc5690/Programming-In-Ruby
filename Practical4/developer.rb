class Developer

	attr_accessor :name, :net_worth, :loans, :banks_loaned_from, :bankrupt

    def self.new_developer(name_input, net_worth_input, loans_input, banks_loaned_from_input, bankrupt_input)
        new_developer = Developer.new
        if name_input.is_a?(String) then new_developer.name = name_input else new_developer.name = "Default" end
        if net_worth_input.is_a?(Fixnum) then new_developer.net_worth = net_worth_input else new_developer.net_worth = 40000 end
        if loans_input.is_a?(Fixnum) then new_developer.loans = loans_input else new_developer.loans = 0 end
        if banks_loaned_from_input.is_a?(Array) then new_developer.banks_loaned_from = banks_loaned_from_input else new_developer.banks_loaned_from = Array.new end
        if bankrupt_input.is_a?(TrueClass) or bankrupt_input.is_a?(FalseClass) then new_developer.bankrupt = bankrupt_input else new_developer.bankrupt = true end
        new_developer
    end

    def is_developer_solvent?
        net_cash = self.net_worth - self.loans
    	if net_cash > 0
    		true
    	else
            bankrupt = true
            bank_names = ""
            self.banks_loaned_from.each do |bank| bank_names += (bank.name + " ") end

            #If developer is bankrupt, add their loans to the losses of each bank that the developer loaned from, equally.
            puts "#{self.name} is bankrupt, #{bank_names} is/are receiving €#{self.loans} worth of losses.\n"
            no_of_banks = banks_loaned_from.length
            banks_loaned_from.each do |bank| bank.losses + (loans/no_of_banks) end
    		false
    	end
    end

	def owes_amount
		loans
    end

    def owes_banks
    	banks_loaned_from
    end

    def to_s
        "Name: " + self.name + " Net worth: €" + self.net_worth.to_s + " Loans: €" + self.loans.to_s + " Bankrupt? " + (self.bankrupt ? "Yes" : "No")
    end

end