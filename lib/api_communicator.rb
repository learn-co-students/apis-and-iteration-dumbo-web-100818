require 'rest-client'
require 'json'
require 'pry'




def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # binding.pry
  # response_hash["results"].each do |features|
    # binding.pry
    # if features["name"].downcase == character
    #   features["films"]
    films_hash = []
    response_hash["results"].each do |query|
      # binding.pry
      if query["name"].downcase == character.downcase
        films_hash = query["films"]
      end
    end
    binding.pry
    puts "hii"
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


def print_movies(films_array)
  films_array.each_with_index do |hash, index|

    movie_list = RestClient.get(hash)
    movies = JSON.parse(movie_list)  #movies is a hash
    movies_title = movies["title"]
    puts "#{index+1}  #{movies_title}"
  end
end
  # some iteration magic and puts out the movies in a nice list


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
