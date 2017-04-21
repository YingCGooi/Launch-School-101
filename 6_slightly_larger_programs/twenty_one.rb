# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= HIT_LIMIT
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

MAX_VALUE = 21
HIT_LIMIT = 17
CARDS_SUIT = ["Spade", "Heart", "Club", "Diamond"]
CARDS_VALUE = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARDS_SUIT.product(CARDS_VALUE).shuffle
end

def deal_cards!(deck, player_hand, dealer_hand)
  player_hand << deck.pop
  dealer_hand << deck.pop
  player_hand << deck.pop
  dealer_hand << deck.pop
end

def hit(hand, deck)
  hand << deck.pop
end

def display_hands(player, dealer, player_total, dealer_total, all = false)
  if all
    prompt "Dealer has: #{cards_joinor(dealer)}"
  else
    prompt "Dealer has: #{dealer[0][1]} and [?]"
  end

  prompt "You have: #{cards_joinor(player)}"
  puts "=================================="
  display_totals(player_total, dealer_total, all)
  puts "=================================="
end

def display_totals(player_total, dealer_total, all = false)
  if all
    print "=> Dealer has a total of #{dealer_total} on hand."
    print " - BUSTED!" if bust?(dealer_total)
    puts ""
  end

  print "=> You have a total of #{player_total} on hand."
  print " - BUSTED!"   if bust?(player_total)
  puts ""
end

def cards_joinor(hand)
  values = hand.map { |card| card[1] }
  case values.size
  when 2     then values.join(' and ')
  when 3..52 then "#{values[0, values.size - 1].join(', ')} and #{values.last}"
  end
end

def total_value(hand)
  sum = 0
  values = hand.map { |card| card[1] }
  values.each do |value|
    sum += if    value == 'A'    then 11
           elsif value.to_i == 0 then 10
           else  value.to_i
           end
  end

  # compensate for Aces
  values.count('A').times do
    sum -= 10 if sum > MAX_VALUE
  end

  sum
end

def bust?(total)
  total > MAX_VALUE
end

def determine_winner(player_total, dealer_total)
  if bust?(dealer_total)
    :player
  elsif bust?(player_total)
    :dealer
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_winner(player_hand, dealer_hand, player_score, dealer_score)
  case determine_winner(player_hand, dealer_hand)
  when :player then prompt "YOU WON!"
  when :dealer then prompt "YOU LOST!"
  when :tie    then prompt "It's a tie!"
  end
  prompt "Your score: #{player_score} | Dealer's score: #{dealer_score}"
end

def game_end?(player_score, dealer_score)
  player_score >= 5 || dealer_score >= 5
end

def clear_screen
  system("cls") || system("clear")
end

clear_screen
prompt "Welcome to #{MAX_VALUE}!"
prompt "Dealing cards... Hit 'Enter' or any key to continue"
gets.chomp

player_score = 0
dealer_score = 0

loop do
  clear_screen
  deck = initialize_deck

  player_hand = []
  dealer_hand = []
  deal_cards!(deck, player_hand, dealer_hand)

  player_total = total_value(player_hand)
  dealer_total = total_value(dealer_hand)

  display_hands(player_hand, dealer_hand, player_total, dealer_total)

  answer = ''
  loop do
    prompt "'Enter' to hit, 's' to stay:"
    answer = gets.chomp

    clear_screen
    hit(player_hand, deck) if answer.empty?
    player_total = total_value(player_hand)
    display_hands(player_hand, dealer_hand, player_total, dealer_total)

    break if answer.downcase == 's' || bust?(player_total)
    next if answer.empty?
    prompt "Invalid input."
  end

  # dealer's turn only if player does not bust
  unless bust?(player_total)
    loop do
      break if total_value(dealer_hand) >= HIT_LIMIT
      prompt "Dealer hits!"
      hit(dealer_hand, deck)
      dealer_total = total_value(dealer_hand)
    end
    prompt "Dealer ends his turn."
    prompt "Hit 'Enter' or any key to continue..."
    gets.chomp
  end

  clear_screen
  player_score += 1 if determine_winner(player_total, dealer_total) == :player
  dealer_score += 1 if determine_winner(player_total, dealer_total) == :dealer
  display_hands(player_hand, dealer_hand, player_total, dealer_total, true)
  display_winner(player_total, dealer_total, player_score, dealer_score)

  if game_end?(player_score, dealer_score)
    prompt "YOU WON THE GAME!"     if player_score >= 5
    prompt "DEALER WINS THE GAME!" if dealer_score >= 5
    player_score = 0
    dealer_score = 0
  end

  loop do
    prompt "Play again? 'Enter' to continue, 'x' to exit"
    answer = gets.chomp
    break if answer.empty? || answer.downcase == 'x'
    prompt "Invalid input."
    clear_screen
  end
  break if answer.downcase == 'x'
end

prompt "Thank you for playing #{MAX_VALUE}! Good bye!"
