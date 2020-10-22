#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/logic'
require_relative '../lib/board'
puts 'Welcome to tic tac toe, Please enter the player names on consecutive lines.'

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

# rubocop:todo Naming/VariableNumber
while player_1 = Players.new(gets.chomp) # rubocop:todo Lint/AssignmentInCondition
  
  # rubocop:enable Naming/VariableNumber

  puts "Welcome #{player_1.name}" unless player_1.name.empty?
  sleep(1)

  player_2 = Players.new(gets.chomp) # rubocop:todo Naming/VariableNumber

  puts "Welcome #{player_2.name}" unless (player_2.name.empty? || player_1.name.empty?)  || player_2.name == player_1.name 
  sleep(1)

  compare = Compare.new(player_1.name, player_2.name)
    
  if compare.is_equal? && !compare.is_empty? 
    puts 'Please enter a distinctive name'  

  elsif compare.is_empty?
    puts 'Please enter your names'   
    
  elsif compare.is_missing?
    puts 'Both names are required'

  else
    puts 'happy gaming'
    break
  end

end

# Assign either X or O to a player:
# either random or always P1 = X, ect.
sleep(1)
puts "#{player_1.name} you are X"
puts "#{player_2.name} you are 0"
sleep(1)
# countdown to the game:
puts 'The game commences in:'
puts 3
sleep(1)
puts 2
sleep(1)
puts 1
sleep(1)
# Create and Display the game board

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

board_tokens = []

tokens = Board.new(board_tokens)

board_1 = [] # rubocop:todo Naming/VariableNumber

board_2 = [] # rubocop:todo Naming/VariableNumber

breakpoint = board.length

tokens.initial_board

sleep(2)

until breakpoint.zero?

  puts "#{player_1.name} it is your turn, please choose between #{board}"

  loop do
    choice_1 = Position.new(gets.chomp.to_i, board) # rubocop:todo Naming/VariableNumber
    operation = ArrayOperation.new(board, choice_1.choice)
    if choice_1.inside?
      board_1 << choice_1.choice
      operation.to_deleteArr
      board_1.each { |token| board_tokens[token - 1] = 'X' }
      breakpoint -= 1
      break
    else
      puts 'The selected cell is invalid!'
      puts "please choose between #{board}"
    end
  end

  sleep(1)

  # game_board(board_tokens)

  tokens.game_board

  if breakpoint.zero?
    puts 'the game ended in a draw'
    break
  end

  first_player = Logic.new(board_1)

  if first_player.winning_position?
    puts "#{player_1.name}, you are the winner!"
    break
  end

  puts "#{player_2.name} turn please choose between #{board}"

  loop do
    choice_2 = Position.new(gets.chomp.to_i, board) # rubocop:todo Naming/VariableNumber
    operation = ArrayOperation.new(board, choice_2.choice)
    if choice_2.inside?
      board_2 << choice_2.choice
      operation.to_deleteArr
      board_2.each { |token| board_tokens[token - 1] = 'O' }
      breakpoint -= 1
      break
    else
      puts 'The selected cell is invalid or has already been taken!'
      puts "please choose between #{board}"
    end
  end

  # game_board(board_tokens)

  tokens.game_board

  second_player = Logic.new(board_2)

  if second_player.winning_position?
    puts "#{player_2.name}, you are the winner!"
    break
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
