require 'pry'
class Song

@@artists = []
@@artists_backup = []  #FREAKING TEST WAS RESETTING @@artists and @@titles EVERY TIME AND MAKING THE #^$&*# TEST FAIL!!!!
@@genres = []
@@titles = []
@@titles_backup = []
@@count = 0
@@all = []

attr_reader :name, :artist, :genre, :count

def initialize(name, artist, genre)
  @duplicate_song = false
  # binding.pry
  if @@artists_backup.include?(artist) && @@titles_backup.include?(name) then
# binding.pry
    @duplicate_song = true
    # binding.pry
  end

  @name = name
  @artist = artist
  @genre = genre
  @@artists << artist
  @@artists_backup << artist
  @@genres << genre
  @@titles << name
  @@titles_backup << name
  @@count += 1
  @@all << self

  p @@artists

end

def self.count
  @@count
end

def self.artists
  unique_artists = @@artists.uniq
end

def self.genres
  @@genres.uniq
end

def self.genre_count

  @@all.each_with_object({}) do |song, genre_hash|
# binding.pry
  unless song.is_a_duplicate == true
    # binding.pry
    if genre_hash[song.genre] == nil
      genre_hash[song.genre] = 1
    else
      genre_hash[song.genre] += 1
    end
  end
end

end

def self.artist_count
  @@all.each_with_object({}) do |song, artist_hash|
  # binding.pry
  unless song.is_a_duplicate == true
    # binding.pry
    if artist_hash[song.artist] == nil
      artist_hash[song.artist] = 1
    else
      artist_hash[song.artist] += 1
    end
  end
end

end

def self.list_all
  @@all.each do |song|
    puts "#{song.artist} - #{song.name} (#{song.genre}) duplicate=#{song.is_a_duplicate}"
  end
end

def is_a_duplicate
  @duplicate_song
end

end # of Song class
