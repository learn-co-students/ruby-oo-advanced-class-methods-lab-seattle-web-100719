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
      song = self.new()
      song.save
      song
  end

  def self.new_by_name(name)
      song=self.new()
      song.name = name
      song
  end

  def self.create_by_name(name)
      song=self.new_by_name(name)
      song.save
      song
  end


  def self.find_by_name(name)
      @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if song = self.find_by_name(name)
        return song
      else
        song= self.create_by_name(name)
        return song
      end
  end

  def self.alphabetical
      @@all.sort_by{|song| song.name.chr}
  end

  def self.new_from_filename(filename)
      song = self.create
      song.name = filename.split(' - ')[1][0...-4]
      song.artist_name = filename.split(' - ')[0]
      song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
      @@all.clear
  end
end
