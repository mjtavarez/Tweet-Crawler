require 'soundcloud'
require 'pry'
require 'net/http'
require 'json'
# require 'nokogiri'
require_relative './top50.rb'
require_relative './illenium_artist_api.rb'

# URL = 'https://api.spotify.com/v1/search?type=artist&q=tycho'

### all charts will have unique URL, will have to change parameters
# URL = "https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aall-music&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=10&offset=0&linked_partitioning=5'"
# artist_url = "http://api.soundcloud.com/users/27111815?client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea"


class Crawler
  attr_reader :results, :artists
# client = Soundcloud.new(:client_id => '02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea')
# binding.pry
# page_size = 100
  @@results = []
  @@artists = []

  def self.scrape_from_api(endpoint_url)

    # uri = URI(endpoint_url)
    # response = Net::HTTP.get(uri)

    # h = JSON.parse(response)
    
    ### I am stubbing this method with the output I already got from the API
    ### so that I don't have to keep pinging the server--endpoint_url is currently the JSON.parse return hash
    
    if endpoint_url.has_key?("kind".to_sym) && endpoint_url["kind".to_sym] == "user"
      @@artists << endpoint_url
    elsif (endpoint_url.has_key?("kind") && (endpoint_url["kind"] == "top" || endpoint_url["kind"] == "trending"))
      @@results << endpoint_url
    end


    # if h.has_key?("kind".to_sym) && h["kind".to_sym] == "user"
    #   @@artists << h
    # elsif (h.has_key?("kind") && (h["kind"] == "top" || h["kind"] == "trending"))
    #   @@results << h
    # end
    
    # @@results << h
    # binding.pry
    # puts h
  end

  def self.artists
    @@artists
  end

  def self.results
    @@results
  end

end

# c = Crawler.new
# binding.pry
# Crawler.scrape_from_api(URL)
# Crawler.scrape_from_api(artist_url)
# binding.pry
# puts Crawler.results
# puts Crawler.artists


### had to add \"" around "null"
# artists = [{"id":27111815,"kind":"user","permalink":"illeniumofficial","username":"ILLENIUM (Official)","last_modified":"2016/03/07 21:19:25 +0000","uri":"https://api.soundcloud.com/users/27111815","permalink_url":"http://soundcloud.com/illeniumofficial","avatar_url":"https://i1.sndcdn.com/avatars-000198535372-6d80ht-large.jpg","country":"null","first_name":"Nicholas","last_name":"Miller","full_name":"Nicholas Miller","description":"There are melodic bass producers, and then there is Nick Miller. The Denver-based producer known as Illenium has been turning heads in the dance music community over the past year and for good reason. Illenium has distinguished himself from the myriad of others through an unrivaled ability to create an immersive emotional experience of highs and lows that pulls on the heart strings and leaves the listener awestruck, accomplishing in the span of just a few short minutes what takes many a full set. He has displayed an adeptness for creating aural arrangements that vary in style, yet always maintain beauty, complexity and emotional depth. Illenium gave the world a taste of what he has to offer in 2014 with standout originals “Falling In,” “So Wrong,” “Make Me Do;” remixes of Dawn Golden, Odesza, Oh Wonder; and performances at Global Dance Festival, Decadence NYE and other select dates. However, as foreshadowed by his inclusion in UKF’s “Ones to Watch: 15 for 2015,” this is poised to be Illenium’s breakout year.\n\nMGMT - Ha | ha@illenium.com\n\nFEEL FREE TO UPLOAD ANY OF MY ORIGINALS TO YOUTUBE!!! THANKS FOR THE SUPPORT!! :)\n","city":"Denver, Colorado","discogs_name":"null","myspace_name":"null","website":"null","website_title":"null","online":false,"track_count":24,"playlist_count":4,"plan":"Pro Plus","public_favorites_count":432,"subscriptions":[{"product":{"id":"creator-pro-unlimited","name":"Pro Unlimited"}}],"likes_count":445,"reposts_count":14,"comments_count":134,"followers_count":197886,"followings_count":364}]

# results = []
### top20 all genres chart
# results << ALL_GENRE_TOP

# puts results.class
# puts results.size
# binding.pry
# results

Crawler.scrape_from_api(ALL_GENRE_TOP)
Crawler.scrape_from_api(ILL_ARTIST)
binding.pry
Crawler.results
Crawler.artists
