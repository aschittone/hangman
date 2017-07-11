#   CODE FOR LOAD/SAVE FEATURE (IF NEEDED):

def save_game
  # creates hash of instance attributes with values and
  # saves it on JSON file for later retrieval
  attributes = user_name.to_s {
    games_won: games_won,
    games_lost: games_lost,
    user_name: user_name,
    letters_guessed: letters_guessed,
    random_word: random_word,
    correct_letters: correct_letters,
    amount_wrong_turns: amount_wrong_turns,
    spaces: spaces
  }
  exsisting_memory = JSON.parse(IO.read('../config/memory.json'))
  # binding.pry
  memory = File.write('../config/memory.json', attributes)
  puts "YOUR GAME HAS BEEN SAVED SUCCESSFULLY!"
end

def load_game
  # reads the JSON file containing the hash of attributes and values
  # parses the file with JSON
  memory = JSON.parse(IO.read('../config/memory.json'))

  # iterates through the hash and assigns each instance variable to respective value
  memory.each do |attribute, value|
    self.send("#{attribute}=", value)
  end
  puts "    "
  puts "GAME SUCCESSFULLY LOADED".green
  puts "    "
  # run game with game_flow
  game_flow
end
