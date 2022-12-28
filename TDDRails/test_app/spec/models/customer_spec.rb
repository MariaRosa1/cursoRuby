require 'rails_helper'

RSpec.describe Customer, type: :model do

  it "#full_name" do
    customer = create(:customer)

    expect(customer.full_name).to start_with("Sr. ")
  end

  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }



  # it "create a customer com factories" do
  #   customer = create(:customer)

  #   expect(customer.full_name).to eq("Sr. maria rosa")
  # end


  # fixtures :customers
  # it "create a customer com fixtures" do
  #   customer = customers(:maria)

  #   expect(customer.full_name).to eq("Sr. Maria Clara")
  # end



  # it "create a customer normal" do
  #   subject.name = "Jose"
  #   subject.email = "jose@js.com"
  #   subject.save
  #   expect(subject.full_name).to eq("Sr. Jose")
  # end
end
