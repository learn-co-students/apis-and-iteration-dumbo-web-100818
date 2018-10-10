require 'pry'

def welcome
  puts "Hey there, Star Wars Fanatic! Who're you looking for?"
end

def get_character_from_user
  puts "Please enter a character name!"
  user_input = gets.chomp.downcase()
end
