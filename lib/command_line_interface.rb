require 'pry'

def welcome
  puts "Hello, how can I help you?"
end

def get_character_from_user
  puts "please enter a character"
  user_input=gets.chomp
  user_input.downcase

end

#get_character_from_user
