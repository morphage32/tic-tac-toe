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