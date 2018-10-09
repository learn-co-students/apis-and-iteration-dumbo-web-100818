def welcome
  puts "Welcome!"
end


def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
user_input = gets.chomp
user_input = user_input.downcase
end

#
# def get_movie_from_user
#   puts "please enter a movie name"
#   user_movie_input = gets.chomp
#   user_movie_input = user_movie_input.downcase
# end
