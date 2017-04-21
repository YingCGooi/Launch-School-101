# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
require 'pry'

CARDS_SUIT = ["Spade", "Heart", "Club", "Diamond"]
CARDS_VALUE = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = CARDS_SUIT.product(CARDS_VALUE)
end

def hit_card!(deck)
  random_card = deck.sample
  deck.delete(random_card)
  random_card
end

def deal_cards!(deck, player_hand, dealer_hand)
  player_hand << hit_card!(deck)
  dealer_hand << hit_card!(deck)
  player_hand << hit_card!(deck)
  dealer_hand << hit_card!(deck)
end

def hit(hand, deck)
  hand << hit_card!(deck)
end

def display_hands(player_hand, dealer_hand, all = false)
  if all
    prompt "Dealer has: #{cards_joinor(dealer_hand)}"
  else
    prompt "Dealer has: #{dealer_hand[0][1].to_s} and [?]"
  end

  prompt "You have: #{cards_joinor(player_hand)}"
  puts "=================================="
  display_totals(player_hand, dealer_hand, all)
  puts "=================================="
end

def display_totals(player_hand, dealer_hand, all = false)
  if all
    print "=> Dealer has a total of #{total_value(dealer_hand)} on hand."
    print " - BUSTED!" if bust?(dealer_hand)
    puts ""
  end

  print "=> You have a total of #{total_value(player_hand)} on hand."
  print " - BUSTED!"   if bust?(player_hand)
  puts ""
end

def cards_joinor(hand)
  words = ''
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
    case
    when value == 'A'    then sum += 11
    when value.to_i == 0 then sum += 10
    else sum += value.to_i
    end
  end

  # compensate for Aces
  values.count('A').times do
    sum -= 10 if sum > 21
  end

  sum
end

def bust?(hand)
  total_value(hand) > 21
end

def determine_winner(player_hand, dealer_hand)
  if bust?(dealer_hand)
    :player
  elsif bust?(player_hand)
    :dealer
  elsif total_value(player_hand) > total_value(dealer_hand)
    :player
  elsif total_value(player_hand) < total_value(dealer_hand)
    :dealer
  else
    :tie
  end
end

def display_winner(player_hand, dealer_hand)
  case determine_winner(player_hand, dealer_hand)
  when :player then prompt "YOU WON!"
  when :dealer then prompt "YOU LOST!"
  when :tie    then prompt "It's a tie!"
  end
end

def clear_screen
  system("cls") || system("clear")
end

clear_screen
prompt "Welcome to Twenty-One!"
prompt "Dealing cards... Hit 'Enter' or any key to continue"
gets.chomp

loop do
  clear_screen
  deck = initialize_deck

  player_hand = []
  dealer_hand = []
  deal_cards!(deck, player_hand, dealer_hand)
  display_hands(player_hand, dealer_hand)

  answer = ''
  loop do
    prompt "'Enter' to hit, 's' to stay:"
    answer = gets.chomp

    clear_screen
    hit(player_hand, deck) if answer.empty?
    display_hands(player_hand, dealer_hand)

    break if answer.downcase == 's' || bust?(player_hand)
    next if answer.empty?
    prompt "Invalid input."
  end

  # dealer's turn only if player does not bust
  unless bust?(player_hand)
    loop do
      break if total_value(dealer_hand) >= 17
      prompt "Dealer draws a card..."
      hit(dealer_hand, deck)
    end
    prompt "Dealer ends his turn."
    prompt "Hit 'Enter' or any key to continue..."
    gets.chomp
  end

  clear_screen
  display_hands(player_hand, dealer_hand, all = true)
  display_winner(player_hand, dealer_hand)

  loop do
    prompt "Play again? 'Enter' to continue, 'x' to exit"
    answer = gets.chomp
    break if answer.empty? || answer.downcase == 'x'
    prompt "Invalid input."
    clear_screen
  end
  break if answer.downcase == 'x'
end

prompt "Thank you for playing Twenty-One! Good bye!"