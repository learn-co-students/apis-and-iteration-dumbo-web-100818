require 'rest-client'
require 'json'
require 'pry'

def api_parser(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character)
  #make the web request

  response_hash = api_parser("http://www.swapi.co/api/people")

  # next_page_url = true
  # all_characters = []
  # while true
  #   all_characters << response_hash["results"]
  #   next_page_url = response_hash["next"]
  #   break if next_page_url == null
  #   response_hash = api_parser(response_hash["next"])
  # end




  all_characters = []
  i = 1
  while i < 10
    response_hash = api_parser("http://www.swapi.co/api/people/?page=#{i}")
    all_characters << response_hash["results"]
    i += 1
  end

  films = []

  all_characters.flatten.each do |person|
    if person["name"].downcase == character
      films = person["films"]
    end
  end

  films.map do |api|
    api_parser(api)
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

get_character_movies_from_api("bb8")

def print_movies(films_hash)
  films_hash.each do |movie|
    puts ""
    puts "Title: #{movie["title"]}"
    puts "Episode: #{movie["episode_id"]}"
    puts "Opening Crawl: #{movie["opening_crawl"]}"
    puts "*" * 25
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
