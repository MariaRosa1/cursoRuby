require 'calculator'

describe Calculator, "Sobre a calculadora" do

  context "#sum" do
    it 'with positive numbers' do
      result = subject.sum(5,6)
      expect(result).to eq(11)
    end

    it 'with negative numbers' do
      result = subject.sum(-5,-6)
      expect(result).to eq(-11)
    end
  end
end
