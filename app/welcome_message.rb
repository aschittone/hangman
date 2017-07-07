puts "Welcome to a command line version of HANGMAN"
puts "do you accept the challenge?"

user_input = gets.chomp

if user_input.downcase == "yes"
  # execute code in other file
else
  puts "goodbye"
end
