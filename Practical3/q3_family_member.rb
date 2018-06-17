class FamilyMember

	attr_accessor :name, :sex, :status, :age, :children

	#Using my own constructor, I can safeguard against bad data (e.g. text in the age attribute)
	def self.new_member(memberName,memberSex,memberStatus,memberAge,memberChildren)
		member = FamilyMember.new
		if memberName.is_a?(String) then member.name = memberName else member.name = "Default" end
		if memberSex.is_a?(String) then member.sex = memberSex else member.sex = "Default" end
        if memberStatus.is_a?(String) then member.status = memberStatus else member.status = "Default" end
        if memberAge.is_a?(Fixnum) then member.age = memberAge else member.age = 20 end
        if memberChildren.is_a?(Fixnum) then member.children = memberChildren else member.children = 0 end
        member
	end

	def to_s #I overrided the to_s method to make it look more aesthetically pleasing
		"Name: #{self.name}, Sex: #{self.sex}, Status: #{self.status}, Age: #{self.age}, Children: #{self.children}"
	end

    #For the purposes of this method, an adult is defined as either a person or dog with more than zero children.
	def parent?
		if self.children > 0 && self.sex.downcase == "male" && self.status.downcase == "person"
			return true, "Father"
		elsif self.children > 0 && self.sex.downcase == "female" && self.status.downcase == "person"
			return true, "Mother"
		elsif self.children > 0 && self.sex.downcase == "female" && self.status.downcase == "dog"
			return true, "Mother dog (Pet)"
		elsif self.children > 0 && self.sex.downcase == "male" && self.status.downcase == "dog"
			return true, "Father dog (Pet)"
		else 
			return false, "Not parent"
		end
	end #End parent? method

	#For the purposes of this method, a child is defined as either a person that is 17 or younger, or a dog that is at most a year old.
	def child?
		if self.age <= 17 && self.sex.downcase == "male" && self.status.downcase == "person"
			return true, "Son"
		elsif self.age <= 17 && self.sex.downcase == "female" && self.status.downcase == "person"
			return true, "Daughter"
		elsif self.age <= 1 && self.status.downcase == "dog"
			return true, "Puppy"
		elsif self.status.downcase == "dog"
			return false, "Not puppy"
		else 
			return false, "Not child"
		end
	end #End child? method

end #End FamilyMember class

fm1 = FamilyMember.new_member("Marc","Male","Person",15,0)
fm2 = FamilyMember.new_member("Kevin","Male","Person",45,2)
fm3 = FamilyMember.new_member("Jess","Female","Person",17,0)
fm4 = FamilyMember.new_member("Deborah","Female","Person",43,2)
fm5 = FamilyMember.new_member("Max","Male","Dog",8,1)

family = [fm1,fm2,fm3,fm4,fm5] #An array, to hold the FamilyMember objects.

#3) Define an array of these family	members	and	search through it using	each, to	
#print out their names,	and	status.
family.each { |member| 
	           puts member.name + " " + member.status}

