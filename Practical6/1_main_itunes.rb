#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative '1_actor'
require_relative '1_album'
require_relative '1_song'
require_relative '1_reader'
require_relative '1_utilities'
require_relative '1_error'
require_relative '1_value'

include Value
#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line

reader = Reader.new
songs_file = 'songs.csv'             #in RubyMine
owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
Song.add_objects(reader.read_in_songs(songs_file))

puts "Processing Ownership from file: #{owners_file}"
#$hash_owners
Value.hash_owners(reader.read_in_ownership(owners_file))

puts "Building all owners..."
Actor.add_objects(Actor.build_all())

puts "Updating songs with ownership details..."

Song.contents.each{|song| 
	if song.id_match?(Value.get_hash_owners) then 
	 song.owners = Value.get_hash_owners[song.id]
	else
	 song.owners = ""
	end
}

puts "Building All Albums..."
Album.add_objects(Album.build_all())

# Given the name of a song and a person; let them buy the song
puts "\nMarcl buys Zero(Rachel has also bought this, so now they both own it)..."
song1 = Util.fetch("Zero")
marc = Util.fetch("Marcl")
marc.to_s
song1.to_s
marc.buys_song(song1)
song1.to_s

# What songs does Marcl own
puts "\nHow many songs does Marcl own..."
p marc.what_songs_does_he_own().size

puts "\nPlay Zero: "
song1.play_song

# Print out all songs
puts "\nPrinting full details of all songs..."
Song.contents.each{|song| p song}



puts "is_a? for actors..."
Actor.contents.each{|actor| actor.isa?(Actor)}

#Uncomment the below to see is_a? working for other objects.
#These lines were commented out to save screen space.
#puts "is_a? for albums..."
#Album.contents.each{|album| album.isa?(Album)}
#puts "is_a? for songs..."
#Song.contents.each{|song| song.isa?(song)}

# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv

puts "Testing add_objects method for Actors, songs and albums..."

@artist = Actor.new("Marco")
@artist1 = Actor.new("A")
@artist2 = Actor.new("B")
@artist3 = Actor.new("C")
@array_of_actors = [@artist,@artist1,@artist2,@artist3]

Actor.add_objects(@array_of_actors)
p Actor.contents

#Uncomment the below "=begin" and "=end" to see the add_objects method working for other class types.
#I have commented them out to save screen space when running this program.

=begin
@song1 = Song.new("Test", "Plastic Beach", "Misc", 3, nil, 0)
@song2 = Song.new("Test1", "Plastic Beach", "Misc", 3, nil, 1)
@song3 = Song.new("Test2", "Plastic Beach", "Misc", 3, nil, 2)
@song4 = Song.new("Test3", "Plastic Beach", "Misc", 3, nil, 3)
@array_of_songs = [@song1,@song2,@song3,@song4]

Song.add_objects(@array_of_songs)
p Song.contents

@album1 = Album.new("Test",[], 50, "","")
@album2 = Album.new("Test",[], 50, "","")
@album3 = Album.new("Test",[], 50, "","")
@album4 = Album.new("Test",[], 50, "","")
@album5 = Album.new("Test",[], 50, "","")
@array_of_albums = [@album1,@album2,@album3,@album4,@album5]

Album.add_objects(@array_of_albums)
p Album.contents
=end