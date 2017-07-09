
class Graphic

  def hangman_graphic
      case @amount_wrong_turns
      when 0
        puts ""
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
        puts ""
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
        puts ""
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
        puts ""
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
        puts ""
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
        puts ""
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
        puts ""
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
        puts ""
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

