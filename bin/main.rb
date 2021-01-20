#!/usr/bin/env ruby
puts 'Welcome to Tic-Tac-Toe'

puts 'Player 1: please enter your name'

player1 = gets.chomp

puts 'Player 2: please enter your name'

player2 = gets.chomp
puts '--- each one of you will select one place at a time, wins the first one to place 3 tokens in a row---'

board = ''

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

puts "#{player1} your token will be x"
puts "#{player2} your token will be o"

puts '------------------------------------'

puts "#{player1} please select your move"
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
puts " contratulations #{player}!!! you've won the game"

# in case the board is full and none of the players win
puts 'wheww! we\'ve got a tie here! let\'s start all over again!'
# here we would call an init function to restart the game
