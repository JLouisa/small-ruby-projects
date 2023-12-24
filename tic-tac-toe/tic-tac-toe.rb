$game_row1 = [" ", " ", " "]
$game_row2 = [" ", " ", " "]
$game_row3 = [" ", " ", " "]
$game_turn = 0

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
    @symbol = "X"
  end
end

class Circle < Players
    attr_accessor :symbol
    def initialize(name)
    super(name)
      @symbol = "O"
    end
  end

#! Gameboard design
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

#! Gameboard modification
def game_coords_module(coord, player)
  case coord.downcase()
  when "a1" then $game_row1[0] = player.symbol
  when "a2" then $game_row1[1] = player.symbol
  when "a3" then $game_row1[2] = player.symbol
  
  when "b1" then $game_row2[0] = player.symbol
  when "b2" then $game_row2[1] = player.symbol
  when "b3" then $game_row2[2] = player.symbol
      
  when "c1" then $game_row3[0] = player.symbol
  when "c2" then $game_row3[1] = player.symbol
  when "c3" then $game_row3[2] = player.symbol
      
  else 
      puts "Please enter a valid coordinate"
      # Coordinates function      
    return 1  
  end
end

#! Game Win Condition
def winning_rule(arr1, arr2, arr3, player)
    # Vertical Checks
    if arr1[0] == player.symbol && arr2[0] == player.symbol && arr3[0] == player.symbol
      return "The Player #{player.name} won!"
    end
    if arr1[1] == player.symbol && arr2[1] == player.symbol && arr3[1] == player.symbol
      return "The Player #{player.name} won!"
    end
    if arr1[2] == player.symbol && arr2[2] == player.symbol && arr3[2] == player.symbol
      return "The Player #{player.name} won!"
    end
    # Horizontal Checks
    if arr1[0] == player.symbol && arr1[1] == player.symbol && arr1[2] == player.symbol
      return "The Player #{player.name} won!"
    end
    if arr2[0] == player.symbol && arr2[1] == player.symbol && arr2[2] == player.symbol
      return "The Player #{player.name} won!"
    end
    if arr3[0] == player.symbol && arr3[1] == player.symbol && arr3[2] == player.symbol
      return "The Player #{player.name} won!"
    end
    # Diagonal LR Checks
    if arr1[0] == player.symbol && arr2[1] == player.symbol && arr3[2] == player.symbol
      return "The Player #{player.name} won!"
    end
    # Diagonal RL Checks
    if arr3[0] == player.symbol && arr2[1] == player.symbol && arr1[2] == player.symbol
      return "The Player #{player.name} won!"
    end
    return nil
  end
  
#! Game Routing
  def game_routing_module()
    case $game_turn
    when 0
      game_flow($player_cross)
    when 1
      game_flow($player_circle)
    end
  end
  

#! Game Flow
def game_flow(player, valid = 0)
  gameboard($game_row1, $game_row2, $game_row3)
  puts valid == 0 ? "It's #{player.name}'s turn, please choose a spot with #{player.symbol}." : "#{player.name}, please enter a valid coordinate. Try again"
  player_choice = gets.chomp()
  coords = game_coords_module(player_choice, player)

  if coords == 1
    game_flow(player, 1)
    return
  end

  won = winning_rule($game_row1, $game_row2, $game_row3, player)
  
  if won != nil
  gameboard($game_row1, $game_row2, $game_row3)
    puts won
    return
  end


  if $game_turn == 0
     $game_turn = 1
  else
    $game_turn = 0
  end
  game_routing_module()
end

#! Game Start
def game_start()
  game_routing_module()
end

#! Setup
puts "Please enter the name of player one (cross)"
player1 = gets.chomp()
puts "Please enter the name of player two (circle)"
player2 = gets.chomp()
$player_cross = Cross.new(player1)
$player_circle = Circle.new(player2)
game_start()