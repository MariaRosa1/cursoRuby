require 'calculator'

describe Calculator, "Sobre a calculadora" do

  context "#div" do
    it "divide by 0" do
      # expect{subject.div(3,0)}.to raise_exception
      expect{subject.div(3,0)}.to raise_error(ZeroDivisionError)
      expect{subject.div(3,0)}.to raise_error("divided by 0")
      expect{subject.div(3,0)}.to raise_error(ZeroDivisionError, "divided by 0")
      expect{subject.div(3,0)}.to raise_error(/divided/)
    end
  end

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
