
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    input = filename.split(" - ") # Splits song name and artist
    new_song = self.create_by_name(input[1].delete_suffix(".mp3")) # Creates a song using 
    new_song.artist_name = input[0]
    new_song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end


