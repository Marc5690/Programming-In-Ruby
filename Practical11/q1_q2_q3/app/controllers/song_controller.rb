class SongController < ApplicationController

	#For Q2, simply find songs that have the users ID as their actor_id value.
  def ownedSongs
  	@id = params[:id]
  	@songs = Song.where( :actor_id => @id )
  end
end
