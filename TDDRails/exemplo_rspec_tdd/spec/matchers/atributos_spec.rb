require 'pessoa'

describe "Atributos" do

  # before(:each) do
  #   puts "Antes"
  #   @pessoa = Pessoa.new
  # end

  # after(:each) do
  #   @pessoa.nome = "Sem nome!"
  #   puts "Depois >>>>>> #{@pessoa.inspect}"
  # end

  around(:each) do |teste|
    puts "Antes"
    @pessoa = Pessoa.new

    teste.run #roda o teste

    @pessoa.nome = "Sem nome!"
    puts "Depois >>>>>> #{@pessoa.inspect}"
  end


  it "have_attributes" do
    @pessoa.nome = "Maria"
    @pessoa.idade = 18

    expect(@pessoa).to have_attributes(nome: a_string_starting_with("M"), idade: ( a_value >= 18 ))
  end

  it "have_attributes" do
    @pessoa.nome = "Marcos"
    @pessoa.idade = 19

    expect(@pessoa).to have_attributes(nome: a_string_starting_with("M"), idade: ( a_value >= 18 ))
  end
end


# describe "Atributos" do
#   it "have_attributes" do
#     pessoa = Pessoa.new
#     pessoa.nome = "Maria"
#     pessoa.idade = 18

#     expect(pessoa).to have_attributes(nome: a_string_starting_with("M"), idade: ( a_value >= 18 ))
#   end