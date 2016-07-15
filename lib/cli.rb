require_relative '../config/environment.rb'
require_relative './artist.rb'
require_relative './song.rb'
require_relative './chart.rb'



CHART_TYPES = ["top", "trending"]
CLIENT_ID = "02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea"
limit = "10"
linked_partitioning = "1"

GENRES = ["soundcloud:genres:all-music", "soundcloud:genres:alternativerock", "soundcloud:genres:ambient", "soundcloud:genres:classical", "soundcloud:genres:country", "soundcloud:genres:danceedm",
  "soundcloud:genres:dancehall", "soundcloud:genres:deephouse", "soundcloud:genres:disco", "soundcloud:genres:drumbass", "soundcloud:genres:dubstep", "soundcloud:genres:electronic",
  "soundcloud:genres:folksingersongwriter"
  ]

BASE_URL = GENRES.collect do |genre|
  CHART_TYPES.collect do |chart_type|
    "https://api-v2.soundcloud.com/charts?kind=#{chart_type}&genre=#{genre}&client_id=#{CLIENT_ID}&limit=20&offset=0&linked_partitioning=1"
  end
end

puts BASE_URL

# CHARTS = [
#     ## top-20-all-genres
#     "https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aall-music&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=20&offset=0&linked_partitioning=1",
#     ## top-20-alt-rock
#     "https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aalternativerock&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=20&offset=0&linked_partitioning=1"
#     ## top-20-ambient
#     "https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aambient&client_id=02gUJC0hH2ct1EGOcYXQIzRFU91c72Ea&limit=20&offset=0&linked_partitioning=1",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ## top-20-
#     "",
#     ""
#   ]


class CLI
  

  def initialize

  end

end