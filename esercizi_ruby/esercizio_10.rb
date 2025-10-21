class Contatto
  attr_reader :nome, :cognome, :numero

  def initialize(nome, cognome, numero)
    @nome = nome
    @cognome = cognome
    @numero = numero
    is_valid?
  end

  def to_s
    "#{@nome} #{@cognome}: #{@numero}"
  end

  private

  def is_valid?
    raise StandardError, 'Nome non valido' unless @nome.class == String # @nome.instance_of? String
    raise StandardError, 'Cognome non valido' unless @cognome.class == String
    raise StandardError, 'Numero di telefono non valido' unless @numero.class == String
  end
end

class Rubrica
  attr_reader :lista

  def initialize
    @lista = []
  end

  def aggiungi(nome, cognome, numero)
    contatto = Contatto.new(nome, cognome, numero)
  rescue StandardError
    puts 'Il contatto inserito non è valido'
  else
    @lista.append contatto # @lista << contatto
  end

  def cerca(query)
    matched_contacts = []
    @lista.each do |c|
      cc = c.nome + ' ' + c.cognome
      cc2 = c.cognome + ' ' + c.nome
      if c.nome.include? query || c.cognome.include?(query) || cc.include?(query) || cc2.include?(query)
        matched_contacts << c
      end
    end
    matched_contacts
  end

  def print_contacts
    @lista.each { |c| puts c }
  end

  def rimuovi(contatto)
    raise 'rimuovi: require a Contatto' unless contatto.instance_of? Contatto

    @lista.delete(contatto)
  end
end

r = Rubrica.new
r.aggiungi('filippo', 'poltronieri', '0532')
r.aggiungi('claudio', 'rossi', '0533')
r.print_contacts

c = r.cerca('filippo')
puts "Contatti trovati #{c}"
unless c.empty?
  puts "Rimuovo il contatto trovato #{c.first.class}"
  r.rimuovi(c.first)
end
