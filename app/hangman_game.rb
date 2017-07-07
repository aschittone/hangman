require 'pry'
require_relative 'hangman_graphic.rb'

class Game < Graphic


  def initialize
    @letters_guessed = []
    @random_word = 'hello'
    @correct_letters = []
    @final_word = []
    @amount_wrong_turns = 0
    self.start
  end

  def start
    puts "welcome to hangman, please enter NEW GAME to start a
          new game, or LOAD, to continue a saved game."
    user_input = gets.chomp.downcase
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
    puts "PLEASE ENTER A LETTER TO BEGIN"
    hangman_graphic
    spaces
    check_letter


  end
  def check_letter
    user_letter = input
    # @correct_letters = spaces.split("")
    @letters_guessed = []
    @random_word.split("").each.with_index do |letter, idx|
      if letter == user_letter
        @letters_guessed << letter 
        @correct_letters[idx + 1] = letter
      end
    end
    puts "CORRECT, keep going"
    puts @correct_letters
  end

  def turn
    puts "enter in another letter"
  end


  def input
    user_input = gets.chomp.downcase
  end

  def spaces
    lines_array = []
    @random_word.split("").map do |letter|
     lines_array << "-"
    end
    puts lines_array.join(" ")
    return lines_array.join(" ")
  end



end
new_game = Game.new
# binding.pry
