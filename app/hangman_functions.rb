require_relative 'hangman_graphic.rb'

class GameFunctions < Graphic
  attr_accessor :spaces, :random_word, :amount_wrong_turns
  
  def welcome
    puts "      "
    puts "  THE " + "HANGAMAN ".yellow + "GAME"
    hangman_graphic
    puts "welcome to hangman, please enter NEW GAME to start a
    new game, or LOAD, to continue a saved game. (type SAVE at any point to
    save a game and continue at a later time)"
  end

  def load_or_new(desired_action)
    if desired_action == 'new game'
      game_flow
    elsif desired_action == 'load game'
      load_game
    end
  end

  def save_game
    attributes = {letters_guessed: letters_guessed,random_word: random_word, correct_letters: correct_letters, amount_wrong_turns: amount_wrong_turns, spaces: spaces}
    memory = File.write('./config/memory.json', attributes.to_json)
  end

  def load_game
    memory = JSON.parse(IO.read('./config/memory.json'))
    memory.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    puts "    "
    puts "GAME SUCCESSFULLY LOADED".green
    puts "    "
    game_flow
  end

  def random_word_generator
     words = File.read('./config/words.json').split(" ")
     words.sample
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
    hangman_graphic
    display_lives_available
    puts "       "
    puts "YOU SHOULD TRY IT AGAIN!"
    puts "       "
  end

  def recurrent_message
    puts "PLEASE ENTER A LETTER TO BEGIN"
    puts "      "
    puts "       ♡ = #{lives_left}"
  end

  def action_input
    @action_input = gets.chomp.downcase
  end

  def lost_the_game
    puts "      GAME LOST".red
    hangman_graphic
    puts "       "
    puts "YOU SHOULD TRY IT AGAIN!"
    puts "       "
  end

  def game_won?
    spaces.gsub(/\s+/, "") == random_word
  end
  
  def game_lost?
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
    puts "PLEASE ENTER A LETTER OR TYPE SAVE TO SAVE AND QUIT THE GAME"
    puts "      "
    @user_input = gets.chomp.downcase
  end

end