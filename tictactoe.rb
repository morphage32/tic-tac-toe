class Player
  attr_reader :name, :letter

  def initialize(letter)
    @letter = letter
    puts "Please enter a name for player \"#{letter}\":"
    @name = gets
  end

end

class Game
  
  def initialize()
    @game_board = Array.new(9)
  end

  def build_board()
    puts #newline for new board
    row = 1
    slot = 0
    5.times do
      # check if this is a row with slots
      if row.odd?
        # print each slot, with a line between each
        3.times do
          if @game_board[slot] == nil
            print slot + 1
          else
            print @game_board[slot]
          end

          unless (slot + 1) % 3 == 0
            print '|'
          end

          slot += 1
        end
        row += 1
      else
        puts
        print "-+-+-"
        puts
        row += 1
      end
    end
    puts
  end

  def play_turn(player)
    
  end


end

player1 = Player.new("X")
player2 = Player.new("O")
game1 = Game.new()
game1.build_board