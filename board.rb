module TicTacToe
  class Board
    attr_accessor :spaces

    def initialize
      @spaces = Array.new(9, "-")
    end

    def generate_board 
      board = ""
      (0..8).step(3) do |i|
        board += "| #{@spaces[i]} | #{@spaces[i + 1]} | #{@spaces[i + 2]} |\n"
      end
      puts board + "\n\n\n"
    end

    def add_symbol(position, symbol) #adds a symbol to a certain position
      @spaces[position] = symbol
    end

    def space_taken?(position) #checks if a certain space is taken
      return @spaces[position] == "X" || @spaces[position] == "O"
    end
  end
end