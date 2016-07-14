require 'soundcloud'
require 'pry'
require 'net/http'
require 'json'
require 'nokogiri'

# URL = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
URL = "https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aall-music&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=20&offset=0&linked_partitioning=5'"
url = "https://soundcloud.com/illeniumofficial"

class Crawler
  attr_reader :results
# client = Soundcloud.new(:client_id => '02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea')
# binding.pry
# page_size = 100
  @@results = []

  def self.scrape_from_api(endpoint_url)  
    uri = URI(URL)
    response = Net::HTTP.get(uri)


    # h = JSON.parse('https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aall-music&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=20&offset=0&linked_partitioning=1')
    h = JSON.parse(response)
    @@results << h
    puts h
  end

  def self.crawl(url)
    page = Nokogiri::HTML(open(url))
    # binding.pry
    puts page
    binding.pry
    # page.css('article.infoStats table').each do |attributes|
    # puts page.css('article.infoStats table')
  end



  def results
    @@results
  end

end

c = Crawler.new
# binding.pry
c.class.crawl(url)
# puts c.class.scrape_from_api(URL)
# binding.pry


# puts c.class
# puts c
# puts c.class.results
# c.class.results.each{|i| puts i.class}

# tracks = client.get()


# client = Soundcloud.new(:client_id => ,
#                         :client_secret => ,
#                         :redirect_url => )

# redirect_to client.authorize_url()