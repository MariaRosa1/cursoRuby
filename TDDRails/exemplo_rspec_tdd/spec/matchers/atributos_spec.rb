require 'pessoa'

describe "Atributos" do
  it "have_attributes" do
    pessoa = Pessoa.new
    pessoa.nome = "Maria"
    pessoa.idade = 18

    expect(pessoa).to have_attributes(nome: a_string_starting_with("M"), idade: ( a_value >= 18 ))
  end
  
end
