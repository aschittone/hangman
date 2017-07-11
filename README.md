# hangman
hangman ruby project

All code for game functions are in the app folder. The config folder contains the JSON file which stores random words for #random_word_generator, used each time the game is ran. Also included in the config folder is the environment.rb file which requires the necessary ../app/ files in order to run the file.

The bin folder includes the run.rb file, which includes the necessary gems to construct/run the game, and starts a new GAME instance upon running the file from the command line.

The GAME class inherits both the Graphic and GameFunctions classes, to include full functionality when a game instance is created.
