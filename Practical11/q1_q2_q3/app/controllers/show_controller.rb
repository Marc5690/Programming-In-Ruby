class ShowController < ApplicationController

  #For Q3, each method in this controller was given an @actor variable to allow their respective views
  #to decide exactly what the user should see
  def list_song
    @actor = Actor.last
	  @songs = Song.all
  end

  def album
    @actor = Actor.last
	  @name = params[:name]
	  if !@name.blank?
	  then @album_songs = Song.where(in_album: @name)
           @album_time = (@album_songs.collect {|song| song.time}).sum 
	  else @album_songs = [] end
  end
  
  def actor
    @actor = Actor.last
    @actors = Actor.all
  end

end
