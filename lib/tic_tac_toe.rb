require "pry"
class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [  [0,1,2], #Top ROW
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]]

  def WIN_COMBINATIONS
    @@WIN_COMBINATIONS
  end

  def initialize(board = nil)

    @board = board ||
    Array.new(9, " ")
  end

  def display_board
  # a variable game = a new TicTacToe instance and inserts "board"
    game = TicTacToe.new("board")
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
game
end

  def input_to_index(string)
    string = string.to_i
    string - 1
  end


  def move(index, token = "X")
    @board[index] = token
  end


  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


    def valid_move?(position)

      #if less than 0 or greater than 8 is false
    if (position < 0) || (position > 8)
      return false
        #if index is between 0-8 return and the position is not taken, return true
      elsif (position.between?(0,8)) && !position_taken?(position)
        return true
        # if index is already included on board, return false or nil
    end
  end

  def turn_count

   count = 0
    @board.each do |turn|
      if (turn == "X" || turn == "O")
     count += 1
      end
  # board.each{|turn| puts "#{turn}"}
    end
    return count
  end

    def current_player

      if turn_count.even? == false
        return "O"
      else
        turn_count.even? == true
        return "X"
      end
    end

    def turn
    #  binding.pry
     #@board
        puts "Please enter 1-9:"
#get input
    user_input = gets.strip
  #  binding.pry

#convert input to index
    index = input_to_index(user_input)
#if index is valid, make the move. ask for input again after failed validation
      if valid_move?(index)

      #  binding.pry
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    #
#Your #won? method should return false/nil if there is no win combination present in the board
# and return the winning combination indexes as an array if there is a win. Use your WIN_COMBINATIONS constant in this method.

    def won?
      @board
    @@WIN_COMBINATIONS
WIN_COMBINATIONS.each do |win_combination|
# binding.pry
 #if (board[combinations[0]] == board[combinations[1]]) && (board[combinations[2]] == board[combinations[0]]) && position_taken?(combinations[0])
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = board[win_index_1] # load the value of the board at win_index_1
   position_2 = board[win_index_2] # load the value of the board at win_index_2
   position_3 = board[win_index_3] # load the value of the board at win_index_3

   if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
  #WIN_COMBINATIONS[2].join(", ").to_s
  return win_combination
    # WIN_COMBINATIONS[2]
     end
  #if win positions not on board, return false
end
    return false
  end

  def full?

  @board.all?{|token| token == "X" || token == "O"}
end


def draw?

  if full? && !won?
    return true
  else !won? && !full? || won? == true
  return false
  end
end

def over?

  if won? || draw? || full?
    return true
  end
end

def winner
#binding.pry
  if win_combo = won?
  return @board[win_combo[0]]
    return win_combo[0]
    end
  end

  def play
#binding.pry
    until over?
    #  binding.pry
    turn
    end
#binding.pry
      if won?
        puts "Congratulations #{winner}!"

  elsif draw? == true
      puts "Cat's Game!"
        end
      end

end
