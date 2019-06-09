require 'pry'

class Artist
  
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods, Findable
  include Paramable, Memorable::InstanceMethods

  @@artists = []
  
  def self.all
    @@artists
  end

  def initialize
    super
    @songs = []
  end

  def add_songs(song)
    @songs << song
    song.artist = self
    songs.each { |song| add_songs(song) }
  end

end