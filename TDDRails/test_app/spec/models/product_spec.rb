require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is valid with description, price and category" do
    product = create(:product)
    expect(product).to be_valid
  end

  context "Validates" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context "associations" do
    it { is_expected.to belong_to(:category) }
  end

  context "Instance methods" do
    it "return a product with a full description " do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
      # puts product.full_description
    end
  end

  
  # context "Sem o shoulda matchers" do
  #   it "is invalid without description" do
  #     product = build(:product, description: nil)
  #     product.valid?
  #     expect(product.errors[:description]).to include("can't be blank")
  #   end

  #   it "is invalid without price" do
  #     product = build(:product, price: nil, category: nil)
  #     product.valid?
  #     expect(product.errors[:price]).to include("can't be blank")
  #   end

  #   it "is invalid without category" do
  #     product = build(:product, category: nil)
  #     product.valid?
  #     expect(product.errors[:category]).to include("can't be blank")
  #   end
  # end


  context "meus testes" do
    it "is false without description" do
      product = build(:product, description: nil)
      expect(product.valid?).to be_falsey
    end

    it "is invalid without description" do
      product = build(:product, description: nil)
      expect(product).to be_invalid
    end

    # it "Tentando teste" do
    #   product = create(:product)
    #   expect(product.description).to be_kind_of(String)
    # end
  end
end
