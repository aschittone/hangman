require_relative 'hangman_graphic.rb'

class GameFunctions < Graphic
  
  def welcome
    puts "      "
    puts "  THE " + "HANGMAN ".yellow + "GAME"
    hangman_graphic
    puts "welcome to hangman, please enter NEW GAME to start a
    new game, or LOAD, to continue a saved game. (type SAVE at any point to
    save a game and continue at a later time)"
  end

  def load_or_new(desired_action)
    # traffic for load or save game
    if desired_action == 'new game'
      game_flow
    elsif desired_action == 'load game'
      load_game
    end
  end

  def save_game
    # creates hash of instance attributes with values and 
    # saves it on JSON file for later retrieval
    attributes = {letters_guessed: letters_guessed,random_word: random_word, correct_letters: correct_letters, amount_wrong_turns: amount_wrong_turns, spaces: spaces}
    memory = File.write('./config/memory.json', attributes.to_json)
  end

  def load_game
    # reads the JSON file containing the hash of attributes and values 
    # parses the file with JSON
    memory = JSON.parse(IO.read('./config/memory.json'))

    # iterates through the hash and assigns each instance variable to respective value
    memory.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    puts "    "
    puts "GAME SUCCESSFULLY LOADED".green
    puts "    "
    # run game with game_flow
    game_flow
  end

  def random_word_generator
    # file contains list of 100 words
    words = File.read('./config/words.json').split(" ")
    words.sample
    "hello"
  end
  
  def lives_left
    6 - amount_wrong_turns
  end
    
  def congratulate
      puts "#{['YES!!', 'LET\'S GO!', 'ATTA BOY', 'WOW! AMAZING LETTER GUESSING SKILLS!'].sample}"
      puts "       "
  end
  
  def ashame
      puts "#{['OOPS!', 'NO!!', 'WRONG!', 'HA!, YOU THOUGHT!'].sample}"
      puts "       "
  end

  def game_traffic
    ask_for_input
  end
  
  def won_the_game
    puts "      GAME WON!!!".green
    hangman_graphic_won
    display_lives_available
    puts "       "
    puts "the word was:"
    puts "       "
    puts "            " + random_word.upcase.green
    puts "       "
    puts "YOU SHOULD TRY IT AGAIN!"

  end

  def recurrent_message
    puts "PLEASE ENTER A LETTER TO BEGIN"
    puts "      "
    puts "       ♡".red + " = #{lives_left}"

    hangman_graphic
    
    puts "   " + spaces
    puts "     "

  end

  def action_input
    # ask user for 'save' or 'load' action
    @action_input = gets.chomp.downcase
  end

  def lost_the_game
    puts "      GAME LOST".red
    hangman_graphic
    puts "       "
    puts "the word was:"
    puts "       "
    puts "            " + random_word.upcase.green
    puts "    "
    puts "YOU SHOULD TRY IT AGAIN!"
    puts "       "
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
      @amount_wrong_turns += 1
  end
  
  def letter_exist?(user_letter)
    @random_word.include?(user_letter)
  end
  
  def display_lives_available
    puts "       ♡".red + " = #{lives_left}"
  end

  def fill_in_spaces 
    self.spaces = @random_word.split("").map.with_index do |letter, idx|
      if letter == @user_input
        @letters_guessed << @user_input 
      end
      @letters_guessed.include?(letter) ? letter : "-"
    end.join(" ")
  end

  def input
    puts "PLEASE ENTER A LETTER TO BEGIN"
    puts "      "
    @user_input = gets.chomp.downcase
  end

end