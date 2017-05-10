# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. 

# You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

nouns =
  File.read('nouns.txt').split("\n").map do |line|
    line.split("\t").first
  end .compact
  
verbs =
  File.read('verbs.txt').split("\n").map do |line|
    line.split("\t").first
  end .compact
  
adverbs =
  File.read('adverbs.txt').split("\n").map do |line|
    line.split("\t").first
  end .compact
  
adjectives =
  File.read('adjectives.txt').split("\n").map do |line|
    line.split("\t").first
  end .compact

library = File.read('words.txt').split('SPLIT')
mad_adj  = library[0].split.compact
mad_noun = library[1].split.compact
mad_verb = library[2].split.compact
mad_adv  = library[3].split.compact
  
madly = 
  File.read('sample.txt').split(/\b/).map do |word|
    case
    when nouns.include?(word) then mad_noun.sample
    when verbs.include?(word) then mad_verb.sample
    when adverbs.include?(word) then mad_adv.sample
    when adjectives.include?(word) then mad_adj.sample
    else word
    end
  end .join


puts madly

  
