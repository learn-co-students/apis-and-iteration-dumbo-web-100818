require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  movie_arr = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  all_characters_array = response_hash["results"]
  all_characters_array.each do |each_character|
    if each_character["name"].downcase == character.downcase
      each_character["films"].each do |movie_website|
        character_movie = RestClient.get(movie_website)
        character_movie_hash = JSON.parse(character_movie)
        movie_arr << character_movie_hash
      end
    end
    return movie_arr
  end

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
 #get_character_movies_from_api("Darth Vader")

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each_with_index do |each_film, index|
    puts "#{index + 1}. titel: #{each_film["title"]} "
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
