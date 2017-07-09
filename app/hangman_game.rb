require 'pry'
require_relative 'game_functions.rb'

class Game < GameFunctions


  def initialize
    @random_word = 'hello'
    @correct_letters = []
    @guessed_letters = []
    @amount_wrong_turns = 0
    @won_games = 0
    @lost_games = 0
    start
  end



  def game_flow
    while @amount_wrong_turns < 6 do
      if check_if_correct
        winner
        @won_games += 1
      else
        continue_game
      end
      sub_letter_and_graphic
    end
    loser
    @lost_games += 1
  end


end

new_game = Game.new
