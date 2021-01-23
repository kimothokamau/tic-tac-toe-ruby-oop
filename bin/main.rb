#!/usr/bin/env ruby
require_relative '../lib/logic.rb'

def intro
  puts 'Welcome to the Tic-Tac-Toe Game!'
  display_board
end

def turn
  player = current_player
  puts "Player #{player}, please enter a number between 0 and 8"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, player)
    @board[index] = player
    display_board
    puts "Hey player #{player}, you selected #{index} and its turn #{turn_count}"
  else
    puts 'Please try again and enter a valid number'
  end
end

public

def play
  intro
  turn until over?
  if won?
    puts "Congratulations player #{winner}, you won!"
  else
    puts 'Its a draw, play again!'
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.play
