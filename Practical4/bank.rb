class Bank

	attr_accessor :no_of_employees, :cash_deposits, :amount_of_loans, :losses, :in_nama, :solvent, :name

    $bank_list = Array.new

    def self.new_bank(no_of_employees_input, cash_deposits_input, amount_of_loans_input, losses_input, in_nama_input, solvent_input, name_input)
        new_bank = Bank.new
        if no_of_employees_input.is_a?(Fixnum) then new_bank.no_of_employees = no_of_employees_input else new_bank.no_of_employees = 0 end
        if cash_deposits_input.is_a?(Fixnum) then new_bank.cash_deposits = cash_deposits_input else new_bank.cash_deposits = 0 end
        if amount_of_loans_input.is_a?(Fixnum) then new_bank.amount_of_loans = amount_of_loans_input else new_bank.amount_of_loans = 0 end
        if losses_input.is_a?(Fixnum) then new_bank.losses = losses_input else new_bank.losses = 0 end
        if in_nama_input.is_a?(TrueClass) or in_nama_input.is_a?(FalseClass) then new_bank.in_nama = in_nama_input else new_bank.in_nama = true end
        if solvent_input.is_a?(TrueClass) or solvent_input.is_a?(FalseClass)  then new_bank.solvent = solvent_input else new_bank.solvent = true end
        if name_input.is_a?(String) then new_bank.name = name_input else new_bank.name = "Default" end
        $bank_list << new_bank #Add the bank to the list of banks
        new_bank
    end

    def move_loans_to_nama(amount)
        #First, check to see if the bank is in NAMA. If not, then it cannot avail of offloading its loans.
        if self.in_nama then
            cash_from_nama = amount*0.3
            nama = $bank_list.find {|bank| bank.name.eql? "NAMA"}

            #If NAMA does not exist in array, create it and continue. Similar to a Singleton.
            if nama == nil then nama = Bank.new_bank(200, 77000000000, 0,0,true,true,"NAMA") end
            $bank_list << nama

            #The possibility exists that NAMA will run out of money to lend. At this point, banks can no longer offload loans.
            if (nama.cash_deposits <=0 or (nama.cash_deposits - cash_from_nama) <= 0)
                then puts "Could not aquire loan from Nama, no money left!\n"
            else
                self.amount_of_loans -= amount
                nama.amount_of_loans += amount
                puts "#{self.name} moved €#{amount} in loans to NAMA, #{self.name} now has €#{self.amount_of_loans} in loans. NAMA has €#{nama.amount_of_loans} in loans.\n"
                nama.cash_deposits -= cash_from_nama
                self.cash_deposits += cash_from_nama
                puts "#{self.name} received €#{cash_from_nama} in cash deposits from NAMA, #{self.name} now has €#{self.cash_deposits} in cash_deposits. NAMA has €#{nama.cash_deposits} in cash.\n"
            end
        else
            puts "#{self.name} must be in NAMA before it can receive help from NAMA\n"
        end
    end

    def is_insolvent
        net_cash = self.cash_deposits - self.losses
    	if self.amount_of_loans >= net_cash*6 #Basil rules check
          then 
            true
    	else
            false
    	end
    end

    #For the make_solvent method, I decided to allow the bank to offload enough loans to make its loan book
    #five times greater than its cash deposits, to disqualify it from insolvency (Which would be at six times its cash deposits)
    def make_solvent
        required_offload = self.amount_of_loans - (self.cash_deposits * 5)
        move_loans_to_nama(required_offload)
    end

    def to_s
    	solvency = solvent ? "solvent" : "insolvent"
        self.name + " " + self.cash_deposits.to_s + " " + self.amount_of_loans.to_s + " " + losses.to_s + " " + solvency
    end

end