


def welcome
  puts "Hello please enter character name"

end

def get_character_from_user
  puts "please enter a character"
  user_input = gets.chomp
  user_input.downcase!
  # use gets to capture the user's input. This method should return that input, downcased.
end
