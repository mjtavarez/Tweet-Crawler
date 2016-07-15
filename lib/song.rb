require_relative '../config/environment.rb'
require_relative './sample_song_api.rb'

# SONG_URL = "https://soundcloud.com/only1dram/broccoli"
# SONG_URI = "https://api.soundcloud.com/tracks/257659076?client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea"
# song_hash = Crawler.scrape_from_api(SONG_URI)

song = Scraper.scrape_from_api(SAMPLE)

class Song
  attr_accessor :title, :purchase_url, :genre, :song_url, :permalink_url, :user
  attr_reader :artist

  @@songs = []

  def initialize(song_hash)
    song_hash.each{|k,v| self.send("#{k}=", v) unless !self.methods.include?(k)}
    self.class.all << self
    self
  end

  def self.all
    @@songs
  end

  def artist
    self.user["username".to_sym]
  end

end

# Song.new(song[0])
# binding.pry
# puts Song.all
# puts Song