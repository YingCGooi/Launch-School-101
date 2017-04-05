# Bonus features for RPS game

VALID_CHOICES = {
  "r" => "rock",
  "p" => "paper",
  "s" => "scissors",
  "l" => "lizard",
  "k" => "spock"
}

def clear_screen
  system "clear" || system("cls")
end

def display_choices(hash)
  hash.each { |key, value| Kernel.puts("  => #{key} for #{value.upcase}") }
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  win_hash = {
    'rock'      => %w(lizard scissors),
    'paper'     => %w(rock spock),
    'scissors'  => %w(paper lizard),
    'lizard'    => %w(spock paper),
    'spock'     => %w(rock scissors)
  }

  win_hash[first].include?(second)
end

def display_results(player, computer, player_score, computer_score)
  prompt("#{player.upcase} wins #{computer.upcase}") if win?(player, computer)
  prompt("#{computer.upcase} wins #{player.upcase}") if win?(computer, player)
  prompt("It is a tie!") if player == computer
  prompt("Your score: #{player_score} | Computer's score: #{computer_score}")
  prompt('You have won the game!') if player_score >= 5
  prompt('You have lost the game!') if computer_score >= 5
end

def valid_exit_input?(answer)
  answer == "\n" || %w(X x y yes yup ya yep).include?(answer.chomp)
end

player_score = 0
computer_score = 0
choice = ''
player_choice = ''
answer = ''

loop do
  clear_screen
  loop do
    prompt("Choose a letter: ")
    display_choices(VALID_CHOICES)
    choice = Kernel.gets().chomp()

    break if VALID_CHOICES.key?(choice.downcase)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES[VALID_CHOICES.keys.sample]
  player_choice = VALID_CHOICES[choice.downcase]

  prompt("You chose: #{player_choice.upcase}")
  prompt("Computer chose: #{computer_choice.upcase}")

  player_score += 1 if win?(player_choice, computer_choice)
  computer_score += 1 if win?(computer_choice, player_choice)

  display_results(player_choice, computer_choice, player_score, computer_score)

  Kernel.puts("\n---------------------------------------------------")
  loop do
    prompt("Hit enter to continue")
    answer = Kernel.gets()
    break if answer == "\n"
  end
  next unless computer_score >= 5 || player_score >= 5

  loop do
    prompt("Do you want to play again? (Hit Enter or 'y' to play again, 'x' to exit)")
    answer = Kernel.gets()
    break if valid_exit_input?(answer)
    prompt("Invalid input!")
  end
  player_score = 0
  computer_score = 0
  break if answer.chomp.downcase == 'x'
end

prompt("Thank you for playing. Good bye!")
