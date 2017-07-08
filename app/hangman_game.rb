require_relative 'hangman_graphic.rb'

class Game < GameFunctions
  attr_accessor :letters_guessed, :random_word, :correct_letters,
                :amount_wrong_turns, :spaces
  
  def initialize
    @letters_guessed = []
    @random_word = random_word_generator
    @correct_letters = []
    @amount_wrong_turns = 0
    @spaces = @random_word.split(//).map {|letter| "-"}.join(" ")
    welcome
    load_or_new(action_input)
  end

  def game_flow
  ############################# 
  # checks if game won or lost
  #############################

    if game_won?
      won_the_game
      return
    elsif game_lost?
      lost_the_game
      return
    end

  #############################
  # displays 'please enter a letter...' + lives available + hangman graphic + spaces/letters_found ---> then asks for input again
  #############################

    recurrent_message

    user_input = input

  #############################
  #  evaluates user input and acts accordingly 
  #############################

    if user_input.downcase == 'save'
      save_game
      return
    elsif letter_exist?(user_input)
      congratulate
      fill_in_spaces
      game_flow      
    else 
      ashame
      increase_wrong_turns
      game_flow
      
    end

  end


end

