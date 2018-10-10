require 'rest-client'
require 'json'
require 'pry'

def api_parser(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character)
  response_hash = api_parser("http://www.swapi.co/api/people")
  next_page_url = response_hash["next"]

  while next_page_url
    response_hash["results"].each do |person|
      if person["name"].downcase == character
        return person["films"].map {|film| api_parser(film)}
      end
    end

    next_page_url = response_hash["next"]
    response_hash = api_parser(response_hash["next"]) if next_page_url
  end
end

def print_movies(films_hash)
  films_hash.each do |movie|
    puts "---------------"
    puts "Title: #{movie["title"]}"
    puts "Episode: #{movie["episode_id"]}"
    puts "Opening Crawl: #{movie["opening_crawl"]}"
    puts "---------------"
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  if films_array
    print_movies(films_array)
  else
    puts "I'm sorry, the character couldn't be found!"
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
