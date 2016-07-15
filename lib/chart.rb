require_relative '../config/environment.rb'
require_relative './scraper.rb'
require_relative './top50.rb'

class Chart

  attr_accessor :genre, :kind, :last_updated, :collection, :query_urn, :next_href
  attr_reader :songs, :artists
  
  @@charts = []

  def initialize(chart_hash)
    chart_hash.each{|k,v| self.send("#{k}=", v)}
    @@charts << self
    self
  end

  def self.create_from_collection(charts_array)
    charts_array.each{|chart| self.new(chart)}
  end

  def self.all
    @@charts
  end

  def songs
    self.collection.collect{|song| song["track"]["title"]}
  end

  def artists
    self.collection.collect{|song| song["track"]["user"]["username"]}
  end

  def display

  end

end

# charts_array = Scraper.scrape_from_api(ALL_GENRE_TOP)
# binding.pry
# puts charts_array.class

# c = Chart.create_from_collection(charts_array)
# Chart.all
# binding.pry
# puts c