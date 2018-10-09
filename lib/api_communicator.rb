require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_films = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  all_characters = response_hash["results"]
  all_characters.each do |each_character|
    if each_character["name"] == character
      each_character["films"].each do |each_film|
          each_film_response_string = RestClient.get(each_film)
          each_film_response_string_hash = JSON.parse(each_film_response_string)
          all_films << each_film_response_string_hash
      end
    end
  end
  return all_films
  # binding.pry
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each_with_index do |each_film, index|
    puts "#{index+1}. Title: #{each_film["title"]}"
    
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
