# Voglio scaricare il file alla path https://raw.githubusercontent.com/david47k/top-english-wordlists/refs/heads/master/top_english_nouns_lower_20000.txt
require 'net/http'
require 'uri'

# Convert url into a URI
url = 'https://raw.githubusercontent.com/david47k/top-english-wordlists/master/top_english_words_mixed_500000.txt'
uri = URI(url)

# Make the HTTP request
body = Net::HTTP.get(uri)
dictionary = body.split("\n").map(&:downcase).select { |w| w.length >= 4 }
# Exclude element which are not strign
# dictionary = dictionary.select { |w| w.is_a?(String) }

puts "Una parola a caso dal dizionario: #{dictionary.sample}"

alphabet = 'reantis'
require_letter = 'r'
word = 'train'

# Usiamo i moduli definiti nell'esercizio_11.rb
require_relative './esercizio_11'
include SpellingBee

dictionary.each do |word_d|
  word_d = word_d.chomp.to_s
  # puts "#{word_d.class}"
  valid = SpellingBee.is_valid_word?(word_d, alphabet, require_letter)
  if valid
    points = SpellingBee.calculate_points(word_d, alphabet)
    puts "Word: #{word} Points: #{points}"
  end
end
