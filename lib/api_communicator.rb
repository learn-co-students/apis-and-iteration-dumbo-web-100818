require 'rest-client'
require 'json'
require 'pry'

def api_parser(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character)
  current_page_url = "http://www.swapi.co/api/people"
  response_hash = api_parser(current_page_url)

  while current_page_url
    response_hash["results"].each do |person|
      if person["name"].downcase == character
        return person["films"].map {|film| api_parser(film)}
      end
    end

    current_page_url = response_hash["next"]
    response_hash = api_parser(response_hash["next"]) if current_page_url
  end
end

def print_movies(films_hash)
  films_hash.each do |movie|
    puts "---------------"
    puts "---------------"
    puts "Title: #{movie["title"]}"
    puts "Episode: #{movie["episode_id"]}"
    puts "Opening Crawl: #{movie["opening_crawl"]}"
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
