describe "Matchers de comparação" do

  # it "be_between inclusive", :aggregate_failures do
  #   expect(5).to be_between(2,7).inclusive
  #   expect(1).to be_between(2,7).inclusive
  #   expect(8).to be_between(2,7).inclusive
  # end

  # it "be_between exclusive" do
  #   aggregate_failures do
  #     expect(5).to be_between(2,7).exclusive
  #     expect(7).to be_between(2,7).exclusive
  #     expect(2).to be_between(2,7).exclusive
  #   end


  # dps de configurar no spec_helper
    it "be_between inclusive" do
      expect(5).to be_between(2,7).inclusive
      expect(1).to be_between(2,7).inclusive
      expect(8).to be_between(2,7).inclusive
    end

    it "be_between exclusive" do
      expect(5).to be_between(2,7).exclusive
      expect(7).to be_between(2,7).exclusive
      expect(2).to be_between(2,7).exclusive
    end
end