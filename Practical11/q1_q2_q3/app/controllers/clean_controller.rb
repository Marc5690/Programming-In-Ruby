class CleanController < ApplicationController

	#For Q1, this method deletes the contents of the database and redirects the user to the first page of the system.
  def finish
  	Actor.delete_all
  	Song.delete_all
  	redirect_to "/add/song" 
  end

end
