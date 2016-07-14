require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './top50.txt'

# BASE_URL = "https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aall-music&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=20&offset=0&linked_partitioning=1&app_version=1468423845"

class Scraper

  def self.scrape_chart_page(page_url)
    page = Nokogiri::HTML(open(page_url))


  end

end

puts File.read('./top50.txt')

# s =  Scraper.new
# binding.pry
# puts s.class.scrape_chart_page(BASE_URL)