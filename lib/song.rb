require 'pry'

class Song 
  attr_accessor :name, :artist
  def initialize(name)
    @name = name 
  end

  def self.new_by_filename(some_filename)
    song_name = some_filename.split(" - ")[1]
    song = self.new(song_name)
  artist_name=(some_filename.split(" - ")[0])
  song.artist = Artist.find_or_create_by_name(artist_name)
  song.artist.songs << song
    song
  end
  
  def self.new_from_filename(some_filename)
  file_hash = {Artist => some_filename.split(" - ")[0], Genre => some_filename.split(" - ")[2].gsub!(".mp3", "")}
 file_array = file_hash.collect do |key,value|
  key.find_by_name(value) || key.new(value) 
end
Song.new(some_filename.split(" - ")[1], file_array[0], file_array[1])
#binding.pry

 # Artist.find_by_name(
 #= Artist.new(some_filename.split(" - ")[0])
 # genre = Genre.new(some_filename.split(" - ")[2].gsub!#(".mp3", ""))
  # song = Song.new(some_filename.split(" - ")[1], artist#, genre)
 
  
  
  end
end
