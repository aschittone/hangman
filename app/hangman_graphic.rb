
class Graphic

  def hangman_graphic
      case @amount_wrong_turns
      when 0
        puts "      __________".green
        puts "      |        |".green
        puts "               |".green
        puts "               |".green
        puts "               |".green
        puts "               |".green
        puts "               |".green
        puts "               |".green
        puts "    ============".green
        puts "      "
      when 1
        puts "      __________"
        puts "      |        |"
        puts "      0".green + "        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
        puts "      "

      when 2
        puts "      __________"
        puts "      |        |"
        puts "      0".green + "        |"
        puts "      |".green + "        |"
        puts "      |".green + "        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
        puts "      "
      when 3
        puts "      __________"
        puts "      |        |"
        puts "      0".green + "        |"
        puts "      |/".green + "       |"
        puts "      |".green + "        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
        puts "      "
      when 4
        puts "      __________"
        puts "      |        |"
        puts "      0".green + "        |"
        puts "     \\|/".green + "       |"
        puts "      |".green + "        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
        puts "      "
      when 5
        puts "      __________"
        puts "      |        |"
        puts "      0".green + "        |"
        puts "     \\|/".green + "       |"
        puts "      |".green + "        |"
        puts "     /".green + "         |"
        puts "               |"
        puts "               |"
        puts "    ============"
        puts "      "
      when 6
        puts "      __________"
        puts "      |        |"
        puts "      0".red + "        |"
        puts "     \\|/".red + "       |"
        puts "      |".red + "        |"
        puts "     / \\".red + "       |"
        puts "               |"
        puts "               |"
        puts "    ============"
        puts "      "
      end
    end
    def hangman_graphic_won
        puts "      __________"
        puts "      |        |"
        puts "      |        |"
        puts "               |"
        puts "      0".green + "        |"
        puts "     \\|/".green + "       |"
        puts "      |".green + "        |"
        puts "     / \\".green + "       |"
        puts "    ============"
        puts "      "
    end
end
