#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

def songs
  my_songs = {
  "Go Go GO" => '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/01.mp3',
  "LiberTeens" => '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/02.mp3',
  "Hamburg" =>  '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/03.mp3',
  "Guiding Light" => '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/04.mp3',
  "Wolf" => '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/05.mp3',
  "Blue" => '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/06.mp3',
  "Graduation Failed" => '< path to this directory >/home/tami/code/labs/jukebox-cli-web-0716/audio/Emerald-Park/07.mp3'
  }
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
  songs.each do |song, path|
    puts "#{song}"
  end
end

def play(my_songs)
  puts "Please enter a song name:"
  song = gets.chomp
  if songs.keys.include?(song)
    puts "Playing #{song}"
    system "xdg-open #{songs[:song]}"
  else
    puts "Invalid input, please try again"
  end

  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  
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