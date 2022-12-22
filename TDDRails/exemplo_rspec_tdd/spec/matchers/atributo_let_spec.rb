require 'pessoa'

describe "Atributos" do

  # before(:each) do
  #   @pessoa = Pessoa.new
  # end

  let(:pessoa) {Pessoa.new}

  it "have_attributes" do
    pessoa.nome = "Maria"
    pessoa.idade = 18

    expect(pessoa).to have_attributes(nome: a_string_starting_with("M"), idade: ( a_value >= 18 ))
  end

  it "have_attributes" do
    pessoa.nome = "Marcos"
    pessoa.idade = 19

    expect(pessoa).to have_attributes(nome: a_string_starting_with("M"), idade: ( a_value >= 18 ))
  end
end
