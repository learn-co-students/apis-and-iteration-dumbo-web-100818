require 'pry'

def welcome
  # puts out a welcome message here!
  puts "Hey there, Star Wars Fanatic! Who do you want to look for?"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp.downcase

end
