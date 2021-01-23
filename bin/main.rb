# frozen_string_literal: true

class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
    @turn_count = turn_count
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def display_board
    puts ' '
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ' '
  end

  def intro
    puts 'Welcome to the Tic-Tac-Toe Game!'
    display_board
  end

  def input_to_index(user_input)
    user_input.to_i
  end

  def move(input_to_index, current_player)
    @board[input_to_index] = current_player
  end

  def position_taken?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end

  def valid_move?(index)
    !position_taken?(index) && (0..8).include?(index)
  end

  def turn_count
    count = 0
    @board.each do |i|
      count += 1 if %w[X O].include?(i)
    end
    count
  end

  def current_player
    if turn_count.even?
      'X'
    else
      'O'
    end
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

  def won?
    WIN_COMBINATIONS.select do |combination|
      choice1 = @board[combination[0]]
      choice2 = @board[combination[1]]
      choice3 = @board[combination[2]]
      if choice1 == 'X' && choice2 == 'X' && choice3 == 'X'
        return combination
      elsif choice1 == 'O' && choice2 == 'O' && choice3 == 'O'
        return combination
      end
    end
    false
  end

  def full?
    @board.all? { |i| i != ' ' && !i.nil? }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    combination = won?
    if combination
      if combination.all? { |i| @board[i] == 'X' }
        'X'
      elsif combination.all? { |i| @board[i] == 'O' }
        'O'
      end
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations player #{winner}, you won!"
    else
      puts 'Its a draw, play again!'
    end
  end
end

ticytoe = TicTacToe.new
ticytoe.play
