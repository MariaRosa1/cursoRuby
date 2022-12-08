require 'calculator'

describe Calculator do
  it'use sum method for 2 numbers' do
    calc = Calculator.new
    result = calc.sum(5,6)
    expect(result).to eq(11)
  end

  example'use sum method for 2 negative numbers' do
    calc = Calculator.new
    result = calc.sum(-5,-6)
    expect(result).to eq(-11)
  end
end
