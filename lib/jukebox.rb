require 'pry'

def songs
	songs = [
	  "Phoenix - 1901",
	  "Tokyo Police Club - Wait Up",
	  "Sufjan Stevens - Too Much",
	  "The Naked and the Famous - Young Blood",
	  "(Far From) Home - Tiga",
	  "The Cults - Abducted",
	  "Phoenix - Consolation Prizes",
	  "Harry Chapin - Cats in the Cradle",
	  "Amos Lee - Keep It Loose, Keep It Tight"
	]
end

def help
	puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program
	"
end

def list(songs)
	songs.each_with_index do |song, x|
		puts "#{x + 1}. #{song}"
	end
end

def play(songs)
	puts "Please enter a song name or number:"
	song = gets.chomp
	if songs.include?(song)
		puts "Playing #{song}"
		system 'xdg-open'
	elsif song.to_i > 0 && song.to_i <= songs.size
		puts "Playing #{songs[song.to_i - 1]}"		
	else
		puts "Invalid input, please try again"
	end
end


def exit_jukebox
	abort("Goodbye")
end

def prompt
	puts "Please enter a command:"
	gets.chomp
end


def run
	help
	usr_input = ""

	until usr_input == "exit"

		usr_input = prompt

		case usr_input
		when "help"
			help

		when "list"
			list(songs)
			
		when "play"
			play(songs)

		when "exit"
			exit_jukebox
			
		else
			puts "Try again!"
		end

	end

end

run