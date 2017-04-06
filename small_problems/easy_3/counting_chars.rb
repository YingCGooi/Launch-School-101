# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# Input: a word or multiple words
# Output: number of characters excluding spaces

print("Please write word or multiple words: ")
input = gets.chomp

puts("There are #{input.delete(' ').size} characters in \"#{input}\".")