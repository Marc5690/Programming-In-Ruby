module Value

  @@all_songs = []
  @@all_albums = []
  @@all_artists = []
  @@hash_owners = Hash.new


  #Method to sort hash owners within the Value module.
  def self.hash_owners(hash_owners)
    @@hash_owners = hash_owners
  end

  #Method to get all hashed owners
  def self.get_hash_owners
    @@hash_owners
  end

  #General method to return all songs/albums/artists depending on what the type of the calling instance is.
  def contents
    if self == Song 
      then @@all_songs
    elsif self == Album 
      then @@all_albums
    elsif self == Actor 
      then @@all_artists
    else 
      puts "could not find contents."
      []
    end
  end
     
  #Generic add method   
  def add(object)
   if object.is_a?(Song)
      then @@all_songs << object
    elsif object.is_a?(Album)
      then @@all_albums << object
    elsif object.is_a?(Actor)
      then @@all_artists << object
    else 
      puts "Could not add object."
   end
  end 

  #Generic add-collection method
  def add_objects(objects)
   objects.each do |object|
     if self == Song then
       unless @@all_songs.include?(object)
          @@all_songs << object
       else
         puts "Could not add song!"
       end
     elsif self == Album then
       unless @@all_albums.include?(object)
          @@all_albums << object
       else
         puts "Could not add album!"
       end
     elsif self == Actor then
       unless @@all_artists.include?(object)
          @@all_artists << object
       else
         puts "Could not add artist!"
       end
     else
        puts "Could not perform add_objects operation."
     end
   end
  end 

end