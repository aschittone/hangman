
class GameFunctions

  def start
    puts "welcome to hangman, please enter NEW GAME to start a new game, HISTORY, to see how many games you've won or lost, or EXIT, to exit out of the game."
    user_input = input
    if user_input == "new game"
      new_game
    elsif user_input == "history"
      puts "this feature hasn't been set up yet"
      new_game
    elsif user_input == "exit"
      goodbye
    else
      puts "your entry was invalid, try again."
      start
    end
  end

  def goodbye
    abort("goodbye")
  end

  def history

  end

  def sub_letter_and_graphic
    puts "here are the letters that you've guessed #{@guessed_letters}"
    sub_letter
    hangman_graphic
  end

  def new_game
    puts "We've chosen a random word, PLEASE ENTER A LETTER TO BEGIN"
    sub_letter
    hangman_graphic
    game_flow
  end

  def sub_letter
    @new_array = []
    # binding.pry
    @random_word.split("").map do |letter|
      if @correct_letters.include?(letter)
        @new_array << letter
      else
        @new_array << "_"
      end
    end
    puts @new_array.join(" ")
  end

  def input
    user_input = gets.chomp.downcase
  end

  def check_letter(letter)
    return @random_word.include?(letter)
  end

  def check_if_correct
    @new_array.sort == @random_word.split("").sort
  end

  def winner
    puts "you're a winner"
    start
  end

  def continue_game
    letter = input
    if check_letter(letter)
      @correct_letters << letter
      @guessed_letters << letter
      # binding.pry
      puts "Correct, enter in a new letter!"
    elsif letter.downcase == "save"
      save
    else
      puts "Wrong, guess another letter"
      @guessed_letters << letter
      @amount_wrong_turns += 1
    end
  end

  def loser
    puts "you LOST"
    start
  end

  def hangman_graphic
      case @amount_wrong_turns
      when 0
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 1
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      O        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 2
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      O        |"
        puts "      |        |"
        puts "      |        |"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 3
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      O        |"
        puts "      |/       |"
        puts "      |        |"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 4
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      O        |"
        puts "     \|/       |"
        puts "      |        |"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 5
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      O        |"
        puts "     \|/       |"
        puts "      |        |"
        puts "      |        |"
        puts "     /         |"
        puts "               |"
        puts "    ============"
      when 6
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      O        |"
        puts "     \|/       |"
        puts "      |        |"
        puts "      |        |"
        puts "     / \       |"
        puts "               |"
        puts "    ============"
      end
    end
end