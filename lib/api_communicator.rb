require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  quert = true
  while quert
    response_hash["results"].each do |query|
      if query["name"] == character
        return query["films"]
      end
    end
    if response_hash["next"] == nil
      quert = false
    else
      response_string = RestClient.get(response_hash["next"])
      response_hash = JSON.parse(response_string)
    end
  end
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
  films_array.each_with_index do |link, index|
    # binding.pry
    access_film_link = RestClient.get(link)
    access_film_link_hash = JSON.parse(access_film_link)
    film_name = access_film_link_hash["title"]
    puts "#{index+1} #{film_name}"
  end
end


def show_character_movies(character)

  films_array = get_character_movies_from_api(character)
  if !films_array
    puts "No such character in Star Wars."
  else
    print_movies(films_array)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
