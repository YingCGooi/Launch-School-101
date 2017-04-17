# Tic Tac Toe

# 1. Display the intial empty 3x3 grid
# 2. Prompt user to mark a square - user marks a square
# 3. Computer marks a square
# 4. Display the updated board state
# 5. If there is a winner, we display the winner
# 6. If board is full, display a tie
# 7. Otherwise if neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Goodbye!
require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system("clear") || system("cls")
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}   "
  puts "     |     |     "
  puts ""
end

# rubocop: enable Metrics/MethodLength, Metrics/AbcSize
def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
    when 0    then ' '
    when 1    then arr.first.to_s
    when 2    then arr.join(" #{word} ")
    when 3..9 then arr.take(arr.size - 1).join(delimiter) + " #{word} " + arr.last.to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player' then player_places_piece!(brd)
  when 'Computer' then computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  case current_player
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # we try to return true or false
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).uniq == [PLAYER_MARKER]
      return 'Player'
    elsif brd.values_at(*line).uniq == [COMPUTER_MARKER]
      return 'Computer'
    end
  end
  nil
end

def game_end?(score_1, score_2)
  score_1 >= 5 || score_2 >= 5
end

player_score   = 0
computer_score = 0
current_player = 'Player'
loop do
  board = initalize_board

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  player_score   += 1 if detect_winner(board) == 'Player'
  computer_score += 1 if detect_winner(board) == 'Computer'

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  prompt("Player's score is #{player_score} | Computer's score is #{computer_score}")

  if game_end?(player_score, computer_score)
    prompt("#{detect_winner(board)} won the game!")
    break
  end

  answer = ''
  loop do
    prompt("Hit 'Enter' to continue playing, 'X' to exit)")
    answer = gets.chomp
    break if %(x yes yup y).include?(answer.downcase)
  end
  next if answer.empty?
  break if %(x).include?(answer.downcase)
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
