module Pred

  #This method checks to see if the calling instance is a song, then an actor/artist, an album, then finally to see if it
  #is the same type as the parameter passed (object_class)
  def isa?(object_class)
    if self.instance_of?(Song)
      then puts "#{self.name} is of class Song."
    elsif self.instance_of?(Actor)
      then puts "#{self.name}  is of class  Actor/Owner."
    elsif self.instance_of?(Album)
      then puts "#{self.name}  is of class Album."
    elsif self.instance_of?(object_class)
      then puts "#{self.name}  is of class #{object_class}."
    else
      puts "#{self.name}  class is not of type #{object_class}, Song, Actor/Owner or Album."
    end 
  end
end