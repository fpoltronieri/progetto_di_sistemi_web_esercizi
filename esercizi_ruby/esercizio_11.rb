module SpellingBee
  def self.is_valid_word?(word, alphabet, rletter)
    # controllare che word sia almeno di 4 lettere?
    return false if word.length < 4

    # word contenga almeno rletter
    return false unless word.include? rletter

    # word sia composta solo da lettere di alphabet
    word.each_char do |c|
      return false unless alphabet.include?(c)
    end

    true
  end

  def self.calculate_points(word, alphabet)
    # mi aspetto una parola già valida
    punti = 1 if word.length == 4
    alphabet = alphabet.chars if alphabet.is_a? String
    # verificare se è un pangramma
    pangramma = alphabet.all? { |c| word.include? c }
    # Versione 2
    is_pangramma = true
    alphabet.each do |l|
      is_pangramma = false unless word.include?(l)
      # if ! word.include? l
      #   is_pangramma = false
      #   break
      # end
    end
    puts "La lettera è un pangramma #{pangramma}"
    punti = word.length if word.length > 4
    punti += 7 if pangramma
    punti
  end

  def self.spell_check(word, alphabet, require_letter)
    if is_valid_word?(word, alphabet, require_letter)
      points = calculate_points(word, alphabet)
      puts "#{word} è una parola valida. Punti: #{points}"
    else
      puts "La parola #{word} non è valida!"
    end
  end
end

alphabet = 'reantis'
required_letter = 'r'
word = 'train'
word_is_valid = SpellingBee.is_valid_word?(word, alphabet, required_letter)
puts "La parola #{word} è valida? #{word_is_valid}"
# puts('train'.chars.all? { |c| 'reantis'.include? c })
# if is_valid_word(...)
