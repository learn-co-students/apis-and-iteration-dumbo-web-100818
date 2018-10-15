require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  yar = []
  films = []

  response_hash["results"].each do |x|
    if x["name"] == character
      films = x["films"]
    end
  end

  if films == []
    puts "NOPE"
  end

  films.each do |x|
    yar << JSON.parse(RestClient.get(x))
  end
  yar
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |x|
    puts x["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
