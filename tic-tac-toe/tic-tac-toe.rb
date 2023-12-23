game_row1 = ["X", "O", "O"]
game_row2 = [" ", "X", "O"]
game_row3 = [" ", "X", " "]


class Game
    def initialize(score)
        @score = score
    end
end

class Players
    attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Cross < Players
    attr_accessor :symbol
  def initialize(name)
    super(name)
    @symbol = X
  end
end

class Circle < Players
    attr_accessor :symbol
    def initialize
    super(name)
      @symbol = O
    end
  end

def gameboard(arr1, arr2, arr3)
    puts "    1       2      3  "
    puts "        |      |      "
    puts "A   #{arr1[0]}   |  #{arr1[1]}   |  #{arr1[2]}   "
    puts "  ______|______|______"
    puts "        |      |      "
    puts "B   #{arr2[0]}   |  #{arr2[1]}   |  #{arr2[2]}   "
    puts "  ______|______|______"
    puts "        |      |      "
    puts "C   #{arr3[0]}   |  #{arr3[1]}   |  #{arr3[2]}   "
    puts "        |      |      "
end

gameboard(game_row1, game_row2, game_row3)