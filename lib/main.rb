require_relative 'board'
require_relative 'player'

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

playing = 'f'

until playing == 'n'
  game()
  puts "Would you like to play again? 'y' for yes, 'n' for no"
  playing = 'f'

  until playing == 'y' || playing == 'n'
    playing = gets.chomp
    playing = playing.downcase
    unless playing == 'y' || playing == 'n'
      puts "Sorry, invalid entry. Please type 'y' for yes, 'n' for no."
    end
  end
end

puts "Bye!"