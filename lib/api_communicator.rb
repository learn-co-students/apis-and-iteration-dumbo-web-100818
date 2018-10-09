require 'rest-client'
require 'json'
require 'pry'

def api_parser(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character)

  response_hash = api_parser("http://www.swapi.co/api/people")
  next_page_url = true
  all_characters = []
  while next_page_url
    all_characters << response_hash["results"]
    next_page_url = response_hash["next"]
    (response_hash = api_parser(response_hash["next"])) if next_page_url
  end

  # all_characters = []
  # i = 1
  # while i < 10
  #   response_hash = api_parser("http://www.swapi.co/api/people/?page=#{i}")
  #   all_characters << response_hash["results"]
  #   i += 1
  # end

  films = []

  all_characters.flatten.each do |person|
    if person["name"].downcase == character
      films = person["films"]
    end
  end

  films.map do |api|
    api_parser(api)
  end
end

p get_character_movies_from_api("luke skywalker")

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
