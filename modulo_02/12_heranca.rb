class Pessoa
    attr_accessor :nome, :email
end

class PessoaFisica < Pessoa
    attr_accessor :cpf

    def falar(texto)
        texto
    end
end

class PessoaJuridica < Pessoa
    attr_accessor :cnpj

    def pagar_fornecedor
        "pagando..."
    end
end



p1 = Pessoa.new
p1.nome = "maria"
p1.email = "maria@gmail.com"

puts p1.nome
puts p1.email
puts "-------------------------"

p2 = PessoaFisica.new
p2.nome = "clara"
p2.email = "clara@gmail.com"
p2.cpf = "111111111"

puts p2.nome
puts p2.email
puts p2.cpf
puts p2.falar("isaskasdsd")
puts "-------------------------"

p2 = PessoaJuridica.new
p2.nome = "ti"
p2.email = "ti@gmail.com"
p2.cnpj = "2222222-0001"

puts p2.nome
puts p2.email
puts p2.cnpj
puts p2.pagar_fornecedor
puts "-------------------------"
