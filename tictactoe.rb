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
      else
        puts
        print "-+-+-"
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
        (@game_board[selection - 1] == nil)
        puts "Sorry #{name}, #{selection} is not an open slot. Please try again:"
        selection = nil
      else
        puts "#{name} placed an #{letter} in slot #{selection}!"
        @game_board[selection - 1] = letter
      end
    end
  end

end

player1 = Player.new("X")
player2 = Player.new("O")
board1 = Board.new()
board1.build_board
player1.turn_prompt()
board1.update_board(player1.name, player1.letter)
board1.build_board