class OtherController < ApplicationController

 #Change made: Check the fst_name and lst_name parameters before deciding to create a new entry.
 def name
  @fname = params[:fst_name]
  @lname = params[:lst_name]
  if @fname && @lname then	@entry = Entry.create({:first_name => @fname, :last_name =>  @lname}) end
 end

 #No change required to enhance database interaction.
 def index
 	@person = Entry.last
	@fname = @person.first_name
    @lname = @person.last_name
	@person.update_attributes({:address => params[:st_name],:salary => params[:salary], :loan => params[:loan],:loan_reason => params[:reason]})
 	if !@person.address.nil? then render "show" end
 end

 #Changed to use method last, rather than find by parameter ":last".
 def show
	 @person = Entry.last
 end

 #Changed to point @entry to the person variable, and @entry to update the attributes of @person/@entry rather than create a new Entry. 
 def change
 	@person = Entry.last
 	@fname = @person.first_name
 	@lname = @person.last_name
 	@entry = @person
 	@entry.update_attributes({:salary => params[:salary], :loan => params[:loan]})
 end

 #No change required to enhance database interaction.
 def quote
	@person = Entry.last
	if !@person.salary.nil? then
	   if (@person.salary *  3) < @person.loan
			then @message = "You goddam pauper, you asked us for a loan that is:
							 more than three times your salary. \n Please go back
							and re-enter your correct salary."
	   else  @message = "Sure thing baby..."
	   end
	else @message = "Seem to have an empty record??"
	end
 end
end