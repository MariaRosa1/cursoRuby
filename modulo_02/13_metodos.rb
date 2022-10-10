class Pessoa
    def falar #metodo de instancia
        "ola"
    end

    def self.gritar(texto) #metodos de classe, não precisa instanciar
        "#{texto} !!!!"
    end
end

p1 = Pessoa.new
puts p1.falar

puts Pessoa.gritar("hi")