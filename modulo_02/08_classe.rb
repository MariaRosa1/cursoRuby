class Pessoa
    # def initialize(cont = 1)
    #     cont.times do
    #         puts "Inicializando..."
    #     end
    # end

    def initialize(cont = 1)
        cont.times do |i|
            puts "Inicializando... #{i}"
        end
    end


    def falar(nome)
        "Ola, #{nome}"
    end

    def falar2(nome = "pessoas")
        "Ola, #{nome}"
    end

    def falar3(txt1 = "oi", txt2 = "sim")
        "#{txt1} - #{txt2} "
    end
end

p = Pessoa.new
puts p.falar("maria")
puts p.falar2()
puts p.falar3("maria", "clara")

p2 = Pessoa.new(4)
