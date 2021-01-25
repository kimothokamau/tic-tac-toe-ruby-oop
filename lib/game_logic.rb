# rubocop: disable Metrics/CyclomaticComplexity
require_relative 'board'

class TicTacToe
  def initialize
    h = Board.new
    @board = h.board
    @turn_count = turn_count
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

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

  def won?
    WIN_COMBINATIONS.select do |combination|
      choice1 = @board[combination[0]]
      choice2 = @board[combination[1]]
      choice3 = @board[combination[2]]
      return combination if choice1 == 'X' && choice2 == 'X' && choice3 == 'X'
      return combination if choice1 == 'O' && choice2 == 'O' && choice3 == 'O'
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
    return unless combination

    if combination.all? { |i| @board[i] == 'X' }
      'X'
    elsif combination.all? { |i| @board[i] == 'O' }
      'O'
    end
  end
end
# rubocop: enable Metrics/CyclomaticComplexity
