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

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER  = ' '
PLAYER_MARKER   = 'X'
COMPUTER_MARKER = 'O'

DEFEND_MARKERS = [PLAYER_MARKER, PLAYER_MARKER, INITIAL_MARKER]
OFFEND_MARKERS = [COMPUTER_MARKER, COMPUTER_MARKER, INITIAL_MARKER]

INITIAL_CURRENT_PLAYER = 'choose'
# Valid options are: 'player', 'computer' or 'choose'

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system("clear") || system("cls")
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  clear_screen
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

def determine_player
  choice = ' '
  while INITIAL_CURRENT_PLAYER == 'choose'
    prompt "Who goes first? Enter 'p' for player, 'c' for computer."
    choice = gets.chomp.downcase
    break if %w[p c player computer].include?(choice)
    prompt "Invalid input."
  end

  if choice[0] == 'p' || INITIAL_CURRENT_PLAYER == 'player'
    'Player'
  else
    'Computer'
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  before_last_words = arr.take(arr.size - 1).join(delimiter)
  case arr.size
  when 0    then ' '
  when 1    then arr.first.to_s
  when 2    then arr.join(" #{word} ")
  when 3..9 then before_last_words + " #{word} " + arr.last.to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp
    break if valid_square_number?(brd, square)
    prompt "Sorry, that's not a valid choice."
  end
  square = square.to_i
  brd[square] = PLAYER_MARKER
end

def valid_square_number?(brd, number)
  empty_squares(brd).include?(number.to_i) && number == number.to_i.to_s
end

def defend_square(board)
  defend_lines = WINNING_LINES.select do |line|
    current_markers = board.values_at(*line)
    DEFEND_MARKERS.sort == current_markers.sort
  end
  empty_square_in(defend_lines.sample, board)
end

def offend_square(board)
  offend_lines = WINNING_LINES.select do |line|
    current_markers = board.values_at(*line)
    OFFEND_MARKERS.sort == current_markers.sort
  end
  empty_square_in(offend_lines.sample, board)
end

def empty_square_in(line, board)
  line.select { |num| board[num] == INITIAL_MARKER } .first unless line.nil?
end

def random_square(board)
  empty_squares(board).sample
end

def center_square(board)
  5 if empty_squares(board).include?(5)
end

def computer_places_piece!(brd)
  chosen_square = offend_square(brd) ||
                  defend_square(brd) ||
                  center_square(brd) ||
                  random_square(brd)

  brd[chosen_square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player'   then player_places_piece!(brd)
  when 'Computer' then computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  case current_player
  when 'Player'   then 'Computer'
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
    if    brd.values_at(*line).uniq == [PLAYER_MARKER]
      return 'Player'
    elsif brd.values_at(*line).uniq == [COMPUTER_MARKER]
      return 'Computer'
    end
  end
  nil
end

def game_end?(score1, score2)
  score1 >= 5 || score2 >= 5
end

player_score   = 0
computer_score = 0

clear_screen
prompt "Welcome to Tic-tac-toe!"
if INITIAL_CURRENT_PLAYER != "choose"
  prompt "You have chosen #{INITIAL_CURRENT_PLAYER} to go first."
  prompt "Hit 'Enter' to continue."
  gets.chomp
end

loop do
  board = initalize_board
  current_player = determine_player
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
  prompt "Your score: #{player_score} | Computer's score: #{computer_score}"

  if game_end?(player_score, computer_score)
    prompt "#{detect_winner(board)} won the game!"
    break
  end

  answer = ''
  loop do
    prompt "Hit 'Enter' to continue playing, 'X' to exit"
    answer = gets.chomp
    break if answer.downcase == 'x' || answer.empty?
    prompt "Invalid input"
  end

  clear_screen
  next if answer.empty?
  break if answer.downcase == 'x'
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
