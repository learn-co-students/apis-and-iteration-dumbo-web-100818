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
  films_array = []
  response_hash["results"].each do |element|
    if element["name"].downcase == character.downcase

      films_array = element["films"].sort
      # binding.pry
    end
  end

  if films_array == []
    puts "Sorry, we don't know him"
    character = get_character_from_user
    show_character_movies(character)
  end

  # return value of this method should be collection of info about each film.

array = films_array.flatten.collect do |url|
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  response_hash["title"]
end
# print_movies(array)
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

end




def print_movies(movie_arr)
  # some iteration magic and puts out the movies in a nice list
 movie_arr.each_with_index do |name, index|
   puts "#{index + 1}. #{name}"
 end

end
# get_character_movies_from_api('Luke Skywalker')

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  # binding.pry
  print_movies(films_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
