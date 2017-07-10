require_relative 'hangman_graphic.rb'

class Game < GameFunctions
  attr_accessor :letters_guessed, :random_word, :amount_wrong_turns, :spaces, :user_name, :games_won, :games_lost

  def initialize
    @letters_guessed = []
    @random_word = random_word_generator
    @amount_wrong_turns = 0
    @games_won = 0
    @games_lost = 0
    @spaces = @random_word.split(//).map {|letter| "-"}.join(" ")
    welcome
    user_choice(action_input)
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
  # displays 'please enter a letter...' + lives available + hangman graphic
  # + spaces/letters_found ---> then asks for input again
  #############################
    recurrent_message
    user_input = input
  #############################
  #  evaluates user input and acts accordingly
  #############################
    if user_input.downcase == 'save'
      save_game
      return
    elsif user_input.downcase == "exit"
      goodbye
    elsif letter_exist?(user_input)
      winner_message
      fill_in_spaces
      game_flow
    else
      loser_message
      fill_in_spaces
      increase_wrong_turns
      game_flow
    end
  end
end
