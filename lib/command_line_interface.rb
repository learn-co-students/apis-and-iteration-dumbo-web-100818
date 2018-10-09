def welcome
  puts "Hello! This is an interactive application
   where you can find info about your favorite Star Wars 
   character."
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  character_array = character.split(" ")
  character_array = character_array.collect do |word|
  	word.capitalize
  end
  character = character_array.join(" ")

  # use gets to capture the user's input. This method should return that input, downcased.
end



#iterate through response_hash results
# each hash of this array reps a character and its movies key
#collect the values of that key for each character(hash)
