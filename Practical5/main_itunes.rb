#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'

#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line

reader = Reader.new
songs_file = 'songs.csv'             #in RubyMine
owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
$songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
$hash_owners = reader.read_in_ownership(owners_file)

puts "Building all owners..."
$actors = Actor.build_all()

puts "Updating songs with ownership details..."

$songs.each{|song| 
	if song.id_match?($hash_owners) then 
	 song.owners = $hash_owners[song.id]
	else
	 song.owners = ""
	end
}

puts "Building All Albums..."
$albums = Album.build_all()

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
$songs.each{|song| p song}

# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv

