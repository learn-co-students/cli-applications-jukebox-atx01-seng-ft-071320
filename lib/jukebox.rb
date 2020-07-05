# Add your code here
require "pry"

def help 
  
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
  
end


def list (songs)
  
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
  
end



def play (songs)
  
  song_titles = []
  
  songs.each do |song|
    song_titles << song.slice(song.index("-")+2, song.length - (song.index("-")+2))
  end
  
  puts "Please enter a song name or number:"
  
  user_input = gets.strip
  new_user_input = user_input.to_i


  if new_user_input > 0 && new_user_input < songs.length
    if songs[new_user_input-1] != nil
      puts "Playing #{songs[new_user_input-1]}"
    else
      puts "Invalid input, please try again"
    end
  elsif user_input.split.include?("-")
     if songs.index(user_input) != nil
      puts "Playing #{user_input}"
     else
      puts "Invalid input, please try again"
     end
  else
    song_index = song_titles.index(user_input)
    if song_index != nil
      puts "Playing #{songs[song_index]}"
    else
      puts "Invalid input, please try again"
    end
  end
  
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  
  puts "Please enter a command:"
  
  user_input =
  
  while user_input != "exit"
  
    user_input = gets.strip
    
    if user_input == "list"
      list(songs)
    end
    
    if user_input == "play"
      play(songs)
    end
  
    if user_input == "help"
      help()
    end
  
    if user_input == "exit"
      exit_jukebox()
      break
    end
  
  end
  
  
  
end
