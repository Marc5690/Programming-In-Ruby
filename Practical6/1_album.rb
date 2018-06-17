#!/usr/bin/ruby -w
# ALBUM
# Copyright Mark Keane, All Rights Reserved, 2014

# Class that encodes details of an album.

require_relative '1_predicate'
require_relative '1_value'

class Album

  include Pred
  include Value

	attr_accessor :name, :tracks, :length, :artist,:owners, :id

	def initialize(name, tracks, length, artist, owners)
		@name = name
		@tracks = tracks
		@length = length
		@artist = artist
    @owners = owners
		@id = name.object_id
		self
	end

  # Method that prints out the contents of an album object nicely.
	def to_s
		"The album #{@name} by #{@artist}. \nAlbum length: #{@length} Number of tracks: #{@tracks.length} \nOwners: #{@owners} \n"
	end	

	#Method that returns all album names
	def self.all_names
		album_names = []
		albums.each do |album| album_names << album.name end 
		puts album_names
	end	

  #Simple print out of all albums
	def self.print_all_albums
    @contents = Album.contents
    @contents.each do |album| p album.to_s end
	end

  # Method makes an album object; just uses Album.new; really
  # just being a bit explicit and obvious.

	def self.make_album(name,tracks, length, artist, owners)
		new_album = Album.new(name, tracks, length, artist, owners)
		new_album
	end

  # Class Method that builds albums from song object's contents.
  # It returns an array of album objects.  It calls another class method that
  # builds a single album, given the name of that album.

  def self.build_all(albums = [])
  	#To contain the names of all albums
    album_names = []
    #To contain albums we will be returning from this method
    returned_albums = []
    
    @songs = Song.contents
    @songs.each do |song| album_names << song.album unless album_names.include?(song.album) end #Add each album name to the array of album names
    album_names.each do |album_name| 
    	#Album attributes
    	length = 0
    	artist = ""
    	owners = ""
    	album_songs = []

    	@songs.each do |song| #Find each song that belongs to the current album and and fill in the album details
    		if song.album.eql?(album_name) 
    			then 
    			album_songs << song
    			length += song.time
    			artist += " #{song.artist}" unless artist.include?(song.artist) 
    			owners += " #{song.owners}" unless song.owners == nil or owners.include?(song.owners.to_s)
    		end 
    	end
    	
    	#To see if the album exists
      @all_albums = Album.contents
    	existing_album = @all_albums.find{|album| album.name.eql?album_name} 

    	if(existing_album.nil?)#If the album does not yet exist, call another method that will create it for us
    		new_album = Album.build_an_album_called(album_name) 
    		returned_albums << new_album
    	else#But if the album does exist, populate it using song data attributes
    		existing_album.length += length
    		existing_album.tracks << album_songs
    		existing_album.owners << owners
    		returned_albums << existing_album
    	end
    end
    returned_albums
  end

  # Class method that takes an album name, it finds all the sounds that are in that album
  # builds up arrays of the song-names (tracks), runtimes, artist names.  These all get used
  # to populate the various attributes of the album object.

  def self.build_an_album_called(album_name)
  	#Find all songs that belong to this album
    tracks = []
    Song.contents.each do |song| if song.album.eql?(album_name) then tracks << song end end

    #See if the album exists
  	existing_album = Album.contents.find{|album| album.name.eql?album_name}

    #If we can't find the album, then collect the required data and create a new album
  	if existing_album.nil? then
  		length = 0
    	artist = ""
    	owners = ""

    	unless tracks.empty?
    		tracks.each do |track| 
    			length += track.time 
    			artist += " #{track.artist}" unless artist.include?(track.artist)
    			owners += " #{track.owners}" unless track.owners == nil or owners.include?(track.owners.to_s)
    		end 	
    	end

    	existing_album = Album.make_album(album_name,tracks, length, artist, owners)
  		existing_album
  	
  	#If we can find the album, then simply update its attributes
  	else	
  		existing_album.tracks = tracks
  		existing_album.length = length 
  		existing_album.artist = artist
  		existing_album.owners = owners
  		existing_album
  	end

  end

end
