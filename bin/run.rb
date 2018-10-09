#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def runner
character = get_character_from_user
if character != "Exit"
	show_character_movies(character)
	runner
end
end

welcome
runner


#if the character is equal to exit then break out of program
#else run the program 

