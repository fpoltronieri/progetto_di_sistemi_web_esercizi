# Carica un dizionario locale (es. file 'words.txt' con una parola per riga)
# UNIX has a built-in dictionary at /usr/share/dict/words
require 'uri'
require 'net/http'

dictionary = []

begin
  # dictionary = File.readlines('/usr/share/dict/words', chomp: true).map(&:downcase)
  dictionary = File.readlines('banana', chomp: true).map(&:downcase)
rescue Errno::ENOENT
  # Otherwise, download
  url = 'https://raw.githubusercontent.com/dwyl/english-words/refs/heads/master/words.txt'
  dictionary_url = URI(url)
  # Download the dictionary if the file does not exist
  dictionary = Net::HTTP.get(dictionary_url).split("\n").map(&:downcase)
end

puts "Dizionario caricato con #{dictionary.size} parole."
puts "Dictionary \n #{dictionary.sample(10).join(', ')}"
puts "#{dictionary.class}"

# Definisci il set di lettere

# valid_chars = %w[r e a n t i s]
# required_char = 'r'
valid_chars = %w[n e x d u a w]
required_char = 'n'

def is_valid_word?(parola, valid_chars, required_char)
  return false if parola.nil? || parola.empty?

  parola = parola.downcase
  # downcase should not be necessary if dictionary is already downcased
  required_char = required_char.downcase
  valid_chars = valid_chars.map(&:downcase)

  parola.length >= 4 && parola.include?(required_char) && parola.chars.all? { |c| valid_chars.include?(c) }
end

# Genera e filtra parole valide
parole_valide = dictionary.select { |parola| is_valid_word?(parola, valid_chars, required_char) }

# Stampa i risultati
puts "Parole valide trovate: #{parole_valide.join(', ')}"
