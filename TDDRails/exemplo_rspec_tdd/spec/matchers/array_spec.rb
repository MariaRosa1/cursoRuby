RSpec::Matchers.define_negated_matcher :exclude, :include

describe Array.new([1,2,3]), collection:true do
  it "#include" do
    expect(subject).to include(2)
    expect(subject).to include(2,1)
    # expect(subject).to include([1,2]) passar array não funciona aqui
  end

  it { expect(subject).to exclude(5)}

  it "#contain_exactly" do
    expect(subject).to contain_exactly(1,3,2)
  end

  it "#match_array" do
    expect(subject).to match_array([1,3,2])
    # expect(subject).to match_array([1,2]) não funciona pois precisa ser todos
  end

end
