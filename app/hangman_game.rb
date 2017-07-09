require 'pry'
require_relative 'hangman_graphic.rb'

class Game < Graphic


  def initialize
    @random_word = 'hello'
    @correct_letters = []
    @guessed_letters = []
    @amount_wrong_turns = 0
    start
  end

  def start
    puts "welcome to hangman, please enter NEW GAME to start a
    new game, or LOAD, to continue a saved game. (type SAVE at any point to
    save a game and continue at a later time)"
    user_input = input
    if user_input == "new game"
      new_game
    elsif user_input == "load"
      # load_game
    else
      puts "your entry was invalid, try again."
      start
    end
  end

  def new_game
    puts "We've chosen a random word, PLEASE ENTER A LETTER TO BEGIN"
    sub_letter
    hangman_graphic
    game_flow
  end

  def game_flow
    while @amount_wrong_turns < 5 do
      letter = input
      if check_letter(letter)
        @correct_letters << letter
        @guessed_letters << letter
        if @correct_letters.sort == @random_word.split("").sort
          puts "you're a winner"
          start
        else
          puts "Correct, enter in a new letter!"
        end
      elsif letter.downcase == "save"
        save
      else
        puts "Wrong, guess another letter"
        @guessed_letters << letter
        @amount_wrong_turns += 1
      end
      puts "here are the letters that you've guessed #{@guessed_letters}"
      sub_letter
      hangman_graphic
      # binding.pry
      # index of letter in correct word == @random_word.index(letter)
    end
    puts "you LOST"
    start
  end


  def sub_letter
    new_array = []
    # binding.pry
    @random_word.split("").map do |letter|
      if @correct_letters.include?(letter)
        new_array << letter
      else
        new_array << "_"
      end
    end
    puts new_array.join(" ")
  end

  def save

  end

  def load_game

  end

  def input
    user_input = gets.chomp.downcase
  end

  def check_letter(letter)
    return @random_word.include?(letter)
  end

end

new_game = Game.new
# binding.pry
