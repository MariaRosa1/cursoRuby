$counter = 0

describe "let" do
  let(:count) { $counter += 1 }

  it "memoriza valor" do
    expect(count).to eq(1)
    expect(count).to eq(1)
  end

  # a cada novo teste ele invoca e soma 1
  it "prova q os valores não cacheam por teste" do
    expect(count).to eq(2)
  end
  
end
