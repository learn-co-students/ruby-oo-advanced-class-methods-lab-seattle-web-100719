require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.select do |song|
      song.name == name
    end[0]
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    temp = filename.split(/ - |.mp3/)
    song = Song.new
    song.name = temp [1]
    song.artist_name = temp[0]
    song
  end
  
  def self.create_from_filename(filename)
    temp = filename.split(/ - |.mp3/)
    song = Song.create_by_name(temp[1])
    song.artist_name = temp[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
