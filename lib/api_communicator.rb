require 'rest-client'
require 'json'
require 'pry'


def get_info_from_user

end
def get_character_movies_from_api(character)

response_string = RestClient.get('http://www.swapi.co/api/people/')
response_hash = JSON.parse(response_string)
films = []
array = response_hash["results"]
array.map do |x|
if x["name"].downcase == character
    films << x["films"]
end
end
return films
end

# def get_movie_info(movie_name)
#   response_string = RestClient.get('https://www.swapi.co/api/films/')
#   response_hash = JSON.parse(response_string)
#
#   info = []
#   array = response_hash["results"]
#   array.map do |x|
#     if x["title"].downcase == movie_name
#       info << x["producer"]
#       info << x["director"]
#     info << x["release_date"]
# end
# end
# return info
# end



def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
   films_array.each do |x|
     puts x
end
end

  def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)

  end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
