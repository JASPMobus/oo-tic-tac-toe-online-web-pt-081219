class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def initialize
    board = []
    
    9.times do
      board.push(" ")
    end
    
    self.board = board
  end
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token="X")
    board[index] = token
  end
  
  def position_taken?(pos)
    board[pos] != " " && board[pos] != nil
  end
  
  def valid_move?(pos)
    !position_taken?(pos) && (0 <= pos) && (pos <= 8)
  end
  
  def turn_count
    count = 0 
    
    board.each do |pos|
      if pos != " " then 
        count += 1
      end
    end
    
    count
  end
  
  def current_player
    if turn_count % 2 == 0 then 
      "X"
    else 
      "O"
    end
  end
  
  def turn
    valid = false
    player = current_player
    
    until valid do 
      puts "Where do you want to put your next mark? (#{player}, 1-9)"
      move = gets.strip
      iti_move = input_to_index(move)
      
      if valid_move?(iti_move) then
        move(iti_move, player)
        valid = true
      else
        puts "You cannot put your mark there!"
      end
    end
    
    display_board
  end
  
  def won?
    winning_combo = nil
    
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " " then
        winning_combo = combo
      end
    end
    
    winning_combo
  end
  
  def full?
    !board.find{ |tile| tile == " "}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if !won?
      return nil
    else
      current_player == "O" ? "X" : "O"
    end
  end
  
  def play
    until over? do 
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end