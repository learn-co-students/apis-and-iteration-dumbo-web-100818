require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  queried_char_films = []
  response_hash["results"].each do |hash_iterator|
      if hash_iterator["name"] == character
          # collect those film API urls, make a web request to each URL to get the info
          #  for that film
          hash_iterator["films"].each do |film|
             queried_char_films << film
         end
     end
 end
    # return value of this method should be collection of info about each film.
    #  i.e. an array of hashes in which each hash reps a given film
    # this collection will be the argument given to `parse_character_movies`
    film_response_string = ""
    film_collection = []
    queried_char_films.each do |film|
        film_response_string =  RestClient.get(film)
        film_response_hash = JSON.parse(film_response_string)
        film_collection << film_response_hash
    end
    print_movies(film_collection)
end

def print_movies(films_hash)
  # some iteratstrion magic and puts out the movies in a nice list
  str = ""
  films_hash.each do |film|
      puts film["title"]
      puts film["episode_id"]
      puts film["director"]
      puts film["producer"]

      binding.pry
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
get_character_movies_from_api("Luke Skywalker")
