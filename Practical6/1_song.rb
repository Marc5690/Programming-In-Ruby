#!/usr/bin/ruby -w
# SONG
# Copyright Mark Keane, All Rights Reserved, 2014


# Class that encodes details of a song.

require_relative '1_predicate'
require_relative '1_value'
class Song

	include Pred
	include Value
	attr_accessor :name, :album, :artist, :time, :owners, :id
	def initialize(name, album, artist, time, owners, id)
		@name = name
		@album = album
		@time = time
		@artist = artist
		@owners = owners
    	@id = id
    	self
	end

  # Method that prints out the contents of a song object nicely.
	def to_s
		puts "<< #{@name} >> by #{@artist} in their album #{@album} is owned by #{@owners} .\n"
	end	

	def id_match?(hash_owners) #In this method, we receive the hash of owners then compare the keys
		if Value.get_hash_owners.has_key?(self.id) then #with the current song object that is being iterated over.
			true 
		else 
			#If a song doesn't find a key in the hash, we notify the user
			puts "Song ID:#{self.id}, Name:'#{self.name}' does not have any owners." 
			#And return false, which will set the owners to an empty string for the song in the current iteration.
			false 
		end
	end

  # Method that plays a song (sort of ;-)
	def play_song
		no = rand(10)
		no.times {print "#{@name} do be do..."}
		puts "\n"
	end

end