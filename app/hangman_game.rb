require_relative "welcome_message.rb"

class Game < WelcomeMessage

def initialize
  @letters_guessed = []
  @random_word = random_word
  @correct_letters = []
  @final_word = []
end

end
