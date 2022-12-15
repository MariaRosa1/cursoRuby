describe "maria" do
  it "string" do
    expect(subject.size).to eq(5)
  end
end

describe [1,2,3] do
  it "Array" do
    expect(subject).to be_kind_of(Array)
  end
end