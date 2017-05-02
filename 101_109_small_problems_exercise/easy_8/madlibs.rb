# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.


loop do
  print "Enter a noun: "
  noun = gets.chomp
  print "Enter a verb: "
  verb = gets.chomp
  print "Enter an adjective: "
  adj = gets.chomp
  print "Enter an adverb: "
  adverb = gets.chomp

  sentence1 = "Do you #{verb} your #{adj} #{noun} #{adverb}? That's hilarious!"
  sentence2 = "The #{adj} #{noun} #{verb}s #{adverb} over the lazy dog."
  sentence3 = "The #{noun} #{adverb} #{verb}s up #{adj} Joe's turtle."

  puts [sentence1, sentence2, sentence3].sample

  break
end




# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!