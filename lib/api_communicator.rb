require 'rest-client'
require 'json'
require 'pry'

def json_pull(link = 'http://www.swapi.co/api/people/')
  response_string  = RestClient.get(link)
  response_hash = JSON.parse(response_string)
end


def get_character_movies_from_api(character)
  #make the web request
  correct_character = json_pull["results"].select do |character_hash|
    character_hash["name"] == character
    #binding.pry
end
  correct_character = correct_character[0]
  films_of_character = correct_character["films"]
  films_hash = films_of_character.collect do |film|
    film_string = RestClient.get(film)
    film_hash = JSON.parse(film_string)
  end
  films_hash
end

def print_movies(films_hash)
  films_hash.each do |film|
    puts film["title"]
  end
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end



def runner
character = get_character_from_user
if character != "Exit"
  show_character_movies(character)
  runner
end
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
