require_relative 'hangman_graphic.rb'

class GameFunctions < Graphic

  def welcome
    puts space
    puts "  THE " + "HANGMAN ".yellow + "GAME"
    hangman_graphic_start
    puts "PLEASE ENTER USERNAME"
    user_name = gets.chomp
    self.user_name = user_name
    if  self.users_in_memory.include?(self.user_name)
      load_game(self.users_in_memory[self.user_name])
      game_stats
    else 
      puts "NEW USERNAME CREATED"
      save_game
      game_stats
    end
    puts "Welcome to hangman #{user_name}."
    user_choice

  end

  def user_choice
    main_menu
    desired_action = action_input
    case desired_action
      when '1'
        self.class.new
      when '2'
        game_flow
      when "3"
        game_stats
        sleep(3)
        user_choice
      when "4"
        leaderboard
      when "5"
        goodbye
      else
      invalid_message_restart
    end
  end

  def main_menu
    puts ""
    puts  "          MAIN MENU"
    puts "------------------------------- \\"
    puts "|                             -| |"
    puts "| 1. SELECT/CREATE NEW USER   -| |"
    puts "| 2. START PLAYING            -| |"        
    puts "| 3. VIEW YOUR SCORES         -| |" 
    puts "| 4. VIEW LEADERBOARD         -| |"
    puts "| 5. QUIT                     -| |"
    puts "-------------------------------\\ |"
    puts "--------------------------------\\|"
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
        puts "  THE " + "HANGMAN ".yellow + "GAME"
        puts ""
        puts "        ❤".red + " = #{lives_left}"
        puts "      __________"
        puts "      |        |"
        puts "      |        |"
        puts "               |"
        puts "      0".green + "        |"
        puts "     \\|/".green + "       |"
        puts "      |".green + "        |"
        puts "     / \\".green + "       |"
        puts "    ============"
        puts "      "
  end

  def leaderboard
    # binding.pry
    sorted_users = users_in_memory.sort_by {|username, attributes| attributes["games_won"]}.reverse
    puts "------------------------------------------"
    puts "|USERNAME |    GAMES WON  |    GAMES LOST |"
    i = 1
    sorted_users.each do |key, values|
      puts ""
      puts "#{i.to_s} - " + key + "          " +"#{values['games_won']}".green + "            " + "#{values['games_lost']}".red+"        "
      i += 1
    end
    sleep(3)
    user_choice
  end


  def reset
    self.random_word = random_word_generator
    @letters_guessed = []
    @amount_wrong_turns = 0
    self.spaces = @random_word.split(//).map {|letter| "_"}.join(" ")
  end

  def random_word_generator
    # file contains list of 100 words
    words = File.read('./config/words.json').split(" ")
    words.sample
  end

  def lives_left
    6 - amount_wrong_turns
  end

  def winner_message
      puts "#{['YES!!', 'LET\'S GIT IT!!!', 'GIT OFF MY LAWN!!!', 'WOW! YOU\'RE AMAZING!'].sample}"
      puts "       "
  end

  def loser_message
      puts "#{['OOPS!', 'WRONG LETTER!', 'WRONG!', "BAD CHOICE!", 'INCORRECT!'].sample}"
      puts "       "
  end

  def won_the_game
        puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""

    puts "                      YOU HAVE WON!".green
    puts ""
    puts ""
    puts ""
    puts "                       The word was"
    puts ""
    puts ""
    puts "                        " + random_word.upcase.green    
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""

    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""

    sleep(3)
    hangman_graphic_won
    display_lives_available
    puts "       "
    puts "THE WORD WAS:"
    puts "       "
    puts "            " + random_word.upcase.green
    puts "       "
    puts "       "
    self.games_won += 1
    reset
    save_game
    game_flow
  end

  def recurrent_message
    # puts "PLEASE ENTER A LETTER TO BEGIN:"
    puts space
    puts "Here are the letters that you've guessed: #{self.letters_guessed} "
    puts space
    puts "        ❤".red + " = #{lives_left}"
    hangman_graphic
    puts "    "+ spaces
  end

  def goodbye
    abort("GOODBYE".green)
  end

  def action_input
    # ask user for 'save' or 'load' action
    @action_input = gets.chomp.downcase
  end

  def lost_the_game
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""

    puts "                      YOU HAVE LOST".red
    puts ""
    puts ""
    puts ""
    puts "                       The word was"
    puts ""
    puts ""
    puts "                        " + random_word.upcase.green    
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""

    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""

    sleep(3)
    hangman_graphic
    puts space
    
    puts space
    puts "    "
    puts "YOU SHOULD TRY IT AGAIN!"
    puts space
    self.games_lost += 1
    reset
    save_game
    game_flow
  end

  def game_won?
    # true if spaces now is the same as random word generated
    spaces.gsub(/\s+/, "") == random_word
  end

  def game_lost?
    # true if amount of wrong turns is greater or equals 6
    amount_wrong_turns >= 6
  end


  def increase_wrong_turns
      self.amount_wrong_turns += 1
  end

  def letter_exist?(user_letter)
    @random_word.include?(user_letter)
  end

  def display_lives_available
    puts "       ♡".red + " = #{lives_left}"
  end

  def fill_in_spaces
    guessed_letter_checker
    self.spaces = @random_word.split("").map do |letter|
      self.letters_guessed.include?(letter) ? letter : "_"
    end.join(" ")
  end

  def guessed_letter_checker
    if !self.letters_guessed.include?(@user_input)
      self.letters_guessed << @user_input
    end
  end

  def guessed_letter_validator
    if self.letters_guessed.include?(@user_input)
      puts "YOU ALREADY GUESSED THAT LETTER!"
      input
    end
  end

  def input
    # puts "PLEASE ENTER A LETTER:"
    puts space
    @user_input = gets.chomp.downcase
    guessed_letter_validator
    @user_input
  end

  def space
    "      "
  end

  def display_history
    puts "Here's how many games you have WON: " + "#{self.games_won}".green
    puts "Here's how many games you have LOST: " + "#{self.games_lost}".red
  end

  def invalid_message_restart
    puts "YOUR ENTRY WAS INVALID, PLEASE TRY AGAIN"
    user_choice
  end


def save_game
  # creates hash of instance attributes with values and
  # saves it on JSON file for later retrieval
  attributes = {
    "#{self.user_name}": {
      games_won: games_won, 
      games_lost: games_lost, 
      letters_guessed: letters_guessed,
      random_word: random_word, 
      amount_wrong_turns: amount_wrong_turns, 
      spaces: spaces
    }
  }

  exsisting_memory = JSON.parse(IO.read('./config/memory.json'))
  exsisting_memory[user_name] = attributes[user_name.to_sym]
  memory = File.write('./config/memory.json', exsisting_memory.to_json)
  puts "GAME SAVED".green
end

def load_game(attributes)
  # reads the JSON file containing the hash of attributes and values
  # parses the file with JSON
  # iterates through the hash and assigns each instance variable to respective value
  attributes.each do |attribute, value|
    self.send("#{attribute}=", value)
  end
  puts "    "
  puts "GAME SUCCESSFULLY LOADED".green
  puts "    "
  # run game with game_flow
end

def users_in_memory
  exsisting_memory = JSON.parse(IO.read('./config/memory.json'))
end


def game_stats
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts "---------------------"
  puts "-                   -"
  puts "    "+"#{self.user_name.upcase}".yellow + "       "
  puts "-                   -"
  puts "-                   -"
  puts "-    GAMES WON      -"
  puts "-        "+ "#{self.games_won}".green + "          -"
  puts "-                   -"
  puts "-    GAMES LOST     -"
  puts "-        " + "#{self.games_lost}".red + "          -"
  puts "-                   -"
  puts "---------------------"
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""

end

end
