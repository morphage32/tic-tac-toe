require './tictactoe.rb'

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