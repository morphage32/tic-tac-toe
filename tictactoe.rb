class Player
  attr_reader :name, :letter

  def initialize(letter)
    @letter = letter
    puts "Please enter a name for player \"#{letter}\":"
    @name = gets.chomp
  end

  def turn_prompt()
    puts "\nIt's #{name}'s turn! Enter the number of the slot you would like to place your \"#{letter}\":"
  end

end

class Board
  
  def initialize()
    @game_board = ["1","2","3","4","5","6","7","8","9"]
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

          print " #{@game_board[slot]} "

          unless (slot + 1) % 3 == 0
            print '|'
          end

          slot += 1
        end
      else
        puts
        print "---+---+---"
        puts
      end
      row += 1
    end
    puts
  end

  def update_board(name, letter)
    # arguments are the player object's name and letter
    selection = nil

    while selection == nil do
      selection = gets.chomp
      selection = selection.to_i

      # Make sure input is a number, between 1-9, and not already taken in array
      unless (selection.is_a? Numeric) && (selection > 0 && selection < 10) &&
        (@game_board[selection - 1] != 'X' && @game_board[selection - 1] != 'O')
        puts "Sorry #{name}, #{selection} is not an open slot. Please try again:"
        selection = nil
      else
        puts "#{name} placed an #{letter} in slot #{selection}!"
        @game_board[selection - 1] = letter
      end
    end
  end

  def declare_winner()
    # check horizontally
    i = 0
    3.times do
      if (@game_board[i] == @game_board[i + 1]) && (@game_board[i + 1] == (@game_board[i + 2]))
        return @game_board[i]
      end
      i += 3
    end

    #check vertically
    i = 0
    3.times do
      if (@game_board[i] == @game_board[i + 3]) && (@game_board[i + 3] == @game_board[i + 6])
        return @game_board[i]
      end
      i += 1
    end

    #check both diagonals
    if (@game_board[0] == @game_board[4] && @game_board[4] == @game_board[8]) ||
      (@game_board[2] == @game_board[4] && @game_board[4] == @game_board[6])
      return @game_board[4] # diagonal winner will always be in the center slot
    end

    return 'none'

  end

end

def game()

  player1 = Player.new("X")
  player2 = Player.new("O")
  board = Board.new()
  turn = 1
  victor = 'none'

  if rand(1..2) == 1
    current_player = player1
  else
    current_player = player2
  end

  while turn < 10 && victor == 'none'
    board.build_board

    if current_player == player2
      current_player = player1
    else
      current_player = player2
    end

    current_player.turn_prompt()
    board.update_board(current_player.name, current_player.letter)
    victor = board.declare_winner()

    turn += 1
  end

  board.build_board
  puts

  case victor
    when 'X'
      puts "#{player1.name} has won the game!"
    when 'O'
      puts "#{player2.name} has won the game!"
    else
      puts "The game has ended in a tie!"
    end

end

game()