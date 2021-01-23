class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
  end

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

  def dummy_player
    if @play_count < 19
      'X'
    else
      'O'
    end
  end

  def turn2
    @play_count = 0
    player = 'O'
    intro
    while @play_count < 10
      puts "Player #{player}, please enter a number between 0 and 8"
      user_input = gets.chomp
      puts "Player #{player},  invalid move, you entered #{user_input} try again"
      user_input = gets.chomp
      display_board
      puts "Player #{player}, valid move, you entered #{user_input}!"
      @play_count += 1
    end
    puts "Play again #{player}, you drew :("
  end

  def turn
    @play_count = 0
    player = 'X'
    intro
    while @play_count < 10
      puts "Player #{player}, please enter a number between 0 and 8"
      user_input = gets.chomp
      puts "Player #{player},  invalid move, you entered #{user_input} try again"
      user_input = gets.chomp
      display_board
      puts "Player #{player}, valid move, you entered #{user_input}!"
      @play_count += 1
    end
    puts "Congratulations #{player}, you have won!"
    turn2
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.turn
