require_relative 'hangman_graphic.rb'

class GameFunctions < Graphic

  def welcome
    puts space
    puts "  THE " + "HANGMAN ".yellow + "GAME"
    hangman_graphic
    puts "Welcome to hangman, please enter " + "NEW GAME".green + " to start a new game, " + "HISTORY".green  + ", to see how many games you have won or lost, or " + "EXIT".red + " to exit out of the game (all history will be lost)"
  end

  def user_choice(desired_action)
    case desired_action
      when 'new game'
        game_flow
      when 'load'
        load_game
      when "history"
        display_history
      when "exit"
        goodbye
      else
      invalid_message_restart
    end
  end


  def reset
    self.random_word = random_word_generator
    @letters_guessed = []
    @amount_wrong_turns = 0
    welcome
    user_choice(action_input)
    game_flow
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
    puts "      GAME WON!!!".green
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
  end

  def recurrent_message
    # puts "PLEASE ENTER A LETTER TO BEGIN:"
    puts space
    puts "Here are the letters that you've guessed: #{self.letters_guessed} "
    puts space
    puts "        ♡".red + " = #{lives_left}"
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
    puts "YOU LOST".red
    hangman_graphic
    puts space
    puts "The word was:"
    puts space
    puts "            " + random_word.upcase.green
    puts "    "
    puts "YOU SHOULD TRY IT AGAIN!"
    puts space
    self.games_lost += 1
    reset
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
      puts "YOU ALREADY GUESSED THAT LETTER, ENTER IN A NEW ONE:"
      input
    end
  end

  def input
    puts "PLEASE ENTER A LETTER TO BEGIN:"
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
    user_choice(action_input)
  end

end
