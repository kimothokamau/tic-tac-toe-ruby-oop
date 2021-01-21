#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
puts 'Welcome to Tic-Tac-Toe'

class Player
  attr_accessor :name, :token
  def initialize(name, token = 'x')
    @name = name
    @token = token
  end
end

puts 'Player 1: please enter your name'
name1 = gets.chomp
player1 = Player.new(name1)

puts 'Player 2: please enter your name'
name2 = gets.chomp
player2 = Player.new(name2, 'o')

puts '--- each one of you will select one place at a time, wins the first one to place 3 tokens in a row---'

board = Array.new(9, '')

def display_board(board)
  puts ''
  puts " #{board[0]}  | #{board[1]}  | #{board[2]} "
  puts '--- --- ---'
  puts " #{board[3]}  | #{board[4]}  | #{board[5]} "
  puts '--- --- ---'
  puts " #{board[6]}  | #{board[7]}  | #{board[8]} "
  puts ''
end

display_board(board)

puts "#{player1} your token will be #{player1.token}"
puts "#{player2} your token will be #{player2.token}"

puts '------------------------------------'

# here we call de position_change method to insert the playes's input into the board
display_board(board)
puts 'this is the current state of the board, next player'

puts "#{player2} please select your move"
# here we call de position_change method to insert the playes's input into the board
display_board(board)
puts 'this is the current state of the board, next player'

#---in here we are going to display just the exceptional messages of the game, without the logic part or them organized

# in case the player in turn chooses an already occupied space in the board
puts 'invalid input: position already occupied, try again'
display_board(board)
puts 'this is the current state of the board, next player'

# in case the player chooses a space minor or bigger than the spaces available
puts 'invalid input: position out of bounds, try again'
display_board(board)
puts 'this is the current state of the board, next player'

# in case one of the players accomplishes a winning pattern
puts " congratulations #{player1}!!! you've won the game"

# in case the board is full and none of the players win
puts 'wheww! we\'ve got a tie here! let\'s start all over again!'
# here we would call an init function to restart the game

def game_play(board)
  limit = true
  while limit
    player = turn(board, 1) # method to be defined
    puts "#{player} please select your move: between 0-8, on unoccupied spaces"
    puts board
    position = gets.chomp
    move_index = position.to_i
    if game_tied? || won? || board_full? # methods to be defined
      limit = false
    elsif valid_move?(move_index)
      token = player.token
      board[move_index] = token
      change_turns(player) # method to be defined
    elsif !valid_move(move_index)
      puts 'please try again!'
    end
  end
end

def game_full?(board)
  board.all? { |current| current == 'x' || 'o' }
end

def game_tied?
  !won? && board_full?
end

def valid_move?(move_index)
  if (board[move_index] == ('x' || 'o')) || (move_index > board.length)
    false
  else
    true
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
