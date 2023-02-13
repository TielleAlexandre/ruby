class Pessoa
  attr_accessor :nome

  def falar
    "Olá, Pessoal"
  end
  def gritar(texto="Olá mundo!")
    "Olá!, #{texto}"
  end

  def self.murmurar(texto)
    "#{texto}!!!"
  end

  def initialize
    puts "Inicializando"
  end

end

class PessoaFisca < Pessoa
  attr_accessor :cnpj

  def pagar_fornecedor
    puts "Pagando fornecedor"
  end
end

p = Pessoa.new
p.nome = "Teste"
puts p.gritar("dia bonito")
puts p.nome

# Sem instanciar a classe

puts Pessoa.murmurar("cadê vc")
