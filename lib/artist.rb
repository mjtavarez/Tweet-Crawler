require_relative '../config/environment.rb'
require_relative './illenium_artist_api.rb'
require_relative './scraper.rb'

require 'pry'

class Artist
  attr_accessor :username, :public_favorites_count, :likes_count, :reposts_count, :comments_count, :followers_count, :followings_count
  attr_reader :songs

  @@artists = []


  def initialize(artist_hash)
    artist_hash.each{|k,v| self.send("#{k}=", v) unless !self.methods.include?(k)}
    self.class.all << self unless self.class.all.include?(self)
    @songs = []
    self
  end

  def self.create_from_collection(artists_array)
    artists_array.each{|artist_hash| self.new(artist_hash)}
  end

  def self.all
    @@artists
  end

  def songs
    Song.all.select{|song| song.artist == self}
  end

end

# c = Scraper.scrape_from_api(ILL_ARTIST)
# binding.pry
# b = Scraper.all
# binding.pry
# puts Artist.all

