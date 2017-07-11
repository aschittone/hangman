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

  def goodbye
    abort("GOODBYE".green)
  end

  def action_input
    # ask user for 'save' or 'load' action
    @action_input = gets.chomp.downcase
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

end
